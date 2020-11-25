Projects
--------

{% for name, project in projects.items() %}
- {{ name.stem }}
{% endfor %}

Axes
----

{% set nc_counts = [] %}
{% for name, project in projects.items() %}
{% set nc = get_nc(project) %}
{% if nc %}
{% set _ = nc_counts.append(max(nc.axis_by_id or [0])) %}
{% endif %}
{% endfor %}

{% if nc_counts %}
.. list-table:: Axis Names
    :header-rows: 1

    * - PLC / Axis
{% for name, project in projects.items() %}
{% set nc = get_nc(project) %}
{% if nc.axis_by_id %}
      - {{ name.stem }}
{% endif %}
{% endfor %}

{% for axis_number in range(1, max(nc_counts) + 1) %}
    * - Axis {{ axis_number }}
{% for name, project in projects.items() %}
{% set nc = get_nc(project) %}
{% if nc %}
      - {{ nc.axis_by_id.get(axis_number, '').name }}
{% endif %}
{% endfor %}
{% endfor %}
{% endif %}
