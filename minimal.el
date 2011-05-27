;; no gui
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

;; ido
(ido-mode t)

;; wtf? tmm sux
(setq transient-mark-mode nil)

;; the usual suspects
(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; Window switching. (C-x o goes to the next window)
(windmove-default-keybindings) ;; Shift+direction
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two

;; kill word backward
(global-set-key (kbd "C-M-h") 'backward-kill-word)

;; colour scheme
(load-file "/home/milan/.emacs.d/milan/color-theme-solarized.el")
(color-theme-solarized "dark")

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; magitttTttt
(global-set-key (kbd "C-x g") 'magit-status)

;; set up slime
(add-to-list 'load-path "~/mysrc/slime/")  ; your SLIME directory
(setq inferior-lisp-program "/usr/local/bin/sbcl") ; your Lisp system
(require 'slime)
(slime-setup)
(load (expand-file-name "~/quicklisp/slime-helper.el"))

;; auto-install from emacswiki
(load-file "/home/milan/.emacs.d/milan/auto-install.el")
(setq auto-install-directory "~/.emacs.d/milan/auto-install/")
(add-to-list 'load-path "~/.emacs.d/milan/auto-install/")

;; Dired: toggle hidden files etc.
(require 'dired-details+)
(require 'dired-x)
(setq dired-omit-files
      (rx (or (seq bol (? ".") "#")         ;; emacs autosave files
              (seq bol "." (not (any "."))) ;; dot-files
              (seq "~" eol)                 ;; backup-files
              (seq bol "CVS" eol)           ;; CVS dirs
              )))
(setq dired-omit-extensions
      (append dired-latex-unclean-extensions
              dired-bibtex-unclean-extensions
              dired-texinfo-unclean-extensions))
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1))) 

;; my stuff
(defalias 'yes-or-no-p 'y-or-n-p)
(require 'auto-complete)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq auto-complete-mode 1)
(setq doc-view-continuous 1)
(setq recentf-mode 1)
(setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "/usr/bin/conkeror")
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)

;;(server-start)
