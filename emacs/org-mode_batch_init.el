(package-initialize)
(require 'ox-beamer)
(setq org-latex-pdf-process '("latexmk -f -pdf -%latex -interaction=nonstopmode -output-directory=%o %f"))
(setq org-beamer-outline-frame-title "Plan")
(setq org-src-preserve-indentation t)

