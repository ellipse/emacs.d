;; some personal key bindins


(global-set-key [(C-f6)] 'eshell)
(global-set-key (kbd "C-c r") 'replace-string)

;; indent automatically after newline
(global-set-key "\r" 'newline-and-indent)

(provide 'init-key-bindings)
