(require 'yasnippet)
(add-hook 'term-mode-hook (lambda()
    (setq yas-dont-activate t)))
(add-hook 'prog-mode-hook
          '(lambda ()
             (yas-minor-mode)))
