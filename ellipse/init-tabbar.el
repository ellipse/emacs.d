(require 'tabbar)
(tabbar-mode 't)
(global-set-key (kbd "C-c n") 'tabbar-forward)
(global-set-key (kbd "C-c p") 'tabbar-backward)

;;(setq tabbar-ruler-global-tabbar 't)
;;(setq tabbar-ruler-global-ruler 't)

;;(setq tabbar-ruler-global-tabbar 't) ; If you want tabbar
;;(setq tabbar-ruler-global-ruler 't) ; if you want a global ruler
;;  (setq tabbar-ruler-popup-menu 't) ; If you want a popup menu.
;;  (setq tabbar-ruler-popup-toolbar 't) ; If you want a popup toolbar
;;(require 'tabbar-ruler)

(provide 'init-tabbar)
