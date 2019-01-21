--Drop table NewGen.PLA_MARA;
--Drop table NewGen.PLA_MARM;

Drop table koshovec.PLA_MARA;
Create table koshovec.PLA_MARA
as
select
   ltrim("Ìàòåğèàë", '0')   "Ìàòåğèàë",
   "Ìäò",
   "Âèä ìàòåğèàëà",
   "Ãğóïïà ìàòåğèàëîâ",
   "ÁÅÈ",
   "ÅÈ çàêàçà íà ïîñòàâêó",
   "Âåñ áğóòòî",
   "Âåñ íåòòî",
   "ÅÈ âåñà",
   "Îáúåìû",
   "ÅÈ îáúåìà",
   "Óğîâåíü ïëàíèğîâàíèÿ ïîòğåáí",
   "Åâğîïåéñêèé íîìåğ òîâàğà (EAN)",
   "Äëèíà",
   "Øèğèíà",
   "Âûñîòà",
   "ÅÈ ğàçìåğîâ",
   "Êîıôôèöèåíò øòàáåëèğîâàíèÿ",
   "Îñòàòî÷íûé ñğîê ãîäíîñòè",
   "Îáùèé ñğîê ãîäíîñòè",
   "Ïğîöåíòíàÿ ñòàâêà õğàíåíèÿ",
   "ÌèíÑÃ/äàòà èñòå÷ ñğîêà õğàíåí",
   "Êîä ïåğèîäà äëÿ ÌÑÃ",
   "Ïîëíîå íàèìåíîâàíèå ìàòåğèàëà",
   "Ñòàòóñ àññîğòèìåíòà äëÿ ìàò",
   "Òèï óğîâíÿ öåí",
   "Äàòà ñîçäàíèÿ",
   "Äàòà ïîñëåäíåãî èçìåíåíèÿ"
from
   NewGen.ZDB_MARA
;
alter table PLA_MARA add Unique ("Ìàòåğèàë");


Drop table NewGen.TB_ZASSTAT_HIST;
Create table NewGen.TB_ZASSTAT_HIST
as
select 
   ltrim("Ìàòåğèàë", '0')   "Ìàòåğèàë",
   "Ïîğÿäêîâûé íîìåğ",
   "Ñòàòóñ àññîğòèìåíòà äëÿ ìàòåğ",
   "Äàòà ïîñëåäíåãî èçìåíåíèÿ",
   to_date('1970-01-01 ' || "Âğåìÿ èçìåíåíèÿ (òåêñò)", 'YYYY-MM-DD HH24:MI:SS')   "Âğåìÿ èçìåíåíèÿ",
   "Âğåìÿ èçìåíåíèÿ (òåêñò)",
   "Äàòà íà÷àëà äåéñòâèÿ ñòàòóñà"
from 
   NEWGEN.ZDB_ZASSTAT_HIST
;
alter table NEWGEN.TB_ZASSTAT_HIST add Unique ("Ìàòåğèàë", "Ïîğÿäêîâûé íîìåğ");


Drop table koshovec.PLA_ZASSTAT;
Create table koshovec.PLA_ZASSTAT
as
select
   T1.ZZSTATUSASS   "Ñòàòóñ àññîğòèìåíòà äëÿ ìàòåğ",
   T2.TEXT   "Íàçâàíèå ñòàòóñà àññîğòèìåíòà",
   T1.MMSTA   "Ñòàòóñ çàêóïêè", 
   T3.MTSTB   "Íàçâàíèå ñòàòóñà çàêóïêè", 
   T1.MSTAV   "Ñòàòóñ ïğîäàæè",
   T4.VMSTB   "Íàçâàíèå ñòàòóñà ïğîäàæè",
   T2.SPRAS   "ßçûê"
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
alter table koshovec.PLA_ZASSTAT add Unique ("Ñòàòóñ àññîğòèìåíòà äëÿ ìàòåğ", "ßçûê");


