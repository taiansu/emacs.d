(add-to-list 'auto-mode-alist '("\\.jsx?$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-hook 'js2-mode-hook 'ac-js2-mode)

(setq js2-highlight-level 3)
;(define-key js-mode-map "{" 'paredit-open-curly)
;(define-key js-mode-map "}" 'paredit-close-curly-and-newline)
