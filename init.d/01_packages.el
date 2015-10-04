(require 'package)
(package-initialize)

(defun ts-require-package (name)
  (unless (package-installed-p name)
    (package-install name)))

(setq package-list
      '(
        ag
        anzu
        auto-complete
        coffee-mode
        dash
        dired+
        enh-ruby-mode
        evil
        exec-path-from-shell
        findr
        flycheck
        fuzzy
        hexrgb
        highlight
        highlight-indentation
        hlinum
        ido-vertical-mode
        js2-mode
        json-mode
        ; htmlize
        ; inflections
        multi-term
        rainbow-delimiters
        rainbow-mode
        smartscan
        undo-tree
        whitespace-cleanup-mode
        gh
        gist
        magit
        ; magit-gh-pulls
        ; magithub

        org
        ;; Yasnippet
        yasnippet
        elixir-yasnippets

        ;; Themes
        base16-theme

        ;; Languages
        feature-mode
        inf-ruby
        scss-mode
        tern
        tern-auto-complete
        web-mode
        ))

(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
