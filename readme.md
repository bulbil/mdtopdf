# md => pdf workflow

### What?

Personal convenience script for generating reasonable looking pdfs from a markdown file or folder while keeping script files and stylesheets organized.

Fairly specific to my habits, but in the off chance others may find it useful, here it is. I really do think WeasyPrint and upcoming CSS3 standards are vastly underappreciated, whether in Minimal Computing world, web design, or publishing (scholarly and otherwise). 

### Why?

- [WeasyPrint](https://weasyprint.org/) + [CSS3 Paged Media standards](https://drafts.csswg.org/css-page-3/) are pretty great
- Even my ["word processor"](https://typora.io/) is styled with HTML/CSS, so why futz with LaTeX?
- Invoking LaTeX as a "solution" for plaintext word processing undermines the power of markdown IMHO and hugely limiting--in terms of bulky platform specific dependencies, annoying syntax hurdles, typography limitations, and domain specific markup. 

### How?

1. update env variables in `mdtopdf.sh`
2. copy to your preferred user scripts folder, e.g. `~/.username`
3. symlink to your preferred `bin`, e.g. `ln -s ~/.username/mdtopdf/mdtopdf.sh /usr/local/bin/mdtofpdf`
4. update/add stylesheet(s) in `mdtopdf` folder
5. `mdtopdf [-f input-file-path] [-i input-folder-path] [-o output-prefix]`

### Depending on?

- [Pandoc](https://pandoc.org/)
- [WeasyPrint](https://weasyprint.readthedocs.io/en/stable/install.html)

### But?

:construction: Of course, still working on this ... :construction:
