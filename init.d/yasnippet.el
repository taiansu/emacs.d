(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(add-hook 'term-mode-hook (lambda()
    (setq yas-dont-activate t)))
(yas-global-mode 1)
;(add-hook 'prog-mode-hook 'yas-minor-mode-on)

;load auto-complete only after yasnippets

(require 'auto-complete-config)
(require 'fuzzy)
(add-to-list 'ac-dictionary-directories
    "~/.emacs.d/elpa/auto-complete-20150201.150/dict")

(ac-config-default)
(setq ac-ignore-case nil)
(setq ac-source-yasnippet nil)

(defun ac-common-setup ()
  (setq ac-sources (append '(ac-source-words-in-all-buffer ac-source-files-in-current-dir)
                           '(ac-source-dictionary))))
(ac-set-trigger-key "TAB")
