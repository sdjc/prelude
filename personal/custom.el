(global-set-key (kbd "C-x C-r") 'recentf-open-files)

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
;  (set-terminal-coding-system 'utf-8-mac)
  (prefer-coding-system 'utf-8)
)

(global-set-key (kbd "C-s") 'phi-search)
(global-set-key (kbd "C-r") 'phi-search-backward)

(global-set-key (kbd "M-%") 'phi-replace)

;(global-set-key (kbd "\C-x\C-\\") 'goto-last-change)



(eval-after-load "indent-guide-mode"
  '(setq-default indent-guide-mode t)
;  (set-face-background 'indent-guide-face "dimgray")
)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
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

(set-face-attribute 
 'default nil :font "Consolas 11") 


(qiang-set-font
 '("Consolas 11" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New") ":pixelsize=11"
 '("Microsoft Yahei" "YaHei Consolas Hybrid"  "文泉驿等宽微米黑" "黑体" "新宋体" "宋体") )
(dolist (charset '(kana han symbol cjk-misc bopomofo)) 
  (set-fontset-font (frame-parameter nil 'font) 
                    charset 
                    (font-spec :family "YaHei Consolas Hybrid" :size 14)))

(require 'auto-complete-config)
(ac-config-default)

(require 'switch-window)

(setq-default indent-guide-mode t)

(set-frame-parameter nil 'alpha 92)

(setq calendar-latitude +35.24)
(setq calendar-longitude +115.43)
(setq calendar-location-name "heze")
