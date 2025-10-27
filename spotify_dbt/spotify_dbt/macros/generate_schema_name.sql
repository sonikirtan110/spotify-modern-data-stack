{% macro generate_schema_name(custom_schema_name, node) -%}
  {#
    Force dbt to use the profile's target.schema (no package/project prefix).
    If a model defines a custom schema (custom_schema_name), use that; otherwise
    use target.schema directly.
  #}
  {%- if custom_schema_name is not none -%}
    {{ return(custom_schema_name) }}
  {%- else -%}
    {{ return(target.schema) }}
  {%- endif -%}
{%- endmacro %}
