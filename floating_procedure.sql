DELIMITER //

CREATE PROCEDURE fl(IN ip VARCHAR(100))
BEGIN
	DECLARE i int;
	SET i=5;

WHILE i<15 DO
	INSERT INTO floating_ips(created_at,updated_at,deleted,id,address,auto_assigned,pool,interface)
	VALUES(now(),NOW(),0,i,CONCAT(ip,i),0,'nova','eth0');
	#UPDATE floating_ips SET address=address+x;
	SET i=i+1;
	END WHILE;

END //

DELIMITER ;
