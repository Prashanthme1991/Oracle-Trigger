create or replace TRIGGER delete_app_param_lkp
AFTER INSERT OR UPDATE OR DELETE ON team.app_param_lkp
declare
c 	INTEGER;
nr	INTEGER;
v_sql	VARCHAR2(32767);
x	INTEGER;
y	INTEGER;
z	INTEGER;
BEGIN
IF INSERTING
		x := insert into team.app_param_lkp values ('[I] :old.param_id ='|| :old.param_id|| ',:new.param_id ='|| :new.param_id,'[I] :old.param_cd ='|| :old.param_cd|| ',:new.param_cd ='|| :new.param_cd)
		v_sql :='exec dbo.refresh_app_param_lkp';
         c  := DBMS_HS_PASSTHROUGH.OPEN_CURSOR@prodmssql_sandal.uis.edu;
 
    DBMS_HS_PASSTHROUGH.PARSE@prodmssql_sandal(c, v_sql ,x);
    nr := DBMS_HS_PASSTHROUGH.EXECUTE_NON_QUERY@prodmssql_sandal.uis.edu(c);
    DBMS_HS_PASSTHROUGH.CLOSE_CURSOR@prodmssql_sandal.uis.edu(c);
	End If;
	
IF UPDATING
	y :=  update into team.app_param_lkp values ('[U] :old.param_id ='|| :old.param_id|| ',:new.param_id ='|| :new.param_id,'[I] :old.param_cd ='|| :old.param_cd|| ',:new.param_cd ='|| :new.param_cd)
	v_sql :='exec dbo.refresh_app_param_lkp';
         c  := DBMS_HS_PASSTHROUGH.OPEN_CURSOR@prodmssql_sandal.uis.edu;
 
    DBMS_HS_PASSTHROUGH.PARSE@prodmssql_sandal(c, v_sql ,y);
    nr := DBMS_HS_PASSTHROUGH.EXECUTE_NON_QUERY@prodmssql_sandal.uis.edu(c);
    DBMS_HS_PASSTHROUGH.CLOSE_CURSOR@prodmssql_sandal.uis.edu(c);
	End If;
	
	
IF DELETING
	z := delete from team.app_param_lkp values('[D] ::old.param_id ='|| :old.param_id|| ',:new.param_id ='|| :new.param_id,'[I] :old.param_cd ='|| :old.param_cd|| ',:new.param_cd ='|| :new.param_cd)
	c  := DBMS_HS_PASSTHROUGH.OPEN_CURSOR@prodmssql_sandal.uis.edu;
 
    DBMS_HS_PASSTHROUGH.PARSE@prodmssql_sandal(c, v_sql ,z);
    nr := DBMS_HS_PASSTHROUGH.EXECUTE_NON_QUERY@prodmssql_sandal.uis.edu(c);
    DBMS_HS_PASSTHROUGH.CLOSE_CURSOR@prodmssql_sandal.uis.edu(c);
	End If;