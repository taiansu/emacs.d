(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

; (flycheck-define-checker jsxhint-checker
;   "A JSX syntax and style checker based on JSXHint."

;   :command ("jsxhint" source)
;   :error-patterns
;   ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
;   :modes (web-mode))
; (add-hook 'web-mode-hook
;           (lambda ()
;             (when (equal web-mode-content-type "jsx")
;               ;; enable flycheck
;               (flycheck-select-checker 'jsxhint-checker)
;               (flycheck-mode))))

(add-hook 'jsx-mode-hook
          (lambda () (auto-complete-mode 1)))

(add-hook 'jsx-mode-hook (lambda () (tern-mode t)))
