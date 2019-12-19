# md => pdf workflow

### What?

Personal convenience script symlinked to bin so I can generate reasonable looking pdfs from a folder of markdown while keeping script files and stylesheets organized.

This may or may not be of use, given how specific to my habits, but in the off chance others may find it useful. I really do think WeasyPrint and upcoming CSS3 standards are vastly underappreciated, whether in Minimal Computing world, web design, or publishing (scholarly and otherwise). 

### Why?

- [WeasyPrint](https://weasyprint.org/) + [CSS3 Paged Media standards](https://drafts.csswg.org/css-page-3/) are pretty great
- Even my word processor is Electron, styled with HTML/CSS, so why futz with LaTeX?
- Invoking LaTex as a "solution" for plaintext word processing is incredibly limiting, both in terms of technical hurdles and design limitations

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
