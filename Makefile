SHELL := /bin/zsh

# default out file name
ifneq ($(prefix),)
	outfile = $(prefix)-$(shell date '+%Y%m%d%S')
else
	outfile = $(shell date '+%Y%m%d%S')
endif

files_in = $(pwd)

ifneq ($(in_dir),)
	files_in = $(in_dir)/$(in_file)
endif

# # out folder name
# out_dir = $(pwd)/out

# # markdown folder input
# in_dir = $(pwd)/in

# STYLE=chmduquesne
style=custom

# html-to-pdf engine (wkhtmltopdf, weasyprint, prince)
engine=weasyprint

# ridiculousness
r = '\t\U0001F44C'

pdf:
	@echo $(files_in)
# 	@echo -e $(r) '\t\e[34mgenerating $(outfile).pdf ...\e[0m ' $(r)
# 	@pandoc --standalone --pdf-engine=$(engine) \
# 	--css=$(style).css --output $(out_dir)/$(outfile).pdf $(in_dir)/$(in_file); \

init: dir

dir:
	mkdir -p $(out_dir)

clean:
	rm -f $(out_dir)/*

# old version used this command in a shell script which, in the end, wasn't necessary
# cd ~/.bulbil/mdtopdf/ && make prefix="$FLAGS_prefix" in_file="$FLAGS_infile" in_dir="$FLAGS_indir" out_dir="$FLAGS_outdir"

