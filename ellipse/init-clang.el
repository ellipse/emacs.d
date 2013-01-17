; ac-clang configuration
(defun my-ac-cc-mode-setup ()
  (require 'auto-complete-clang)
  (setq ac-sources (append '(ac-source-clang) ac-sources))
  (setq clang-include-dir-str
        "
/usr/include
/usr/include/apue
/usr/include/x86_64-linux-gnu
/usr/include/net
/usr/include/gtk-2.0
/usr/lib/gtk-2.0/include
/usr/lib/glib-networking
")
  (setq ac-clang-flags
        (mapcar (lambda (item) (concat "-I" item))
                (split-string clang-include-dir-str)))
  (setq ac-clang-auto-save t))

(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
(ac-config-default)
; ac-clang end


(provide 'init-clang)
