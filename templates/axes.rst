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

Axes by Project
===============

This summary was generated |today|.

{% for project in projects.values() | sort(attribute="git_info.repo_slug") %}
{% set nc = get_nc(project) %}
{% set nc_count = max(nc.axis_by_id or [0]) %}

{{ section(project.git_info.repo_slug) }}

Version: `{{ project.git_info.describe }} <{{ project.git_info.tree_urls[0] }}>`_
Docs: `{{ project.git_info.repo_slugs[0] }} Docs <{{ project.git_info.doc_urls[0] }}>`_

{% if nc_count == 0 %}
No NC axes.
{% else %}
.. list-table:: {{ project.git_info.repo_slug }} Axes
    :header-rows: 1

    * - Axis ID
      - Axis Name

{% for axis_id, axis in nc.axis_by_id.items() | sort() %}
    * - Axis {{ axis_id }}
      - {{ axis.name }}
{% endfor %}
{% endif %}
{% endfor %}
