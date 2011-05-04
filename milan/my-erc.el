(erc-autojoin-mode t)
;;(setq erc-autojoin-channels-alist
  ;;    '((".*\\.freenode.net" "#emacs")))

;; (don't) check channels
(setq erc-track-mode nil)
;;(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "324" "329" "332" "333" "353" "477"))
;; don't show any of this
;;(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

(defun mychat ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "localhost:2777") ;; ERC already active?
      (erc-track-switch-buffer 1) ;; yes: switch to last active
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      ;; connect to bitlbee for IM
      (erc :server "localhost" :port 6667 :nick "milan" :full-name "milan")
      ;; connect to irssi proxy for IRC; passwords are fake
      (erc :server "krylon" :port 2777 :nick "milan" :password "27olafkeiten" :full-name "milan")
      (erc :server "krylon" :port 2778 :nick "milan" :password "27olafkeiten" :full-name "milan"))))

(erc-spelling-mode 1)
