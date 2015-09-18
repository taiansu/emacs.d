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
        dash
        dired+
        enh-ruby-mode
        findr
        flycheck
        hexrgb
        highlight
        highlight-indentation
        hlinum
        ; inflections
        ; jump
        ; fill-column-indicator
        ; htmlize
        ; inflections
        ; minimap
        multi-term
        rainbow-delimiters
        rainbow-mode
        smartscan
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

        ;; Themes
        base16-theme

        ;; Languages
        feature-mode
        inf-ruby
        js2-mode
        scss-mode
        tern
        tern-auto-complete
        ;rhtml-mode
        ))

(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
