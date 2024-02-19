--------------------------------------------------------
--  파일이 생성됨 - 목요일-2월-15-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TBL_BOARD
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."TBL_BOARD" 
   (	"BOARDNO" NUMBER, 
	"TITLE" VARCHAR2(100 BYTE), 
	"CONTENTS" VARCHAR2(1000 BYTE), 
	"HIT" NUMBER, 
	"USERID" VARCHAR2(20 BYTE), 
	"KIND" VARCHAR2(10 BYTE), 
	"CDATETIME" DATE, 
	"UDATETIME" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.TBL_BOARD
SET DEFINE OFF;
Insert into SYSTEM.TBL_BOARD (BOARDNO,TITLE,CONTENTS,HIT,USERID,KIND,CDATETIME,UDATETIME) values (1,'tttt','ttttt',136,'hong123','2',to_date('24/01/25','RR/MM/DD'),to_date('24/01/26','RR/MM/DD'));
Insert into SYSTEM.TBL_BOARD (BOARDNO,TITLE,CONTENTS,HIT,USERID,KIND,CDATETIME,UDATETIME) values (2,'자바~~~~','즐거웠다~~k,k,k,',83,'hong123','2',to_date('24/01/25','RR/MM/DD'),to_date('24/01/29','RR/MM/DD'));
Insert into SYSTEM.TBL_BOARD (BOARDNO,TITLE,CONTENTS,HIT,USERID,KIND,CDATETIME,UDATETIME) values (3,'테스트 1','테스트 내용 1',22,'hong123','2',to_date('24/01/26','RR/MM/DD'),to_date('24/01/26','RR/MM/DD'));
Insert into SYSTEM.TBL_BOARD (BOARDNO,TITLE,CONTENTS,HIT,USERID,KIND,CDATETIME,UDATETIME) values (4,'테스트 2','테스트 sdf내용 2',124,'hong123','2',to_date('24/01/26','RR/MM/DD'),to_date('24/01/30','RR/MM/DD'));
Insert into SYSTEM.TBL_BOARD (BOARDNO,TITLE,CONTENTS,HIT,USERID,KIND,CDATETIME,UDATETIME) values (5,'ㅈㅂㄱㅂㅈ','ㅂㅈㄱㅂㅈㄱㅈㅂ',14,'hommefatale','2',to_date('24/02/08','RR/MM/DD'),to_date('24/02/09','RR/MM/DD'));
Insert into SYSTEM.TBL_BOARD (BOARDNO,TITLE,CONTENTS,HIT,USERID,KIND,CDATETIME,UDATETIME) values (81,'123132','123123',13,'test123','2',to_date('24/02/14','RR/MM/DD'),null);
Insert into SYSTEM.TBL_BOARD (BOARDNO,TITLE,CONTENTS,HIT,USERID,KIND,CDATETIME,UDATETIME) values (7,'rqwr','qwrqwr',287,'hommefatale','2',to_date('24/01/26','RR/MM/DD'),to_date('24/01/26','RR/MM/DD'));
Insert into SYSTEM.TBL_BOARD (BOARDNO,TITLE,CONTENTS,HIT,USERID,KIND,CDATETIME,UDATETIME) values (8,'ㅂㅈㄼㅈㄹ','ㅂㅈㄼㅈㄹ',81,'test123','2',to_date('24/02/06','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_BOARD (BOARDNO,TITLE,CONTENTS,HIT,USERID,KIND,CDATETIME,UDATETIME) values (82,'망할','쉣',3,'test123','2',to_date('24/02/14','RR/MM/DD'),null);
Insert into SYSTEM.TBL_BOARD (BOARDNO,TITLE,CONTENTS,HIT,USERID,KIND,CDATETIME,UDATETIME) values (83,'안녕','헤헤',15,'test123','2',to_date('24/02/14','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_BOARD (BOARDNO,TITLE,CONTENTS,HIT,USERID,KIND,CDATETIME,UDATETIME) values (88,'werwerwrwerwe','wrewrwer',113,'test123','2',to_date('24/02/15','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_BOARD (BOARDNO,TITLE,CONTENTS,HIT,USERID,KIND,CDATETIME,UDATETIME) values (89,'어렵다','맞아!',3,'test123','2',to_date('24/02/15','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
