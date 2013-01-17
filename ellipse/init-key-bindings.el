;; some personal key bindins


(global-set-key [(C-f6)] 'eshell)
(global-set-key (kbd "C-c r") 'replace-string)

;; indent automatically after newline
(global-set-key "\r" 'align-newline-and-indent)

;; Set "C-x p" to select the previous window
(defun other-window-backward (&optional n)
  "Select the Nth previous window"
  (interactive "p")
  (if n
      (other-window (- n))
    (other-window -1)))
(global-set-key "\C-xp" 'other-window-backward)

(provide 'init-key-bindings)
