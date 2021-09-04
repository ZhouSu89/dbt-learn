{%macro limit_data_in_dev(column_name,last_days=3)%}
{%if target.name=='dev'%}
where {{column_name}}>=date_add(CURRENT_DATE, INTERVAL -{{last_days}} DAY)
{%endif%}
{%endmacro%}