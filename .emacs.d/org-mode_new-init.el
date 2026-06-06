;; INIT SCRIPT FOR BUILDOC
(package-initialize)


;; Org Export Settings
(use-package org
  :demand t
;  :custom
)


;; LaTeX PDF Export settings
(use-package ox-latex
  :demand t
  :custom

  ;; XeLaTeX
  (org-latex-compiler "xelatex")

  ;; With Latexmk
  (org-latex-pdf-process '("latexmk -f -pdfxe -%latex=\"%latex --shell-escape\" -interaction=nonstopmode -output-directory=%o %f"))

  ;; Clean temporary files after export
  (org-latex-logfiles-extensions
   (quote ("lof" "lot" "tex~" "aux" "idx" "log" "out"
           "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk"
           "blg" "brf" "fls" "entoc" "ps" "spl" "bbl"
           "tex" "bcf" "xdv")))

  ;; PDF metadata
  (org-latex-hyperref-template
      (concat "\\hypersetup{\n"
              "pdfauthor={%a},\n"
              "pdftitle={%t},\n"
              "pdfkeywords={%k},\n"
              "pdfsubject={%d},\n"
              "pdfcreator={%c},\n"
              "pdflang={%L},\n"
              ;; Get rid of the red boxes drawn around the links
              "colorlinks,\n"
              "citecolor=black,\n"
              "filecolor=black,\n"
              "linkcolor=blue,\n"
              "urlcolor=blue\n"
              "}"))

  :config
  ;; Pour le Français !
  (add-to-list 'org-latex-packages-alist '("AUTO" "babel" nil))

  ;; Colorisation des blocs de code
  (setq org-latex-src-block-backend 'engraved)
  (add-to-list 'org-latex-packages-alist '("" "listings"))
  (add-to-list 'org-latex-packages-alist '("" "xcolor"))

  )

(use-package htmlize)

(use-package ox-html
  :custom

  (org-html-postamble t)
  (org-html-postamble-format
   '(
     ("en" "<p class=\"author\">Author: %a</p>
<p class=\"date\">Date: %d</p>")
     ("fr" "<p class=\"author\">Auteur : %a</p>
<p class=\"date\">Date : %d</p>")
     ))

  ;; HTML+CSS : ne pas include de style par défaut
  (org-html-head-include-default-style nil)

  ;; Inclure le fichier org.css qui accompagne le fichier .org
  (org-html-head-extra "<link rel=\"stylesheet\" type=\"text/css\" href=\"org.css\"/>")

  ;; external css file (org.css)
  (org-html-htmlize-output-type 'css)

  )


(use-package ox-beamer
  :custom
  (org-beamer-outline-frame-title "Plan")
)


;; Babel : évaluation du code

;; langages
(setq org-babel-load-languages
      '(
        (emacs-lisp . t)
        (dot . t)
        (latex . t)
        (gnuplot . t)
        (shell . t)
        (python . t)
        ))

;; si python n'est pas trouvé
;; TODO: bug possible parce que seul python3-minimal est installé dans l'image
(require 'ob-python)

;; pas de confirmation à l'évaluation
(setq org-confirm-babel-evaluate nil)

;; python warning
(setq python-indent-guess-indent-offset-verbose nil)
