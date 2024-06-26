--------------------------------------------------------
--  ������ ������ - �����-2��-15-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TBL_MEMBER1
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."TBL_MEMBER1" 
   (	"USERID" VARCHAR2(20 BYTE), 
	"PWD" VARCHAR2(50 BYTE), 
	"USERNAME" VARCHAR2(100 BYTE), 
	"PHONE" VARCHAR2(20 BYTE), 
	"GENDER" VARCHAR2(10 BYTE), 
	"HOBBY1" VARCHAR2(50 BYTE), 
	"HOBBY2" VARCHAR2(50 BYTE), 
	"HOBBY3" VARCHAR2(50 BYTE), 
	"CMT" VARCHAR2(255 BYTE), 
	"CNT" NUMBER DEFAULT 0, 
	"STATUS" VARCHAR2(2 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.TBL_MEMBER1
SET DEFINE OFF;
Insert into SYSTEM.TBL_MEMBER1 (USERID,PWD,USERNAME,PHONE,GENDER,HOBBY1,HOBBY2,HOBBY3,CMT,CNT,STATUS) values ('admin','admin','�����','01029594125','����','����','����','��ȭ','   �Ⱦ�',0,'A');
Insert into SYSTEM.TBL_MEMBER1 (USERID,PWD,USERNAME,PHONE,GENDER,HOBBY1,HOBBY2,HOBBY3,CMT,CNT,STATUS) values ('hong123','1234','ȫ�浿',null,'����',null,null,null,null,0,'U');
Insert into SYSTEM.TBL_MEMBER1 (USERID,PWD,USERNAME,PHONE,GENDER,HOBBY1,HOBBY2,HOBBY3,CMT,CNT,STATUS) values ('test123','123','�����','01029594125','����','����','�','��ȭ','            �Ⱦ�',0,'U');
Insert into SYSTEM.TBL_MEMBER1 (USERID,PWD,USERNAME,PHONE,GENDER,HOBBY1,HOBBY2,HOBBY3,CMT,CNT,STATUS) values ('hommefatale','1234','ħ��³��ǹ���','01029594125','����',null,null,null,null,0,'U');
--------------------------------------------------------
--  DDL for Index SYS_C007597
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007597" ON "SYSTEM"."TBL_MEMBER1" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table TBL_MEMBER1
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."TBL_MEMBER1" ADD PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
