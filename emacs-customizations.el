(when (eq system-type 'darwin)
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))

(add-hook 'prog-mode-hook 'linum-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(blink-cursor-alist (quote ((nil))))
 '(blink-cursor-mode t)
 '(compilation-message-face (quote default))
 '(confirm-kill-emacs (quote y-or-n-p))
 '(create-lockfiles nil)
 '(custom-enabled-themes (quote (base16-tomorrow-dark)))
 '(custom-safe-themes
   (quote
    ("75c0b1d2528f1bce72f53344939da57e290aa34bea79f3a1ee19d6808cb55149" default)))
 '(fill-column 100)
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(magit-diff-use-overlays nil)
 '(mail-indentation-spaces 4)
 '(normal-erase-is-backspace t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(rainbow-identifiers-cie-l*a*b*-lightness 80)
 '(rainbow-identifiers-cie-l*a*b*-saturation 18)
 '(server-mode t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 170 :width normal :foundry "nil" :family "Source Code Pro")))))
