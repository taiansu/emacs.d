; Keyboard Bindings

; GRB: esc{number} or esc-g{number} goto-line

(global-set-key (quote [?\e ?g]) (quote goto-line))
; GRB: esc-( to start-kbd-marco and esc-) to end-kbd-marco
(global-set-key '[?\e ?(] 'start-kbd-macro)
(global-set-key '[?\e ?)] 'end-kbd-macro) ;GRB: esc-n to call-last-kbd-marco
(global-set-key [?\e ?n] 'call-last-kbd-macro)

; GRB: use C-o and M-o to switch windows
(global-set-key "\C-o" 'other-window)
(defun prev-window ()
  (interactive)
  (other-window -1))
(global-set-key "\M-o" 'prev-window)

; use C-j to switch between buffers
(defun prev-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))
(global-set-key "\C-j" 'prev-buffer)

;; Expansion
(global-set-key (kbd "M-/") 'hippie-expand)

;; Copy region by drag mouse
(setq mouse-drag-copy-region t)

;; zap-upto-char
(global-set-key "\C-z" 'zap-up-to-char)
(global-set-key "\C-Z" 'zap-to-char)

;; Undo tree
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-s-z") 'redo)

;; Replace
(global-set-key (kbd "C-M-f") 'query-replace)

(defun xah-copy-line-or-region ()
  "Copy current line, or text selection.
When `universal-argument' is called first, copy whole buffer (but respect `narrow-to-region')."
  (interactive)
  (let (p1 p2)
    (if (null current-prefix-arg)
        (progn (if (use-region-p)
                   (progn (setq p1 (region-beginning))
                          (setq p2 (region-end)))
                 (progn (setq p1 (line-beginning-position))
                        (setq p2 (line-end-position)))))
      (progn (setq p1 (point-min))
             (setq p2 (point-max))))
    (kill-ring-save p1 p2)))

(defun xah-cut-line-or-region ()
  "Cut current line, or text selection.
When `universal-argument' is called first, cut whole buffer (but respect `narrow-to-region')."
  (interactive)
  (let (p1 p2)
    (if (null current-prefix-arg)
        (progn (if (use-region-p)
                   (progn (setq p1 (region-beginning))
                          (setq p2 (region-end)))
                 (progn (setq p1 (line-beginning-position))
                        (setq p2 (line-beginning-position 2)))))
      (progn (setq p1 (point-min))
             (setq p2 (point-max))))
    (kill-region p1 p2)))

(global-set-key (kbd "C-c k") 'xah-cut-line-or-region) ; cut
(global-set-key (kbd "C-c y") 'xah-copy-line-or-region) ; copy
