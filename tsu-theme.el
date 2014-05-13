(deftheme tsu
  "Created 2014-05-14.")

(custom-theme-set-variables
 'tsu
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(blink-cursor-mode nil)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil)
 '(custom-safe-themes (quote ("de2c46ed1752b0d0423cde9b6401062b67a6a1300c068d5d7f67725adc6c3afb" "e53cc4144192bb4e4ed10a3fa3e7442cae4c3d231df8822f6c02f1220a0d259a" default))))

(custom-theme-set-faces
 'tsu
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 160 :width normal :foundry "nil" :family "Source Code Pro")))))

(provide-theme 'tsu)
