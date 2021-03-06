(require 'dired)
(require 'dired-x)
(require 'dired+)

;; 讓 Dired 有「多欄式」效果：用 C-x 3 在螢幕上開兩個 dired 視窗，
;; 再來只要按 R 或 C（移動/複製檔案）時，會自動以另一個視窗為
;; 預設目標路徑。
(setq dired-dwim-target t)

;; 用 C-o 在多欄中切換
(define-key dired-mode-map (kbd "C-o") 'other-window)

;; 按 Enter 及滑鼠時 Dired 時不會一直開新的 Dired buffer
(define-key dired-mode-map (kbd "RET") 'diredp-find-file-reuse-dir-buffer)
(define-key dired-mode-map [mouse-2] 'diredp-mouse-find-file-reuse-dir-buffer)

;; 按 q 回到上層目錄，並自動把 cursor 移動到前一個目錄處
(defun my-dired-backward ()
  "Go back to the parent directory (..), and the cursor will be moved to where
          the previous directory."
  (interactive)
  (let* ((DIR (buffer-name)))
    (if (equal DIR "*Find*")
        (quit-window t)
      (progn (find-alternate-file "..")
             (re-search-forward DIR nil :no-error)
             (revert-buffer)))))
(define-key dired-mode-map (kbd "q") 'my-dired-backward)

;; 目錄排在檔案之前。
(defun dired-directory-sort ()
  "Dired sort hook to list directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max))))
  (and (featurep 'xemacs)
       (fboundp 'dired-insert-set-properties)
       (dired-insert-set-properties (point-min) (point-max)))
  (set-buffer-modified-p nil))

(add-hook 'dired-after-readin-hook 'dired-directory-sort)

;; 避免 Dired 問你一些囉唆的問題
(put 'dired-find-alternate-file 'disabled nil)

;;自動隱藏以.開頭的檔案（使用 C-x M-o 顯示/隱藏）
(setq dired-omit-files "^\\...+$")

;; Dired Omit 加強:
;; 簡單來說，這個能夠紀錄下目前的「隱藏狀態」，所以當你按
;; C-x M-o 隱藏以.為開頭的檔案後，即使到了不同目錄下，以.開頭的檔案
;; 依舊是處於隱藏狀態，直到你重新按 C-x M-o 為止。
(defvar v-dired-omit t
  "If dired-omit-mode enabled by default. Don't setq me.")
(defun dired-omit-and-remember ()
  "This function is a small enhancement for `dired-omit-mode', which will
        \"remember\" omit state across Dired buffers."
  (interactive)
  (setq v-dired-omit (not v-dired-omit))
  (dired-omit-auto-apply)
  (revert-buffer))

(defun dired-omit-auto-apply ()
  (setq dired-omit-mode v-dired-omit))

(define-key dired-mode-map (kbd "C-x M-o") 'dired-omit-and-remember)
(add-hook 'dired-mode-hook 'dired-omit-auto-apply)

;;使用 KB, MB 等方式顯示檔案大小（這個應該是 Unix 限定...Windows 我不
;;知該怎麼辦）。
(setq dired-listing-switches "-alh")

;; 和 KDE 的 Dolphin 一樣的檔案名過濾器，按 C-i 使用。 (by letoh)
(defun dired-show-only (regexp)
  (interactive "sFiles to show (regexp): ")
  (dired-mark-files-regexp regexp)
  (dired-toggle-marks)
  (dired-do-kill-lines))
(define-key dired-mode-map (kbd "C-i") 'dired-show-only)

;; 遞迴拷貝/複製檔案時的確認訊息設定
(setq dired-recursive-copies  'always) ; 拷貝檔案；「always」 表示永不詢問。
(setq dired-recursive-deletes 'top) ; 刪除檔案：「top」表示同一批檔案只詢問一次。

;; M-Enter 呼叫外部程式（此處是透過 `kde-open`）來開啟檔案，如果你不是
;; 用 KDE，可以改成 xdg-open 之類的。Windows 我不知該怎麼辦啦啦啦。
(defun dired-open-file-with-external-program ()
  "Open file with external program in dired"
  (interactive)
  (let* ((file (dired-get-filename nil t)))
    (message "Opening %s..." file)
    (call-process "open" nil 0 nil file)
    (message "Opening %s done" file)))
(define-key dired-mode-map (kbd "M-RET") 'dired-open-file-with-external-program)

;; 在 Dired 下 C-x C-j 使用`kde-open`等外部程式開啟「當前目錄」
(defun open-current-directory-with-external-program ()
  "open current directory with external program."
  (interactive)
  (call-process "open" nil 0 nil (file-truename default-directory)))
(define-key dired-mode-map (kbd "C-x C-j") 'open-current-directory-with-external-program)

;; 使用 f 搜尋目前目錄（這個部份可能也是 Unix 限定）
(define-key dired-mode-map "f" 'dired-find-name-in-current-directory)
(defun dired-find-name-in-current-directory ()
  (interactive)
  (find-name-dired default-directory
                   (format "*%s*" (read-from-minibuffer "Pattern: ")))
  (set-buffer-multibyte t))
(setq find-name-arg "-iname")

;; 修正*Find*裡的中文亂碼問題
(setq find-ls-option '("-print0 | xargs -0 ls -ald" . ""))

;; 手動開系統的外接硬碟掛載目錄很麻煩，乾脆弄個快速鍵，C-c m 直接開
;; /Volumes/（如果你的系統掛載路徑不在這，請自行修改）
(defun dired-open-mounted-media-dir ()
  (interactive)
  (find-file "/Volumes/"))
(define-key dired-mode-map (kbd "C-c m") 'dired-open-mounted-media-dir)

;; 按 s 排序檔案，會先問你要根據什麼屬性排序，而且紀錄下排序狀態，不會
;; 跨 buffer 就不見了。
(defun dired-sort-size ()
  "Dired sort by size."
  (interactive) (dired-sort-other (concat dired-listing-switches "S")))
(defun dired-sort-extension ()
  "Dired sort by extension."
  (interactive) (dired-sort-other (concat dired-listing-switches "X")))
(defun dired-sort-ctime ()
  "Dired sort by create time."
  (interactive) (dired-sort-other (concat dired-listing-switches "ct")))
(defun dired-sort-utime ()
  "Dired sort by access time."
  (interactive) (dired-sort-other (concat dired-listing-switches "ut")))
(defun dired-sort-time ()
  "Dired sort by time."
  (interactive) (dired-sort-other (concat dired-listing-switches "t")))
(defun dired-sort-name ()
  "Dired sort by name."
  (interactive) (dired-sort-other (concat dired-listing-switches "")))

(defvar v-dired-sort 'name)
(defun dired-sort-and-remember ()
  ""
  (interactive)
  (setq v-dired-sort
        (intern
         (completing-read "Sort by: " '(name size extension ctime utime time) nil t
                          (cond ((eq v-dired-sort 'name) "time")
                                ((eq v-dired-sort 'time) "name")
                                ((eq v-dired-sort 'size) "name")
                                (t nil)))))
  (dired-sort-auto-apply))

(defun dired-sort-auto-apply ()
  (cond ((eq v-dired-sort 'name) (dired-sort-name))
        ((eq v-dired-sort 'size) (dired-sort-size))
        ((eq v-dired-sort 'extenstion) (dired-sort-extenstion))
        ((eq v-dired-sort 'ctime) (dired-sort-ctime))
        ((eq v-dired-sort 'utime) (dired-sort-utime))
        ((eq v-dired-sort 'time) (dired-sort-time))))

(add-hook 'dired-mode-hook 'dired-sort-auto-apply)
(define-key dired-mode-map "s" 'dired-sort-and-remember)

;; allow dired to be able to delete or copy a whole dir.
(setq dired-recursive-copies (quote always)) ; "always" means no asking
(setq dired-recursive-deletes (quote top)) ; "top" means ask once
