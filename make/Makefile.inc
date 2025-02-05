B_TEX=$(patsubst %.org,%.tex,$(B_ORG))
B_PDF=$(patsubst %.org,%.pdf,$(B_ORG))

D_TEX=$(patsubst %.org,%.tex,$(D_ORG))
D_PDF=$(patsubst %.org,%.pdf,$(D_ORG))
D_HTM=$(patsubst %.org,%.html,$(D_ORG))

define org_article_to_pdf
	emacs --batch \
		-l .emacs.d/org-mode_batch_init.el \
		-l .emacs.d/org-mode_ansible-listings.el \
		--visit $< \
		-f org-latex-export-to-pdf
endef

define org_article_to_html
	emacs --batch \
		-l .emacs.d/org-mode_batch_init.el \
		-l .emacs.d/org-mode_ansible-listings.el \
		--visit $< \
		-f org-html-export-to-html
endef

define org_beamer_to_pdf
	emacs --batch \
		-l .emacs.d/org-mode_batch_init.el \
		-l .emacs.d/org-mode_ansible-listings.el \
		--visit $< \
		-f org-beamer-export-to-pdf
endef

all: $(D_PDF) $(D_HTM) $(B_PDF)

clean:
	-rm -f *~ $(D_TEX) $(D_PDF) $(D_HTM) $(B_TEX) $(B_PDF)

rclean:
	-rm -f *~ *.vrb *.aux *.log *.nav *.out *.snm *.tex *.toc *.fls *.fdb_latexmk
