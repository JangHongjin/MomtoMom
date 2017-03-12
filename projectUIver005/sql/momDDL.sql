-- ��� �����
DROP TABLE momuser cascade constraint;


CREATE TABLE momuser (
		usr_nick				VARCHAR2(20)	PRIMARY KEY,
		usr_email				VARCHAR2(20),
		usr_pw					VARCHAR2(20),
		usr_birth				CHAR(8),
		usr_com					VARCHAR2(10),
		usr_grant				VARCHAR2(10),
		usr_phone				CHAR(11),				
		usr_exist				NUMBER(1)	DEFAULT 1
);

