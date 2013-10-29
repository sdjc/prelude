
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-h b") 'helm-descbinds)



(defun locale-is-utf8-p ()
  "Return t iff the \"locale\" command or environment variables prefer UTF-8."
  (flet ((is-utf8 (v) (and v (string-match "UTF-8" v))))
    (or (is-utf8 (and (executable-find "locale") (shell-command-to-string "locale")))
        (is-utf8 (getenv "LC_ALL"))
        (is-utf8 (getenv "LC_CTYPE"))
        (is-utf8 (getenv "LANG")))))

(when (or window-system (locale-is-utf8-p))
  (setq utf-translate-cjk-mode t)
  (set-keyboard-coding-system 'utf-8-mac)
  (setq locale-coding-system 'utf-8-mac)
  (set-default-coding-systems 'utf-8-mac)
  (set-selection-coding-system 'utf-8-mac)
  (set-language-environment 'Chinese-GB)
  (setq default-buffer-file-coding-system 'utf-8)
  ;; (set-terminal-coding-system 'utf-8-mac)
  (prefer-coding-system 'utf-8)
  )


;; (setq phi-search-limit 500)



;; (global-set-key (kbd "C-r") '("phi-replace" phi-replace-query query-replace-regexp))
;; (global-set-key (kbd "C-s") '("phi-search" phi-search isearch-forward-regexp))

;; ;; Ctrl-Meta-
;; (global-set-key (kbd "C-M-r") '("phi-replace" phi-replace replace-regexp))
;; (global-set-key (kbd "C-M-s") '("phi-search" phi-search-backward isearch-backward-regexp))

;; (global-set-key (kbd "C-s") 'phi-search)
;; (global-set-key (kbd "C-r") 'phi-search-backward)

;; (global-set-key (kbd "M-%") 'phi-replace)


;; (eval-after-load "phi-search"
;;   '(set-face-attribute 'phi-search-selection-face nil
;;                        :background "orange")
;;   )

;; (defun original-global-set-key (key command))
;; (fset 'original-global-set-key (symbol-function 'global-set-key))


;; (defun my-mc/mark-all-dwim-or-skip-this (arg)
;;   (interactive "P")
;;   (if arg (mc/mark-all-like-this)
;;     (if (eq last-command this-command)
;;         (case my-mc/mark-all-last-executed
;;           ('skip
;;            (mc/mark-next-like-this 0))
;;           ('restricted-defun
;;            (setq my-mc/mark-all-last-executed 'restricted)
;;            (mc/mark-all-symbols-like-this)
;;            (message "SYMBOLS defun -> [SYMBOLS]"))
;;           ('words-defun
;;            (setq my-mc/mark-all-last-executed 'words)
;;            (mc/mark-all-words-like-this)
;;            (message "WORDS defun -> [WORDS] -> ALL"))
;;           ('words
;;            (setq my-mc/mark-all-last-executed 'all)
;;            (mc/mark-all-like-this)
;;            (message "WORDS defun -> WORDS -> [ALL]"))
;;           ('all-defun
;;            (setq my-mc/mark-all-last-executed 'all)
;;            (mc/mark-all-like-this)
;;            (message "ALL defun -> [ALL]"))
;;           (t
;;            (message "no items more to mark")))
;;       (cond ((eq last-command 'mc/mark-next-like-this)
;;              (setq my-mc/mark-all-last-executed 'skip)
;;              (mc/mark-next-like-this 0))
;;             ((and (mc--no-region-and-in-sgmlish-mode) (mc--on-tag-name-p))
;;              (mc/mark-sgml-tag-pair)
;;              (message "TAG PAIR"))
;;             ((not (use-region-p))
;;              (mc--mark-symbol-at-point)
;;              (setq my-mc/mark-all-last-executed 'restricted-defun)
;;              (mc/mark-all-symbols-like-this-in-defun)
;;              (message "[SYMBOLS defun] -> SYMBOLS"))
;;             ((my-mc/marking-words-p)
;;              (setq my-mc/mark-all-last-executed 'words-defun)
;;              (mc/mark-all-words-like-this-in-defun)
;;              (message "[WORDS defun] -> WORDS -> ALL"))
;;             (t
;;              (setq my-mc/mark-all-last-executed 'all-defun)
;;              (mc/mark-all-like-this-in-defun)
;;              (message "[ALL defun] -> ALL"))))))

(global-set-key (kbd "C-,") ' er/expand-region)
(global-set-key (kbd "C-M-a") 'mc/mark-all-like-this-dwim)

;;(global-set-key (kbd "C-a") '("multiple-cursors" my-mc/mark-next-dwim))
; (global-set-key (kbd "C-M-a") '("multiple-cursors" my-mc/mark-all-dwim-or-skip-this))




;;(global-set-key (kbd "\C-x\C-\\") 'goto-last-change)



(eval-after-load "indent-guide-mode"
  '(setq-default indent-guide-mode t)
  ;;  (set-face-background 'indent-guide-face "dimgray")
  )



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes (quote ("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#383838")
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map (quote ((20 . "#BC8383") (40 . "#CC9393") (60 . "#DFAF8F") (80 . "#D0BF8F") (100 . "#E0CF9F") (120 . "#F0DFAF") (140 . "#5F7F5F") (160 . "#7F9F7F") (180 . "#8FB28F") (200 . "#9FC59F") (220 . "#AFD8AF") (240 . "#BFEBBF") (260 . "#93E0E3") (280 . "#6CA0A3") (300 . "#7CB8BB") (320 . "#8CD0D3") (340 . "#94BFF3") (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(paren-face-match ((t (:background "dimgray" :foreground "#93E0E3" :weight bold))) t)
 '(show-paren-match ((t (:background "dimgray" :foreground "#7CB8BB" :weight bold)))))



(defun qiang-font-existsp (font)
  (if (null (x-list-fonts font))
      nil
    t))

(defvar font-list '("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))

(require 'cl) ;; find-if is in common list package
(find-if #'qiang-font-existsp font-list)
(defun qiang-make-font-string (font-name font-size)
  (if (and (stringp font-size)
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))

(defun qiang-set-font (english-fonts
                       english-font-size
                       chinese-fonts
                       &optional chinese-font-size)

  "english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
  (require 'cl) ; for find if
  (let ((en-font (qiang-make-font-string
                  (find-if #'qiang-font-existsp english-fonts)
                  english-font-size))
        (zh-font (font-spec :family (find-if #'qiang-font-existsp chinese-fonts)
                            :size chinese-font-size)))

    ;; Set the default English font
    ;;
    ;; The following 2 method cannot make the font settig work in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
    (message "Set English Font to %s" en-font)
    (set-face-attribute 'default nil :font en-font)
    ;; Set Chinese font
    ;; Do not use 'unicode charset, it will cause the English font setting invalid
    (message "Set Chinese Font to %s" zh-font)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset zh-font))))

;; (set-face-attribute
;;  'default nil :font "Consolas 11")


(qiang-set-font
 '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New") ":pixelsize=11"
 '("Microsoft Yahei" "YaHei Consolas Hybrid" "文泉驿等宽微米黑"  "文泉驿等宽微米黑" "黑体" "新宋体" "宋体" "Hiragino Sans GB" )  )



(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "YaHei Consolas Hybrid" :size 14)))

(require 'auto-complete-config)
(ac-config-default)

(require 'switch-window)

(global-set-key (kbd "RET") 'newline-and-indent)

(setq-default indent-guide-mode t)

(set-frame-parameter nil 'alpha 92)

(setq calendar-latitude +35.24)
(setq calendar-longitude +115.43)
(setq calendar-location-name "heze")

(load-library "textobjects")
(setq visible-bell nil)
(setq ring-bell-function 'ignore)
(global-set-key  (kbd "C-x C-b") 'fiplr-find-file)
(global-set-key  (kbd "M-x") 'helm-M-x)

