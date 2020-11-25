TSPROJ=$(shell find . -name '*.tsproj')
# TSPROJ=lcls-plc-tmo-vac/plc-tmo-vac/plc-tmo-vac.tsproj

all: axes.rst docs

%.rst:
	pytmc template --template templates/$@ $(TSPROJ) > docs/source/$@

docs:
	make -C docs html

.PHONY: all docs
