UPDATE 'bonuscards' SET status = 'expired' WHERE end_date < NOW()

CREATE EVENT
ON SCHEDULE EVERY 1 DAY
STARTS '2015-01-18 00:00:00'
DO
UPDATE 'bonuscards' SET status = 'expired' WHERE end_date < NOW()