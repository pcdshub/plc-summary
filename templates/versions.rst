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

{% set all_references = [] %}
{% for project_path, project in projects.items() %}
    {% for name in get_library_versions(project) %}
        {% if name not in all_references %}
            {% set _ = all_references.append(name) %}
        {% endif %}
    {% endfor %}
{% endfor %}

{% set all_plcs = [] %}
{% for project_path, project in projects.items() %}
    {% for plc in project.plcs %}
        {% set _ = all_plcs.append(plc) %}
    {% endfor %}
{% endfor %}

Dependencies
============

By PLC
------

{% for plc in all_plcs | sort(attribute='name') %}
{{ subsection(plc.name) }}

{% set plc_versions = get_library_versions(plc) %}
.. list-table:: {{ plc.filename.parts[-5:-3] | join('/') }}
    :header-rows: 1

    * - Dependency
      - Library
      - Placeholder
      - Resolution

{% for ref_name, ref_info in plc_versions.items()|sort %}
    * - {{ref_name}}
{% for category in ["LibraryReference", "PlaceholderReference", "PlaceholderResolution"] %}
    {% if category in ref_info %}
      - ``{{ ref_info[category].version }}`` {{ ref_info[category].vendor_short }}

    {% else %}
      -

    {% endif %}
{% endfor %}
{% endfor %}
{% endfor %}

By Library
----------

{% for ref_name in all_references|sort %}

{{ subsection(ref_name) }}

.. list-table::
    :header-rows: 1

    * - Project
      - Library
      - Placeholder
      - Resolution

{% for plc in all_plcs | sort(attribute='name') %}
{% set plc_versions = get_library_versions(plc) %}
{% if ref_name in plc_versions %}
    * - {{ plc.filename.parts[-4:-3] | join('/') }}/{{ plc.name }}
{% for category in ["LibraryReference", "PlaceholderReference", "PlaceholderResolution"] %}
    {% if category in plc_versions[ref_name] %}
      - ``{{ plc_versions[ref_name][category].version }}``, {{ plc_versions[ref_name][category].vendor_short }}

    {% else %}
      -

    {% endif %}
{% endfor %}
{% endif %}

{% endfor %}
{% endfor %}
