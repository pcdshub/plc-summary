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

This summary was generated |today|.

{% macro format_box_html(box, depth) %}
  {%- if not box.EtherCAT -%}
    (Not EtherCAT?)
  {%- else -%}
    {%- set ethercat = box.EtherCAT[0] %}
    <table width="100%">
      <tr>
        <td width="10%">
          ID={{ box.attributes.Id }}:
        </td>
        <td width="75%">
          {{- box.name | trim("=+-") }}
        </td>
        <td>
          {%- if ethercat.SuName %}
            <b>
              SyncUnit {{ ethercat.SuName[0].text }}
            </b>
          {%- endif %}
        </td>
      </tr>
      <tr>
        <td>
          {%+ if box.attributes.Disabled == "true" %}
            <b>
              Disabled
            </b>
          {%- endif %}
        </td>
        <td colspan="2">
          {{ ethercat.attributes.Type }}
        </td>
      </tr>
    </table>
  {%- endif -%}
{%- endmacro -%}

{%- macro format_tree_html(box, children, depth) %}
  {% set box_text = format_box_html(box, depth) %}
  <li>
  {% if not children %}
    {{ box_text }}
  {% else %}
    <details open>
      <summary>
        {{ box_text }}
      </summary>
      <ul>
        {% for child, grandchildren in children.items() %}

          {% set child_text = format_tree_html(child, grandchildren, depth + 1) %}
          {{ child_text | indent(width=10, first=False, blank=False) }}

        {% endfor %}
      </ul>
    </details>
  {% endif %}
  </li>

{%- endmacro -%}

{% for project in projects.values() | sort(attribute="git_info.repo_slug") %}

{{ section(project.git_info.repo_slug) }}

Version `{{ project.git_info.describe }} <{{ project.git_info.tree_urls[0] }}>`_ - `Documentation <{{ project.git_info.doc_urls[0] }}>`_

.. raw:: html

    <ul class="tree">

{% for box, children in get_box_hierarchy(project).items() %}

{% set child_text = format_tree_html(box, children, 0) %}


    {{ child_text }}

{% endfor %}{# for box_id... #}

    </ul>

{% endfor %}{# for project... #}
