;; INSTALLATION SCRIPT

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq package-archive-priorities 
      '(("melpa" . 10)
        ("gnu" . 5)
        ))

(package-initialize)

(package-refresh-contents)

;; packages to have installed
(setq
 package-selected-packages
 '(
   org-mode
   engrave-faces
   htmlize
   use-package
   yaml-mode
   ))

(package-install-selected-packages 'noconfirm)

(require 'use-package)

(require 'htmlize)

