(require 'package)
(package-initialize)

(setq package-list
      '(
        ag
        anzu
        auto-complete
        coffee-mode
        dash
        dired+
        emmet-mode
        enh-ruby-mode
        evil
        evil-anzu
        evil-args
        evil-commentary
        evil-leader
        evil-numbers
        evil-org
        evil-search-highlight-persist
        evil-smartparens
        evil-surround
        exec-path-from-shell
        findr
        flycheck
        fuzzy
        hexrgb
        highlight
        highlight-indentation
        hlinum
        ido-vertical-mode
        inf-ruby
        js2-mode
        json-mode
        multi-term
        rainbow-delimiters
        rainbow-mode
        smartscan
        undo-tree
        whitespace-cleanup-mode
        gh
        gist
        magit
        org
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

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
