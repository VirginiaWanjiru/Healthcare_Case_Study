WITH vitals_with_trends AS (
  SELECT 
      patient_id,
      measurement_date,
      heart_rate,
      blood_pressure_systolic,
      glucose_level,
      LAG(heart_rate) OVER (
        PARTITION BY patient_id
        ORDER BY measurement_date
  
      ) AS prev_heart_rate,
      LEAD (heart_rate) OVER (
        PARTITION BY patient_id
        ORDER BY measurement_date
      ) AS next_heart_rate,
      heart_rate - LAG(heart_rate) OVER (
        PARTITION BY patient_id
        ORDER BY measurement_date
      )
      AS heart_rate_change
      FROM healthcare_case_study.vitals_history
)

SELECT 
 patient_id,
 measurement_date,
 heart_rate,
 prev_heart_rate,
 next_heart_rate,
 heart_rate_change,
 CASE 
  WHEN heart_rate_change < 5 THEN 'DETERIORATING'
  WHEN heart_rate_change < -5 THEN 'IMPROVING'
  ELSE 'STABLE'
 END AS health_trend
FROM vitals_with_trends
ORDER BY patient_id, measurement_date;



