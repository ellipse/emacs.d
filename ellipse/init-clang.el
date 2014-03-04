; ac-clang configuration
(defun my-ac-cc-mode-setup ()
  (require 'auto-complete-clang)
  (setq ac-sources (append '(ac-source-clang) ac-sources))
  (setq clang-include-dir-str
        "
/usr/include
/usr/include/linux
/usr/include/c++/4.8.2
/usr/include/c++/4.8.2/backward
/usr/lib/gcc/x86_64-linux-gnu/4.8.2/include-fixed/
/usr/lib/gcc/x86_64-linux-gnu/4.8.2/include/
/usr/include/apue
/usr/include/x86_64-linux-gnu/
/usr/include/x86_64-linux-gnu/c++/4.8
")
  ;;/usr/include/net
  ;;/usr/include/gtk-2.0
  ;;/usr/lib/gtk-2.0/include
  ;;/usr/lib/glib-networking
  (setq ac-clang-flags
        (mapcar (lambda (item) (concat "-I" item))
                (split-string clang-include-dir-str)))
  (setq ac-clang-auto-save t))

(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
(ac-config-default)
; ac-clang end


(provide 'init-clang)
