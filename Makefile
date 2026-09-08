# SPDX-License-Identifier: Beerware

# Play nice https://specifications.freedesktop.org/basedir/latest/
XDG_CONFIG_HOME ?= $(HOME)/.local
XDG_DATA_HOME ?= $(XDG_CONFIG_HOME)/share
DATADIR = $(XDG_DATA_HOME)/pandoc

install:
	install -D -m 0644 mermaid-ascii.lua $(DATADIR)/filters/mermaid-ascii.lua
	install -D -m 0644 mermaid-ascii.yaml $(DATADIR)/defaults/mermaid-ascii.yaml

uninstall:
	rm $(DATADIR)/filters/mermaid-ascii.lua
	rm $(DATADIR)/defaults/mermaid-ascii.yaml

check: sample.md
	pandoc -f gfm -t html --lua-filter=mermaid-ascii.lua sample.md | w3m -T text/html

.PHONY: install uninstall check
