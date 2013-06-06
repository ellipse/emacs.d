;; Configure file for myself
;; ellipse Sun Oct 21 21:51:53 2012

(add-to-list 'load-path "~/.emacs.d/ellipse/")

;; install personal packages
(require 'init-local-pkg)

;; personal colortheme
(require 'color-theme-blackboard)
(color-theme-blackboard)

;; autopair-mode
(autopair-global-mode)

;;mit-scheme
(require 'init-mit-scheme)

;; sml-mode
(require 'init-sml-mode)

; change mouse's scroll step
(setq scroll-step 1
        scroll-margin 3
        scroll-conservatively 10000)

;set user profile
(setq user-full-name "ellipse")
(setq user-mail-address "xdgxygpl@gmail.com")

;display time
(display-time-mode t)
(setq display-time-24hr-format t)

;change yes-or-no to y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

; set matlab-mode
(add-to-list 'load-path "/home/ellipse/.emacs.d/ellipse/matlab")
(require 'matlab-load)

; set tab's width to be 4
(setq tab-width 4)

; set linux-c-mode
(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux Kernel"
  (interactive)
  (c-mode)
  (which-function-mode)
  (autopair-mode)
  (c-set-style "K&R")
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq c-basic-offset 8)
  )
(add-to-list 'auto-mode-alist '("\\.c\\'" . linux-c-mode))

;; display line number on the left side
(require 'linum)
(global-linum-mode 1)

;; load yasnippet
(require 'init-yasnippet)

;; enable hs-minor-mode for c/c++/elisp/scheme mode
(defun my-hs-minor-mode-hook ()
  (local-set-key (kbd "C-c t") 'hs-toggle-hiding)
  (local-set-key (kbd "C-c b") 'hs-hide-block)
  (local-set-key (kbd "C-c o") 'hs-hide-all)
  (local-set-key (kbd "C-c u") 'hs-hide-level)
  )
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'scheme-mode-hook 'hs-minor-mode)
(add-hook 'hs-minor-mode-hook 'my-hs-minor-mode-hook)

;; gas-mode to write assembly language
(require 'gas-mode)
(add-to-list 'auto-mode-alist '("\\.S\\'" . gas-mode))

;multi-gud
(require 'init-multigud)

;; undo-tree-mode
(autoload 'undo-tree-visualize "~/.emacs.d/elpa/undo-tree-20121020.1844/undo-tree.el" "" nil)
(global-set-key "\C-xu" 'undo-tree-visualize)
(global-undo-tree-mode t)

;; outline-minor-mode
(require 'init-outlminor-mode)

;; auctex
(require 'init-auctex)

;; switch-window
(require 'switch-window)

;; tabbar
(require 'init-tabbar)

;; clang
(require 'init-clang)
(ac-set-trigger-key "TAB")

;; personal key bindings
(require 'init-key-bindings)

;; personal little funcitons
(require 'init-local-defuns)

;; statistics (ess && R)
(require 'init-ess-r)

;; mail
(require 'init-mail)

(provide 'init-local)
