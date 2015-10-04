(require 'evil)
(evil-mode 1)

(setq evil-emacs-state-cursor '("#1e91b1" box))
(setq evil-normal-state-cursor '("#96a760" box))
(setq evil-visual-state-cursor '("#da8414" box))
(setq evil-insert-state-cursor '("#96a760" bar))
(setq evil-replace-state-cursor '("#e02519" bar))
(setq evil-operator-state-cursor '("#e02519" hollow))

(add-hook 'python-mode-hook
  (function (lambda ()
          (setq evil-shift-width python-indent))))
(add-hook 'ruby-mode-hook
  (function (lambda ()
          (setq evil-shift-width ruby-indent-level))))
(add-hook 'js2-mode-hook
  (function (lambda ()
          (setq evil-shift-width 2))))
