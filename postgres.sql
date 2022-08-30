CREATE TABLE messages AS (
SELECT GENERATE_SERIES::numeric id
     , CASE WHEN random() < 0.01 THEN 'N' ELSE 'Y' END processed
     , CAST(trunc(random() * 100) AS NUMERIC) receiver
     , 'junk' message
  FROM GENERATE_SERIES(0, 999999)
);


CREATE INDEX messages_todo
          ON messages (receiver, processed);
