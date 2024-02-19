--------------------------------------------------------
--  ������ ������ - �����-2��-15-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TBL_COMMENT
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."TBL_COMMENT" 
   (	"COMMENTNO" NUMBER, 
	"BOARDNO" NUMBER, 
	"CMT" VARCHAR2(100 BYTE), 
	"USERID" VARCHAR2(100 BYTE), 
	"DELETEYN" VARCHAR2(10 BYTE), 
	"PCOMMENTNO" NUMBER, 
	"CDATETIME" DATE, 
	"UDATETIME" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.TBL_COMMENT
SET DEFINE OFF;
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (1,1,'qwd','admin','N',null,to_date('24/01/29','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (2,1,'qweqw','admin','N',null,to_date('24/01/29','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (3,1,'qweqw','admin','N',null,to_date('24/01/29','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (4,2,'��� 444','hong123','N',null,to_date('23/12/28','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (5,2,'��� 555','hong123','N',null,to_date('23/12/28','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (5,26,'wef','admin','N',null,to_date('24/01/30','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (6,3,'HI','hong123','N',null,to_date('23/12/28','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (7,26,'wef','admin','N',null,to_date('24/01/30','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (8,2,'rtet','admin','N',null,to_date('24/01/29','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (9,2,'rtet','hommefatale','N',null,to_date('24/01/29','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (10,2,'wer','hommefatale','N',null,to_date('24/01/29','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (11,2,'wer','hommefatale','N',null,to_date('24/01/29','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (75,88,'������������','test123','N',null,to_date('24/02/15','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (12,1,'qweqw','admin','N',null,to_date('24/01/29','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (76,2,'��������������������','test123','N',null,to_date('24/02/15','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (77,81,'����������������ä
','test123','N',null,to_date('24/02/15','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (13,25,'erg','admin','N',null,to_date('24/01/30','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (14,25,'wef','admin','N',null,to_date('24/01/30','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (15,25,'wef','admin','N',null,to_date('24/01/30','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (16,25,'tre','admin','N',null,to_date('24/01/30','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (17,25,'dqwd','admin','N',null,to_date('24/01/30','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (18,25,'dqwd','admin','N',null,to_date('24/01/30','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (19,25,'afasdf','admin','N',null,to_date('24/01/30','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (20,25,'wef','admin','N',null,to_date('24/01/30','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (21,25,'qwdq','admin','N',null,to_date('24/01/30','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (22,25,'qwdqwd','admin','N',null,to_date('24/01/30','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (23,25,'qwf','admin','N',null,to_date('24/01/30','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (24,25,'qwr','admin','N',null,to_date('24/01/30','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (73,88,'�����Ǥ���','test123','N',null,to_date('24/02/15','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (74,88,'������','test123','N',null,to_date('24/02/15','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (78,81,'�������ä��ä����������ä������ä�����
','test123','N',null,to_date('24/02/15','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (79,81,'�氡�氡 ����
','test123','N',null,to_date('24/02/15','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (80,8,'����','test123','N',null,to_date('24/02/15','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (81,1,'��Ȫ~~~','test123','N',null,to_date('24/02/15','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
Insert into SYSTEM.TBL_COMMENT (COMMENTNO,BOARDNO,CMT,USERID,DELETEYN,PCOMMENTNO,CDATETIME,UDATETIME) values (82,88,'��������','test123','N',null,to_date('24/02/15','RR/MM/DD'),to_date('24/02/15','RR/MM/DD'));
--------------------------------------------------------
--  Constraints for Table TBL_COMMENT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."TBL_COMMENT" MODIFY ("COMMENTNO" NOT NULL ENABLE);
