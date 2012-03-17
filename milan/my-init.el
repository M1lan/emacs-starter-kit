;; auto-install from emacswiki
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/milan/auto-install/")
;;(auto-install-update-emacswiki-package-name t)
;;(add-to-list 'load-path "~/.emacs.d/milan/auto-install/")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/milan/auto-install/"))

(defun hide-ctrl-M ()
  "Hides the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))


(require 'openwith)
(openwith-mode t)
