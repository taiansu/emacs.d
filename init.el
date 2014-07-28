; Taian Su's Emacs 24 Configuration

;; Directories and file names
(setq ts-emacs-init-file (or load-file-name buffer-file-name))
(setq ts-emacs-config-dir
      (file-name-directory ts-emacs-init-file))
(setq user-emacs-directory ts-emacs-config-dir)
(setq ts-elisp-dir (expand-file-name "elisp" ts-emacs-config-dir))
(setq ts-elisp-external-dir
      (expand-file-name "external" ts-elisp-dir))
(setq ts-init-dir
      (expand-file-name "init.d" ts-emacs-config-dir))

;; Load all elisp files in ./init.d
(if (file-exists-p ts-init-dir)
    (dolist (file (directory-files ts-init-dir t "\\.el$"))
      (load file)))

;; Set up 'custom' system
(setq custom-file (expand-file-name "emacs-customizations.el" ts-emacs-config-dir))
(load custom-file)

;; =============================================================================

(normal-erase-is-backspace-mode 1)
(require 'evil)
(evil-mode 1)

; don't open new frames when opening files in aquamacs
(setq one-buffer-one-frame-mode nil)

;; ====== exchange command and meta in emacs
;; but switch input method still using command-space
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

(setq line-number-mode t)
(setq column-number-mode t)

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

(setq cask-base-path "~/.emacs.d/.cask/24.4.50.1/elpa/")

;; ==============================
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
(require 'hlinum)
(global-hl-line-mode 1)
(hlinum-activate)

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

(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(defun seeing-is-believing ()
  "Replace the current region (or the whole buffer, if none) with the output
of seeing_is_believing."
  (interactive)
  (let ((beg (if (region-active-p) (region-beginning) (point-min)))
        (end (if (region-active-p) (region-end) (point-max))))
    (shell-command-on-region beg end "seeing_is_believing" nil 'replace)))

;; anzu
(global-anzu-mode +1)

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

; Remap C-c, C-v, M-c, M-v
; (global-set-key (kbd "M-c") 'ns-copy-including-secondary)
; (global-set-key (kbd "M-v") 'cua-paste)
; (global-set-key (kbd "S-c") 'capitalize-word)
; (global-set-key (kbd "S-v") 'cua-repeat-replace-region)
