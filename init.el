;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

;; please don't load everything at boot!
(fset 'realinit
   "\C-[xload-file\C-m\C-a\C-k~/.emacs.d/realinit.el")

(global-set-key (kbd "<f11>") 'realinit)

;; essentials

;; ido
(ido-mode t)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; wtf? tmm sux!
(setq transient-mark-mode nil)

;; proper backward delete keys
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-h") 'backward-delete-char) 

;; cough.
(defalias 'yes-or-no-p 'y-or-n-p)
(setq custom-file (concat dotfiles-dir "custom.el"))