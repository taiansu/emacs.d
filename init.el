(package-initialize)
(require 'cask "/usr/local/Cellar/cask/0.6.0/cask.el")
(cask-initialize)
(require 'pallet)
(require 'powerline)
(powerline-default-theme)
(require 'grep-a-lot)
(grep-a-lot-setup-keys)
(require 'rainbow-delimiters)

(setq cask-base-path "~/.emacs.d/.cask/24.4.50.1/elpa/")

;; ==============================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (base16-tomorrow)))
 '(custom-safe-themes
   (quote
    ("e01b71af3b95b40fd877edfd0211114c5e7496a35bf6813edc29490fbd07edb4" default)))
 '(global-linum-mode t)
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
;; ==============================

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 160 :width normal :foundry "nil" :family "Source Code Pro")))))

;; ==============================

(defun important-bell-only ()
  (unless (memq this-command
        '(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))
(setq ring-bell-function 'important-bell-only)

;; ido support
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
   (format "%s%s" cask-base-path "auto-complete-20140512.43/dict"))
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)

;; smartparens
; (require 'smartparens-config)
; (require 'smartparens-ruby)
; (smartparens-global-mode)
; (show-smartparens-global-mode t)
; (sp-with-modes '(rhtml-mode)
;  (sp-local-pair "<" ">")
;  (sp-local-pair "<%" "%>"))

;; projectile
;;(require 'grizzl)
(projectile-global-mode)
(setq projectile-enable-caching t)
;;(setq projectile-completion-system 'grizzl)
;; Press Command-p for fuzzy find in project
(global-set-key (kbd "s-p") 'projectile-find-file)
;; Press Command-b for fuzzy switch buffer
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)

;; highlight-indentation
; (require 'highlight-indentation)
; (add-hook 'enh-ruby-mode-hook
;          (lambda () (highlight-indentation-current-column-mode)))

; (add-hook 'coffee-mode-hook
;          (lambda () (highlight-indentation-current-column-mode)))
