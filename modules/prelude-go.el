;;; prelude-go.el --- Emacs Prelude: go configuration. 
;; 
;; Copyright © 2011-2013 Bozhidar Batsov 
;; 
;; Author: Bozhidar Batsov <bozhidar@batsov.com> 
;; URL: https://github.com/bbatsov/prelude 
;; Version: 1.0.0 
;; Keywords: convenience 


;; This file is not part of GNU Emacs. 


;;; Commentary: 


;; Some basic configuration for cc-mode and the modes derived from it. 


;;; Code: 


(require 'prelude-programming) 
(prelude-ensure-module-deps '(go-mode go-autocomplete)) 



(defun prelude-go-mode-common-defaults () 
  (setq indent-tabs-mode t) 
  ) 


(setq prelude-go-mode-common-hook 'prelude-go-mode-common-defaults) 


;; this will affect all modes derived from cc-mode, like 
;; java-mode, php-mode, etc 
(add-hook 'go-mode-common-hook (lambda () 
                                 (run-hooks 'prelude-go-mode-common-hook))) 


;; (defun prelude-makefile-mode-defaults () 
;;   (setq indent-tabs-mode t)) 


;; (setq prelude-makefile-mode-hook 'prelude-makefile-mode-defaults) 


;; (add-hook 'makefile-mode-hook (lambda () 
;;                                 (run-hooks 'prelude-makefile-mode-hook))) 


(eval-after-load 'go-mode 
  '(progn 
     (defun prelude-go-mode-defaults () 
       (auto-complete-mode 1) 
       (setq ac-sources '(ac-source-go)) 
       (make-local-variable 'outline-regexp) 
       (setq outline-regexp "//\\.\\|//[^\r\n\f][^\r\n\f]\\|pack\\|func\\|impo\\|cons\\|var.\\|type\\|\t\t*....") 
       (outline-minor-mode 1) 
       (local-set-key "\M-a" 'outline-previous-visible-heading) 
       (local-set-key "\M-e" 'outline-next-visible-heading) 


       ;; CamelCase aware editing operations 


       (setq prelude-go-mode-hook 'prelude-go-mode-defaults) 


       (add-hook 'go-mode-hook (lambda () 
                                 (run-hooks 'prelude-go-mode-hook)))))) 


(defun go () 
  "run current buffer" 
  (interactive) 
  (compile (concat "go run " (buffer-file-name)))) 


;; helper function 
(defun go-fmt-buffer () 
  "run gofmt on current buffer" 
  (interactive) 
  (if buffer-read-only 
      (progn 
        (ding) 
        (message "Buffer is read only")) 
    (let ((p (line-number-at-pos)) 
          (filename (buffer-file-name)) 
          (old-max-mini-window-height max-mini-window-height)) 
      (show-all) 
      (if (get-buffer "*Go Reformat Errors*") 
          (progn 
            (delete-windows-on "*Go Reformat Errors*") 
            (kill-buffer "*Go Reformat Errors*"))) 
      (setq max-mini-window-height 1) 
      (if (= 0 (shell-command-on-region (point-min) (point-max) "gofmt" "*Go Reformat Output*" nil "*Go Reformat Errors*" t)) 
          (progn 
            (erase-buffer) 
            (insert-buffer-substring "*Go Reformat Output*") 
            (goto-char (point-min)) 
            (forward-line (1- p))) 
        (with-current-buffer "*Go Reformat Errors*" 
          (progn 
            (goto-char (point-min)) 
            (while (re-search-forward "<standard input>" nil t) 
              (replace-match filename)) 
            (goto-char (point-min)) 
            (compilation-mode)))) 
      (setq max-mini-window-height old-max-mini-window-height) 
      (delete-windows-on "*Go Reformat Output*") 
      (kill-buffer "*Go Reformat Output*")))) 
;; helper function 
(defun go-fix-buffer () 
  "run gofix on current buffer" 
  (interactive) 
  (show-all) 
  (shell-command-on-region (point-min) (point-max) "go tool fix -diff")) 
(provide 'prelude-go) 
;;; prelude-go.el ends here 
