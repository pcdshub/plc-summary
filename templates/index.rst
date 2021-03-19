PLC Summary
-----------

.. list-table:: Project Versions
    :header-rows: 1

    * - PLC
      - Version
      - Documentation
{% for project in projects.values() | sort(attribute="git_info.repo_slug") %}
    * - `{{ project.git_info.repo_slugs[0] }} <{{ project.git_info.repo_urls[0] }}>`_
      - `{{ project.git_info.describe }} <{{ project.git_info.tree_urls[0] }}>`_
      - `{{ project.git_info.repo_slugs[0] }} Docs <{{ project.git_info.doc_urls[0] }}>`_
{% endfor %}

.. toctree::
    :maxdepth: 3
    :caption: Summary Information
    :glob:

    axes
    versions


Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
