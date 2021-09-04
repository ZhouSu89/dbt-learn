{% macro cents_to_dollars(column_name,decimal_place=2)-%}
round({{column_name}}/100, {{decimal_place}})
{%-endmacro-%}