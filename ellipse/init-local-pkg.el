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
(require-package 'autopair)

(provide 'init-local-pkg)
