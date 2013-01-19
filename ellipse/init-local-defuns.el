;; some personal little functions

;; Set "C-x p" to select the previous window
(defun other-window-backward (&optional n)
  "Select the Nth previous window"
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))
(global-set-key "\C-xp" 'other-window-backward)

;; scrolls the window so that the line the cursor in
;; becomes the top line of the window
(defun line-to-top ()
  "Move current line to top of window"
  (interactive)
  (recenter 0))
(global-set-key "\M-'" 'line-to-top)

;; when handling symlinks, toggle 'buffer-read-only' on
(add-hook 'find-file-hooks
          '(lambda ()
             (if (file-symlink-p buffer-file-name)
                 (progn
                   (setq buffer-read-only t)
                   (message "File is a symlink")))))
(defun visit-target-instead ()
  "Replace this buffer with a buffer visiting the link target."
  (interactive)
  (if buffer-file-name
      (let ((target (file-symlink-p buffer-file-name)))
        (if target
            (find-alternate-file target)
          (error "Not visiting a symlink")))
    (error "Not visiting a file")))
(defun clobber-symlink ()
  "Replace symlink with a copy of the file."
  (interactive)
  (if buffer-file-name
      (let ((target (file-symlink-p buffer-file-name)))
        (if target
            (if (yes-or-no-p (format "Replace %s with %s?"
                                     buffer-file-name
                                     target))
                (progn
                  (delete-file buffer-file-name)
                  (write-file buffer-file-name)))
          (error "Not visiting a symlink.")))
    (error "Not visiting a file")))
(global-set-key "\C-xt" 'visit-target-instead)


;; unscroll for wrong scrolling
(defvar unscroll-point nil
  "Cursor position for next call to 'unscroll'.")
(defvar unscroll-window-start nil
  "Window start for next call to 'unscroll'.")
(defadvice scroll-up (before remember-for-unscroll
                             activate compile)
  "Remember where we started from, for 'unscroll'."
  (if (not (eq last-command 'scroll-up))
      (progn
        (setq unscroll-point (point))
        (setq unscroll-window-start (window-start)))))
(defun unscroll ()
  "Jump to location specified by 'unscroll-to'."
  (interactive)
  (goto-char unscroll-to)
  (set-window-start nil unscroll-window-start))
(global-set-key "\C-x\M-v" 'unscroll)

(provide 'init-local-defuns)
