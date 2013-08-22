;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

;;; prelude-php.el --- Emacs Prelude: A nice setup for php devs.
;;
;; Copyright © 2011-2013 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for Ruby and Rails development.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(require 'prelude-programming)
(require 'php-extras)

;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

(eval-after-load 'php-mode
  '(progn
     (defun prelude-php-mode-defaults ()
       (setq flycheck-check-syntax-automatically '(save ))
       ;; turn off the annoying input echo in irb
      (php-enable-pear-coding-style)
      (require 'multi-web-mode)
      (zencoding-mode)
      ;; (flycheck-stop-checker)
      (setq mweb-default-major-mode 'html-mode)
      (setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                        (js-mode "<script[^>]*>" "</script>")
                        (css-mode "<style[^>]*>" "</style>")))
      (setq mweb-filename-extensions '("php" "htm" "html" "asp" ))
      (multi-web-global-mode 1)
      (subword-mode 1))
     (setq prelude-php-mode-hook 'prelude-php-mode-defaults)
     (add-hook 'php-mode-hook (lambda ()
                                (run-hooks 'prelude-php-mode-hook)))))
(provide 'prelude-php)
;;; prelude-ruby.el ends here
