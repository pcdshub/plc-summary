TSPROJ=$(shell find . -name '*.tsproj')
# TSPROJ=lcls-plc-tmo-vac/plc-tmo-vac/plc-tmo-vac.tsproj

all: axes.rst docs

%.rst:
	pytmc template --template templates/$@ $(TSPROJ) > docs/source/$@

initialize:
	git submodule update --init --recursive

update_remotes:
	git submodule update --init --recursive --remote

docs:
	make -C docs html

.PHONY: all docs initialize update_remotes
