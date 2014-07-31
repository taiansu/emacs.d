; evil-leader
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "f"  'projectile-find-file
  "e" 'find-file
  "<SPC>" 'evil-buffer
  "c" 'delete-trailing-whitespace
  "o" 'prev-window
  "s" 'ido-switch-buffer
  "x" 'seeing-is-believing
  "k" 'kill-buffer)

;;  "b" ' ;; it's searching ctags in current buffer

; evil-mode
(require 'evil)
(evil-mode 1)

; (define-key evil-normal-state-map (kbd "q") nil)

(define-key evil-insert-state-map (kbd "C-e") nil)
(define-key evil-insert-state-map (kbd "C-d") nil)
(define-key evil-insert-state-map (kbd "C-k") nil)
(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "C-c") 'evil-normal-state)

(define-key evil-motion-state-map (kbd "C-e") nil)
(define-key evil-visual-state-map (kbd "C-c") 'evil-exit-visual-state)

;; esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(define-key evil-normal-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-y" 'yank)
(define-key evil-visual-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-normal-state-map "\C-w" 'evil-delete)
(define-key evil-insert-state-map "\C-w" 'evil-delete)
(define-key evil-insert-state-map "\C-r" 'search-backward)
(define-key evil-visual-state-map "\C-w" 'evil-delete)

;; projectile

(projectile-global-mode)
(setq projectile-enable-caching t)

;; evil-nerd-commenter
(setq evilnc-hotkey-comment-operator "\\")
(require 'evil-nerd-commenter)

;; evil-plugins
(require 'evil-numbers)
(require 'evil-surround)
(require 'evil-matchit)
(require 'evil-args)
(require 'evil-mode-line)
(require 'evil-relative-linum) ;; not works, actually
