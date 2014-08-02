;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
   (format "%s%s" cask-base-path "auto-complete-20140512.43/dict"))
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)

