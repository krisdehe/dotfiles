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

(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;;; ============================================================
;;; Org Mode
;;; ============================================================

(require 'org)
(require 'ox-md)

(with-eval-after-load 'org
  (require 'org-agenda)
  (require 'org-capture))

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setopt
 org-startup-indented t
 org-ellipsis " ▼"
 org-hide-emphasis-markers t)

(setq org-startup-folded t)

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
 '(custom-enabled-themes '(molokai))
 '(custom-safe-themes
   '("7478bc74ae421ad2103d4239176f71e6d55ef0be4eb874c328b862af5b93a857"
     default))
 '(package-selected-packages
   '(auctex batppuccin catppuccin-theme company dracula-theme
	    kanagawa-themes lsp-mode molokai-theme org-bullets
	    ox-pandoc solarized-theme vscode-dark-plus-theme vterm))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

