
(setq inhibit-startup-message t) 
(tool-bar-mode -1)
(menu-bar-mode -1)

(scroll-bar-mode -1)

 
(global-linum-mode t)
 
; Pacotes
(require 'package)
(setq package-enable-at-startup nil) ; desabilitar inicio de
; MELP - repositorio
(add-to-list 'package-archives
	     '("melpa"."https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package auto-complete
  :ensure t
  :init(progn
	 (ac-config-default)
	 (global-auto-complete-mode t)))


(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
  :bind (("C-l" . 'neotree-toggle)));;explore files

;; theme

(use-package rebecca-theme
  :ensure t
  :config (load-theme 'rebecca))


;; languages 

(use-package inf-ruby
  :ensure t)

;; Atalhos

(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "M-<up>") 'enlarge-window
(global-set-key (kbd "M-<down>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(all-the-icons auto-complete try use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
