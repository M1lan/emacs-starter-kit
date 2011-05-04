(add-to-list 'load-path "~/mysrc/slime/")  ; your SLIME directory
    (setq inferior-lisp-program "/usr/bin/clisp") ; your Lisp system
    (require 'slime)
    (slime-setup)
