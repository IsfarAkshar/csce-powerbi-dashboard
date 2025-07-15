
-- 1. Escalation Rate by Channel
SELECT 
  channel,
  ROUND(100.0 * SUM(CASE WHEN status = 'Escalated' THEN 1 ELSE 0 END) / COUNT(*), 2) AS escalation_rate
FROM tickets
GROUP BY channel;

-- 2. Average Resolution Time by Agent
SELECT 
  agent_id,
  ROUND(AVG(resolution_time), 2) AS avg_resolution_time
FROM tickets
GROUP BY agent_id;

-- 3. Daily Ticket Volume
SELECT 
  ticket_date,
  COUNT(*) AS total_tickets
FROM tickets
GROUP BY ticket_date
ORDER BY ticket_date;

-- 4. Ticket Status Breakdown by Channel
SELECT 
  channel,
  status,
  COUNT(*) AS total
FROM tickets
GROUP BY channel, status;

-- 5. Average Satisfaction Score by Agent
SELECT 
  agent_id,
  ROUND(AVG(satisfaction_score), 2) AS avg_score
FROM tickets
GROUP BY agent_id;
