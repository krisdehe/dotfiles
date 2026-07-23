```elisp
;;; -*- lexical-binding: t; -*-
;;; ============================================================
;;; Initialisation des packages
;;; ============================================================

(require 'package)

(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Installation de use-package si nécessaire
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Installation des packages définis par Custom
(package-install-selected-packages)

;;; ============================================================
;;; Interface
;;; ============================================================

(tool-bar-mode -1)
;;(menu-bar-mode -1)
;;(scroll-bar-mode -1)

(electric-pair-mode 1)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;;; ============================================================
;;; Org Mode
;;; ============================================================

(require 'org)
(require 'ox-md)

(with-eval-after-load 'org
  (require 'org-agenda)
  (require 'org-capture)
  (require 'org-side-tree))

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setopt
 org-startup-indented t
 org-ellipsis " ▼"
 org-hide-emphasis-markers t)

;;(setq org-startup-folded t)

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package ox-pandoc)

;;; ============================================================
;;; AUCTeX
;;; ============================================================

(use-package tex
  :ensure auctex)

;;; ============================================================
;;; Développement
;;; ============================================================

(use-package company
  :hook (after-init . global-company-mode))

(use-package lsp-mode)

(use-package vterm)

;;; ============================================================
;;; Variables générées par Custom
;;; ============================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(batppuccin-mocha))
 '(custom-safe-themes
   '("81668519ba9a89d7bd650ad30eaf75cbd1845eb7a2b2df9ab3d599df8ebf50aa"
     "c4df9006b9eb32599d758800a32f3487c2cdf13826084511783b47d419024af2"
     "b0cedf3c6d8fbbf65934e2045dddacff0a031992f2f389215adcb0ca741347c3"
     "beb6c2d78bcfe64a4ab159b539cf6219dd5d5ffc651d5d0842c4fe88ae1dd6f3"
     "65057902bcd51d84e0e28036f4759295e08f57b1ba94b9ae10a8d5ffde5f154f"
     "8dbbcb2b7ea7e7466ef575b60a92078359ac260c91fe908685b3983ab8e20e3f"
     "7478bc74ae421ad2103d4239176f71e6d55ef0be4eb874c328b862af5b93a857"
     default))
 '(package-selected-packages
   '(auctex batppuccin catppuccin-theme company dracula-theme
	    github-dark-vscode-theme lsp-mode org-bullets
	    org-side-tree ox-pandoc vterm))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


