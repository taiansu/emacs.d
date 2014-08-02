; don't open new frames when opening files in aquamacs
(setq one-buffer-one-frame-mode nil)

(setq column-number-mode t)

; alway hightligh cursor-line
(require 'hlinum)
(global-hl-line-mode 1)
(hlinum-activate)

;; parenthesis matching
(show-paren-mode 1) ; turn on paren match highlighting

;; Highlight-indentation
(require 'highlight-indentation)
(add-hook 'prog-mode-hook 'highlight-indentation-current-column-mode)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; anzu
(global-anzu-mode +1)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)
