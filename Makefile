TSPROJ=$(shell find . -name '*.tsproj')
# TSPROJ=lcls-plc-tmo-vac/plc-tmo-vac/plc-tmo-vac.tsproj lcls-plc-lfe-motion/plc-lfe-motion/plc-lfe-motion.tsproj

all: axes.rst versions.rst docs

%.rst:
	pytmc template --template templates/$@ $(TSPROJ) > docs/source/$@

initialize:
	git submodule update --init --recursive

update_remotes:
	git submodule update --init --recursive --remote

docs:
	make -C docs html

gh-pages:
	master_commit=$$(git rev-parse --short HEAD) && \
		git checkout gh-pages && \
		cp -R docs/build/html/ . && \
		git commit -am "Regenerated docs for commit $$master_commit"

.PHONY: all docs initialize update_remotes gh-pages
