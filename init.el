(package-initialize)
(require 'cask "/usr/local/Cellar/cask/0.6.0/cask.el")
(cask-initialize)
(require 'pallet)
(require 'powerline)
(powerline-default-theme)
(require 'grep-a-lot)
(grep-a-lot-setup-keys)
(require 'rainbow-delimiters)

; don't open new frames when opening files in aquamacs
(setq one-buffer-one-frame-mode nil)

;; ====== exchange command and meta in emacs
;; but switch input method still using command-space
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

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
 '(line-spacing 3)
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

; GRB: keybindings
(global-set-key (quote [?\e ?g]) (quote goto-line))
(global-set-key '[?\e ?(] 'start-kbd-macro)
(global-set-key '[?\e ?)] 'end-kbd-macro)
(global-set-key [?\e ?n] 'call-last-kbd-macro)

; GRB: resize and move the window if we're in a windowing system
;(defun resize-frame ()
  ; "Resize current frame"
  ; (interactive)
  ; (set-frame-size (selected-frame) 239 68))
; (defun move-frame
  ; "Move current frame"
  ; (interactive)
  ; (set-frame-position (selected-frame) 0 0))
; (if (not (eq window-system 'nil))
  ;   (progn
  ;    (move-frame)
  ;   (resize-frame)))
(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
   nil 'fullscreen
   (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))
; (set-frame-parameter nil 'fullscreen 'fullboth)

(add-to-list 'default-frame-alist '(top 0))
(add-to-list 'default-frame-alist '(left 0))

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

; GRB: use C-o and M-o to switch windows
(global-set-key "\C-o" 'other-window)
(defun prev-window ()
  (interactive)
  (other-window -1))
(global-set-key "\M-o" 'prev-window)

; GRB: highlight trailing whitespace
(set-default 'show-trailing-whitespace t)

; GRB: open temporary buffers in a dedicated window split
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

; GRB: Don't show the startup screen
(setq inhibit-startup-message t)

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
(global-set-key (kbd "M-p") 'projectile-find-file)
;; Press Command-b for fuzzy switch buffer
(global-set-key (kbd "M-b") 'projectile-switch-to-buffer)

;; highlight-indentation
(require 'highlight-indentation)
(add-hook 'prog-mode-hook 'highlight-indentation-current-column-mode)

; ====== viper =========

;(setq viper-mode nil)                ; enable Viper at load time
;(setq viper-ex-style-editing nil)  ; can backspace past start of insert / line
;(require 'viper)                   ; load Viper
;(require 'vimpulse)                ; load Vimpulse
;(require 'redo)			   ; enable vim-style redo
;(require 'rect-mark)		   ; enable prettier rectangular selections

(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
