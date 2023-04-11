# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

html: generate

update_remotes:
	$(MAKE) -C ../ update_remotes

generate: update_remotes
	$(MAKE) update_remotes
	# if ! command -v pytmc 2>/dev/null; then \
	# 	echo "pytmc not found; installing requirements."; \
	# 	python -m pip install -r requirements.txt; \
	# fi
	pytmc template \
		--template ../templates/index.rst:source/index.rst \
		--template ../templates/axes.rst:source/axes.rst \
		--template ../templates/versions.rst:source/versions.rst \
		--template ../templates/ethercat.rst:source/ethercat.rst \
		$(shell find ../plcs -name '*.tsproj')

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
