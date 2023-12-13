  UPDATE member
SET m_cash = m_cash - (SELECT r_cash FROM record WHERE r_num = 103)
WHERE m_num = (SELECT m_num FROM record WHERE r_num = 103);   

UPDATE member
		SET m_cash = m_cash +
		CASE
		WHEN (SELECT r_type FROM record WHERE r_num = #{r_num}) = '결제' THEN
		(SELECT r_cash FROM record WHERE r_num = #{r_num})
		ELSE
		- (SELECT r_cash FROM record WHERE r_num = #{r_num})
		END
		WHERE m_num = (SELECT m_num FROM record WHERE r_num = #{r_num});