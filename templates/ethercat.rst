{%- macro chapter(title) %}
{{ title | title_fill("=") }}
{{ title }}
{{ title | title_fill("=") }}{% endmacro -%}

{%- macro section(title) %}
{{ title }}
{{ title | title_fill("-") }}{% endmacro -%}

{%- macro subsection(title) %}
{{ title }}
{{ title | title_fill("^") }}{% endmacro -%}

{%- macro subsubsection(title) %}
{{ title }}
{{ title | title_fill('"') }}{% endmacro -%}



EtherCAT Terminals by Project
=============================

{%- macro format_box(box, depth) %}
  {%- if not box.EtherCAT -%}
    (Not EtherCAT?)
  {%- else -%}
    {%- if depth % 2 == 0 -%}
      **
    {%- endif %}
    {{- box.name | trim("=+-") }} [ID: {{ box.attributes.Id }}]
    {%- if depth % 2 == 0 -%}
      **
    {%- endif %}
    {%- set ethercat = box.EtherCAT[0] %}

    {%+ if box.attributes.Disabled == "true" %}
      {{ "(**Disabled**)" }}
    {%- endif %}
    {%- if ethercat.SuName %}
      ( **SyncUnit={{ ethercat.SuName[0].text }}** )
    {%- endif %}
    {{ ethercat.attributes.Type }}
  {%- endif -%}
{%- endmacro -%}

{%- macro format_tree(box, children, depth) %}
{% set box_text = format_box(box, depth) %}
#. {{ box_text }}

  {% for child, grandchildren in children.items() %}
    {% set child_text = format_tree(child, grandchildren, depth + 1) %}
    {{ child_text | indent(width=4, first=False, blank=False) }}

  {% endfor %}
{%- endmacro -%}

{% for project in projects.values() | sort(attribute="git_info.repo_slug") %}

{{ section(project.git_info.repo_slug) }}

{% for box, children in get_box_hierarchy(project).items() %}

{% set child_text = format_tree(box, children, 0) %}
{{ child_text }}

{% endfor %}{# for box_id... #}
{% endfor %}{# for project... #}
