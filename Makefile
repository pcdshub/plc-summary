TSPROJ=$(shell find . -name '*.tsproj')
# TSPROJ=lcls-plc-tmo-vac/plc-tmo-vac/plc-tmo-vac.tsproj lcls-plc-lfe-motion/plc-lfe-motion/plc-lfe-motion.tsproj

all: docs

initialize:
	git submodule update --init --recursive

update_remotes:
	git submodule foreach --recursive 'git fetch --tags || :'
	git submodule update --init --recursive --remote

docs:
	make -C docs html

gh-pages:
	master_commit=$$(git rev-parse --short HEAD) && \
		git checkout gh-pages && \
		cp -R docs/build/html/* . && \
		git add *.html _static && \
		git commit -am "Regenerated docs for commit $$master_commit"

all_repos.txt:
	gh repo list pcdshub --limit=1000 --json="name" --jq=".[].name" | sort > all_repos.txt

.PHONY: all generate-docs docs initialize update_remotes gh-pages
