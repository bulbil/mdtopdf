SHELL := /bin/zsh

# default out file name
prefix = ''
outfile = $(prefix)-$(shell date '+%Y%m%d%S')

# default base path
base = ~/.bulbil/mdtopdf

# out folder name
out_dir = $(BASE)/out

# markdown folder input
in_dir = $(base)/in

# stylesheet to apply
# TODO: loop through stylesheet directory

# STYLE=chmduquesne
style=custom

# html-to-pdf engine (wkhtmltopdf, weasyprint, prince)
engine=weasyprint

# ridiculousness
r = '\t\U0001F44C'

pdf:
	@echo -e $(r) '\t\e[34mgenerating $(outfile).pdf ...\e[0m ' $(r)
	@pandoc --standalone --pdf-engine=$(engine) \
	--css=$(style).css --output $(out_dir)/$(outfile).pdf $(in_dir)/*md; \

init: dir

dir:
	mkdir -p $(out_dir)

clean:
	rm -f $(out_dir)/*
