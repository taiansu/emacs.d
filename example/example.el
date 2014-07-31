;; GRB: resize and move the window if we're in a windowing system
; (defun resize-frame ()
;    "Resize current frame"
;    (interactive)
;    (set-frame-size (selected-frame) 239 68))
; (defun move-frame ()
;    "Move current frame"
;    (interactive)
;    (set-frame-position (selected-frame) 0 0))
; (if (not (eq window-system 'nil))
;     (progn
;      (move-frame)
;     (resize-frame)))

; (add-to-list 'default-frame-alist '(top 0))
; (add-to-list 'default-frame-alist '(left 0))

; GRB: split the windows
; (progn
  ; (interactive)
  ; (split-window-horizontally (floor (* 0.55 (window-width))))
  ; (other-window 1)
  ; ;(split-window-horizontally 80)
  ; ;(other-window 1)
  ; (split-window)
  ; (other-window 1)
  ; (eshell)
  ; (other-window -3))

;; GRB: open temporary buffers in a dedicated window split
; (setq special-display-regexps
;         '("^\\*Completions\\*$"
;           "^\\*Help\\*$"
;           "^\\*grep\\*$"
;           "^\\*Apropos\\*$"
;           "^\\*elisp macroexpansion\\*$"
;           "^\\*local variables\\*$"
;           "^\\*Compile-Log\\*$"
;           "^\\*Quail Completions\\*$"
;           "^\\*Occur\\*$"
;           "^\\*frequencies\\*$"
;           "^\\*compilation\\*$"
;           "^\\*Locate\\*$"
;           "^\\*Colors\\*$"
;           "^\\*tumme-display-image\\*$"
;           "^\\*SLIME Description\\*$"
;           "^\\*.* output\\*$"           ; tex compilation buffer
;           "^\\*TeX Help\\*$"
;           "^\\*Shell Command Output\\*$"
;           "^\\*Async Shell Command\\*$"
;           "^\\*Backtrace\\*$"))
; (setq grb-temporary-window (nth 2 (window-list)))
; (defun grb-special-display (buffer &optional data)
;   (let ((window grb-temporary-window))
;     (with-selected-window window
;       (switch-to-buffer buffer)
;       window)))
; (setq special-display-function #'grb-special-display)


;; smartparens
; (require 'smartparens-config)
; (require 'smartparens-ruby)
; (smartparens-global-mode)
; (show-smartparens-global-mode t)
; (sp-with-modes '(rhtml-mode)
;  (sp-local-pair "<" ">")
;  (sp-local-pair "<%" "%>"))