drop table koshovec.PLA_MARM;
create table koshovec.PLA_MARM
as
select
ltrim("Ìàòåğèàë", '0')   "Ìàòåğèàë",
"Àëüòåğíàòèâíàÿ ÅÈ",
"×èñëèòåëü äëÿ ïåğåñ÷åò â ÁÅÈ",
"Çíàìåíàòåëü äëÿ ïåğåñ÷åò â ÁÅÈ",
"Êîä EAN",
"Òèï EAN",
"Îáúåìû",
"ÅÈ îáúåìà",
"Âåñ áğóòòî",
"ÅÈ âåñà",
"Äëèíà",
"Øèğèíà",
"Âûñîòà",
"ÅÈ ğàçìåğîâ"
from
   NewGen.ZDB_MARM;
alter table koshovec.PLA_MARM add Unique ("Ìàòåğèàë", "Àëüòåğíàòèâíàÿ ÅÈ");


drop table koshovec.pla_t006;
create table koshovec.pla_t006
as
select
T1."Âíóòğåííÿÿ ÅÈ",
T1."3-çíà÷íàÿ âíåø. ÅÈ",
T1."6-çíà÷íàÿ âíåø. ÅÈ",
T1."ÄåñĞàçğÄëÿÎêğóãëåíèÿ",
T1."Êîììåğ÷åñêàÿ ÅÈ",
T1."Ñòîèìîñòíîå îáëèãî",
T1."(1)-åäèíèöà",
T1."(2)-åäèíèöà",
T1."Âåëè÷èíà",
T1."Ñ÷åò÷èê",
T1."Çíàìåíàòåëü",
T1."Ïîêàçàòåëü",
T1."ÄîïîëíèòÊîíñòàíòà",
T1."İêñïîíåíòÏëàâÇàïÿòîé",
T1."Äåñÿòè÷íûå ğàçğÿäû",
T1."Êîä ISO",
T1."Íà÷àëüíûé êîä",
T1."ÇíÒåìïåğàòóğû",
T1."ÅÈ òåìïåğàòóğû",
T1."Ñåìåéñòâî ÅÈ",
T1."Çíà÷åíèå ïå÷àòè",
T1."Åäèíèöà ïå÷àòè",
T2."Êîä ÿçûêà",
T2."Êîììåğ÷.",
T2."Òåõíè÷åñêîå",
T2."Òåêñò_1 ê ÅÈ",
T2."Òåêñò_2 ê ÅÈ"
from
   replic.erp_t006   T1
   left outer join
   replic.erp_t006a   T2
      on T2."Ìàíäàíò" = T1."Ìàíäàíò"
      and T2."Âíóòğåííÿÿ ÅÈ" = T1."Âíóòğåííÿÿ ÅÈ"
      and T2."Êîä ÿçûêà" = 'R'
where
   T1."Ìàíäàíò" = 400
;


drop table koshovec.pla_EINA;
create table koshovec.pla_EINA
as
select
"Èíôî-çàïèñü",
"Äàòà ñîçäàíèÿ çàïèñè",
"Ëèöî, ñîçäàâøåå çàïèñü",
"Ìàòåğèàë",
"Ïîñòàâùèê",
"Ìåòêà ãëàâíîãî ïîñòàâùèêà",
"ÅÈ çàêàçà íà ïîñòàâêó"   "Íàçâàíèå ÅÈÇ"
from
   NewGen.tmp_EINA
where
"Ïîìåòèòü äëÿ óäàëåíèÿ" is null
;
alter table koshovec.pla_EINA add Unique ("Èíôî-çàïèñü");
alter table koshovec.pla_EINA add ("ÅÈÇ" varchar2(100));

--select * from koshovec.pla_EINA;


Drop table IK05_pla_ZMAT_RESD;
Create table IK05_pla_ZMAT_RESD
as
--Select * From NEWGEN.Z14_KNA1_OLD_4
Select * From NEWGEN.ZDB_ZMAT_RESD
;

exit;

--select max("Äàòà") from NEWGEN.ZDB_ZMAT_RESD;
--select * from IK05_pla_ZMAT_RESD where "Äàòà" >= date '2018-11-02';

