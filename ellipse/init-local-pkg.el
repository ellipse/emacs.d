(if (not (fboundp 'require-package))
    (defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t))))))

(require-package 'auto-complete-clang)
(require-package 'switch-window)
(require-package 'tabbar)
(require-package 'undo-tree)
(require-package 'yasnippet)
(require-package 'yasnippet-bundle)
(require-package 'dropdown-list)
(require-package 'autopair)
(require-package 'sml-mode)
(require-package 'auctex)
(require-package 'yas-jit)
(require-package 'color-theme)
(require-package 'zencoding-mode)
;(require-package 'sml-modeline-mode)
;(require-package 'ess)

(provide 'init-local-pkg)
