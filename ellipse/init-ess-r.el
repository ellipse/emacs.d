;; ESS mode configuration (only if ess is in a nonstandard place)
(require 'ess-site)
(add-to-list 'auto-mode-alist '("\\.R$" . R-mode))
(setq inferior-R-program-name "/usr/bin/R");;<<CHANGE
;;R stuff
;(setq ess-eval-visibly-p nil)
(setq ess-ask-for-ess-directory nil)
(require 'ess-eldoc)

(provide 'init-ess-r)
