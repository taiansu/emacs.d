(require 'package)
(package-initialize)

(defun ts-require-package (name)
  (unless (package-installed-p name)
    (package-install name)))

(setq package-list
      '(
        ace-jump-mode
        ag
        anzu
        auto-complete
        coffee-mode
        darcula-theme
        dash
        dired+
        findr
        hexrgb
        highlight
        highlight-indentation
        hlinum
        ; inflections
        ; jump
        ; fill-column-indicator
        ; haml-mode
        ; htmlize
        ; inflections
                rainbow-delimiters
        rainbow-mode
        ; minimap
        multi-term
        undo-tree
        whitespace-cleanup-mode

        ;; Source control
        gh
        gist
        magit
        ; magit-gh-pulls
        ; magithub

        ;; Org-mode
        org
        
        ;; Yasnippet
        yasnippet
        elixir-yasnippets

        ;; Languages
        feature-mode
        inf-ruby
        scss-mode
        ;rhtml-mode

        ))

(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
