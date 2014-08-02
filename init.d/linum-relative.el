; (add-hook 'prog-mode-hook 'linum-mode)

; (require 'linum-relative)
; (defun toggle-linum-relative ()
;   (interactive)
;   (if (eq linum-format 'dynamic)
;     (setq linum-format 'linum-relative)
;     (setq linum-format 'dynamic)))

; (defadvice linum-update-window (around linum-dynamic activate)
;   (let* ((w (length (number-to-string
;                      (count-lines (point-min) (point-max)))))
;          (linum-format (concat " %" (number-to-string w) "d ")))
;     ad-do-it))

