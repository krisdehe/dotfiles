;;; -*- lexical-binding: t -*-
(require 'package)

(require 'org)
(require 'org-agenda)
(require 'org-capture)
(require 'org-mobile)
(require 'auctex)
(require 'ox-md)

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(package-install-selected-packages)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(batppuccin-mocha))
 '(custom-safe-themes
   '("b0cedf3c6d8fbbf65934e2045dddacff0a031992f2f389215adcb0ca741347c3"
     "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1"
     "d2ab3d4f005a9ad4fb789a8f65606c72f30ce9d281a9e42da55f7f4b9ef5bfc6"
     "c20728f5c0cb50972b50c929b004a7496d3f2e2ded387bf870f89da25793bb44"
     "d5c1a09648941993271f1961b4de2801622eea54fb95ce4b2df2fd55d426e52c"
     "daa27dcbe26a280a9425ee90dc7458d85bd540482b93e9fa94d4f43327128077"
     "46433a4be67ff0f415175d0876ef9435d190f3aa57bb00670febd70ba0ba52e1"
     "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633"
     "d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36"
     "9e9209fd17023af648e3aaf682255c29beddf5ceb04c3ce7cc883323c2b54901"
     "615d8f3208b19161ada77e155beaca0678a35abb182ceae87e26660ecbca04d5"
     "7fea145741b3ca719ae45e6533ad1f49b2a43bf199d9afaee5b6135fd9e6f9b8"
     "2b0fcc7cc9be4c09ec5c75405260a85e41691abb1ee28d29fcd5521e4fca575b"
     "0223215a464167d93b9cfef9b1cdf9b0768ab660f33b3068b647f7b12aa453a0"
     default))
 '(display-line-numbers-mode nil t)
 '(package-selected-packages
   '(auctex batppuccin catppuccin-theme company dracula-theme
	    kanagawa-themes lsp-mode org-bullets solarized-theme
	    vscode-dark-plus-theme vterm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'after-init-hook 'global-company-mode)

(setopt org-startup-indented t
		org-ellipsis " ▼"
		org-hide-emphasis-markers t)

(setq org-startup-folded t)

;; org-bullets
(use-package org-bullets
			 :ensure t
			 :config
			 (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Disabling things
;;-----------------------------------------------------------------------
;;(menu-bar-mode -1) 
;;(toggle-scroll-bar -1) 
(tool-bar-mode -1)

