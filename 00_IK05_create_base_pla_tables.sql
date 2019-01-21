--Drop table NewGen.PLA_MARA;
--Drop table NewGen.PLA_MARM;

Drop table koshovec.PLA_MARA;
Create table koshovec.PLA_MARA
as
select
   ltrim("��������", '0')   "��������",
   "���",
   "��� ���������",
   "������ ����������",
   "���",
   "�� ������ �� ��������",
   "��� ������",
   "��� �����",
   "�� ����",
   "������",
   "�� ������",
   "������� ������������ �������",
   "����������� ����� ������ (EAN)",
   "�����",
   "������",
   "������",
   "�� ��������",
   "����������� ��������������",
   "���������� ���� ��������",
   "����� ���� ��������",
   "���������� ������ ��������",
   "�����/���� ����� ����� ������",
   "��� ������� ��� ���",
   "������ ������������ ���������",
   "������ ������������ ��� ���",
   "��� ������ ���",
   "���� ��������",
   "���� ���������� ���������"
from
   NewGen.ZDB_MARA
;
alter table PLA_MARA add Unique ("��������");


Drop table NewGen.TB_ZASSTAT_HIST;
Create table NewGen.TB_ZASSTAT_HIST
as
select 
   ltrim("��������", '0')   "��������",
   "���������� �����",
   "������ ������������ ��� �����",
   "���� ���������� ���������",
   to_date('1970-01-01 ' || "����� ��������� (�����)", 'YYYY-MM-DD HH24:MI:SS')   "����� ���������",
   "����� ��������� (�����)",
   "���� ������ �������� �������"
from 
   NEWGEN.ZDB_ZASSTAT_HIST
;
alter table NEWGEN.TB_ZASSTAT_HIST add Unique ("��������", "���������� �����");


Drop table koshovec.PLA_ZASSTAT;
Create table koshovec.PLA_ZASSTAT
as
select
   T1.ZZSTATUSASS   "������ ������������ ��� �����",
   T2.TEXT   "�������� ������� ������������",
   T1.MMSTA   "������ �������", 
   T3.MTSTB   "�������� ������� �������", 
   T1.MSTAV   "������ �������",
   T4.VMSTB   "�������� ������� �������",
   T2.SPRAS   "����"
from
   Replic.ERP_ZASSTAT   T1
   inner join
   Replic.ERP_ZASSTATT   T2
      on T2.MANDT = T1.MANDT
      and T2.ZZSTATUSASS = T1.ZZSTATUSASS
   inner join
   Replic.ERP_T141T   T3
      on T3.MANDT = T1.MANDT
      and T3.SPRAS = T2.SPRAS
      and T3.MMSTA = T1.MMSTA
   inner join
   Replic.ERP_TVMST   T4
      on T4.MANDT = T1.MANDT
      and T4.SPRAS = T2.SPRAS
      and T4.VMSTA = T1.MSTAV
Where
   T1.MANDT = 400
   and
   T2.SPRAS = 'R'
;
alter table koshovec.PLA_ZASSTAT add Unique ("������ ������������ ��� �����", "����");


drop table koshovec.PLA_MARM;
create table koshovec.PLA_MARM
as
select
ltrim("��������", '0')   "��������",
"�������������� ��",
"��������� ��� �������� � ���",
"����������� ��� �������� � ���",
"��� EAN",
"��� EAN",
"������",
"�� ������",
"��� ������",
"�� ����",
"�����",
"������",
"������",
"�� ��������"
from
   NewGen.ZDB_MARM;
alter table koshovec.PLA_MARM add Unique ("��������", "�������������� ��");


drop table koshovec.pla_t006;
create table koshovec.pla_t006
as
select
T1."���������� ��",
T1."3-������� ����. ��",
T1."6-������� ����. ��",
T1."��������������������",
T1."������������ ��",
T1."����������� ������",
T1."(1)-�������",
T1."(2)-�������",
T1."��������",
T1."�������",
T1."�����������",
T1."����������",
T1."�����������������",
T1."��������������������",
T1."���������� �������",
T1."��� ISO",
T1."��������� ���",
T1."�������������",
T1."�� �����������",
T1."��������� ��",
T1."�������� ������",
T1."������� ������",
T2."��� �����",
T2."�������.",
T2."�����������",
T2."�����_1 � ��",
T2."�����_2 � ��"
from
   replic.erp_t006   T1
   left outer join
   replic.erp_t006a   T2
      on T2."�������" = T1."�������"
      and T2."���������� ��" = T1."���������� ��"
      and T2."��� �����" = 'R'
where
   T1."�������" = 400
;


drop table koshovec.pla_EINA;
create table koshovec.pla_EINA
as
select
"����-������",
"���� �������� ������",
"����, ��������� ������",
"��������",
"���������",
"����� �������� ����������",
"�� ������ �� ��������"   "�������� ���"
from
   NewGen.tmp_EINA
where
"�������� ��� ��������" is null
;
alter table koshovec.pla_EINA add Unique ("����-������");
alter table koshovec.pla_EINA add ("���" varchar2(100));

--select * from koshovec.pla_EINA;


Drop table IK05_pla_ZMAT_RESD;
Create table IK05_pla_ZMAT_RESD
as
--Select * From NEWGEN.Z14_KNA1_OLD_4
Select * From NEWGEN.ZDB_ZMAT_RESD
;

exit;

--select max("����") from NEWGEN.ZDB_ZMAT_RESD;
--select * from IK05_pla_ZMAT_RESD where "����" >= date '2018-11-02';

