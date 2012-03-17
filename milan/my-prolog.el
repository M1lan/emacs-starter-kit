(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
(setq prolog-system 'swi)
(setq auto-mode-alist (append '(("\\.pl$" . prolog-mode)
                                ("\\.m$" . mercury-mode))
                              auto-mode-alist))


(require 'ediprolog)
(require 'etrace)

(global-set-key [f7] 'ediprolog-dwim)

(setq prolog-system 'swi
      prolog-program-switches '((swi ("-G128M" "-T128M" "-L128M" "-O"))
                                (t nil))
      prolog-electric-if-then-else-flag t)


(setq prolog-indent-width 4
      prolog-electric-dot-flag t
      prolog-electric-dash-flag t
      prolog-electric-colon-flag t)


(add-hook 'prolog-mode-hook
          (lambda ()
            (require 'flymake)
            (make-local-variable 'flymake-allowed-file-name-masks)
            (make-local-variable 'flymake-err-line-patterns)
            (setq flymake-err-line-patterns
                  '(("ERROR: (?\\(.*?\\):\\([0-9]+\\)" 1 2)
                    ("Warning: (\\(.*\\):\\([0-9]+\\)" 1 2)))
            (setq flymake-allowed-file-name-masks
                  '(("\\.pl\\'" flymake-prolog-init)))
            (flymake-mode 1)))

(defun flymake-prolog-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "swipl" (list "-q" "-t" "halt" "-s " local-file))))
