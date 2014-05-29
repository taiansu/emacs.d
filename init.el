(package-initialize)
(require 'cask "/usr/local/Cellar/cask/0.7.0/cask.el")
(cask-initialize)
(require 'pallet)
(require 'grep-a-lot)
(grep-a-lot-setup-keys)
(require 'rainbow-delimiters)

; don't open new frames when opening files in aquamacs
(setq one-buffer-one-frame-mode nil)

;; ====== exchange command and meta in emacs
;; but switch input method still using command-space
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

(setq line-number-mode t)
(setq column-number-mode t)

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
    ("5239c4088b5ecfb5c89cda7ccef5c6127740def8a41225e28ba5b69711d904ca" default)))
 '(line-spacing 3)
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#bf616a")
     (40 . "#DCA432")
     (60 . "#ebcb8b")
     (80 . "#B4EB89")
     (100 . "#89EBCA")
     (120 . "#89AAEB")
     (140 . "#C189EB")
     (160 . "#bf616a")
     (180 . "#DCA432")
     (200 . "#ebcb8b")
     (220 . "#B4EB89")
     (240 . "#89EBCA")
     (260 . "#89AAEB")
     (280 . "#C189EB")
     (300 . "#bf616a")
     (320 . "#DCA432")
     (340 . "#ebcb8b")
     (360 . "#B4EB89"))))
 '(vc-annotate-very-old-color nil))

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

; alway hightligh cursor-line
(global-hl-line-mode 1)
(require 'hlinum)
(hlinum-activate)

; GRB: resize and move the window if we're in a windowing system
(defun resize-frame ()
   "Resize current frame"
   (interactive)
   (set-frame-size (selected-frame) 239 68))
(defun move-frame ()
   "Move current frame"
   (interactive)
   (set-frame-position (selected-frame) 0 0))
(if (not (eq window-system 'nil))
    (progn
     (move-frame)
    (resize-frame)))

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

;; cua-mode
(cua-mode 1)

;; paren matching
(show-paren-mode 1) ; turn on paren match highlighting
(setq show-paren-style 'parenthesis) ; highlight entire bracket expression

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

;; Highlight-indentation
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

(defun seeing-is-believing ()
  "Replace the current region (or the whole buffer, if none) with the output
of seeing_is_believing."
  (interactive)
  (let ((beg (if (region-active-p) (region-beginning) (point-min)))
        (end (if (region-active-p) (region-end) (point-max))))
    (shell-command-on-region beg end "seeing_is_believing" nil 'replace)))

(evilnc-default-hotkeys)
