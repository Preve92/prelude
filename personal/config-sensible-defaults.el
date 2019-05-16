;; -*- coding: utf-8; lexical-binding: t; -*-

;; Author: H.R. Schwartz
;; See https://github.com/hrs/sensible-defaults.el/sensible-defaults.el
;; deleted what is not needed or desired

(defun hrs/open-files-from-home-directory ()
  "When opening a file, start searching at the user's home
directory."
  (setq default-directory "~/"))

(defun hrs/treat-camelcase-as-separate-words ()
  "Treat CamelCaseSubWords as separate words in every programming
mode."
  (add-hook 'prog-mode-hook 'subword-mode))

(defun hrs/automatically-follow-symlinks ()
  "When opening a file, always follow symlinks."
  (setq vc-follow-symlinks t))

(defun hrs/make-scripts-executable ()
  "When saving a file that starts with `#!', make it executable."
  (add-hook 'after-save-hook
            'executable-make-buffer-file-executable-if-script-p))

(defun hrs/single-space-after-periods ()
  "Don't assume that sentences should have two spaces after
periods. This ain't a typewriter."
  (setq sentence-end-double-space nil))

(defun hrs/offer-to-create-parent-directories-on-save ()
  "When saving a file in a directory that doesn't exist, offer
to (recursively) create the file's parent directories."
  (add-hook 'before-save-hook
            (lambda ()
              (when buffer-file-name
                (let ((dir (file-name-directory buffer-file-name)))
                  (when (and (not (file-exists-p dir))
                             (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
                    (make-directory dir t)))))))

(defun hrs/yank-to-point-on-mouse-click ()
  "When middle-clicking the mouse to yank from the clipboard,
insert the text where point is, not where the mouse cursor is."
  (setq mouse-yank-at-point t))

(defun hrs/use-all-settings ()
  "Use all of the hrs settings."
  (hrs/open-files-from-home-directory)
  (hrs/treat-camelcase-as-separate-words)
  (hrs/automatically-follow-symlinks)
  (hrs/make-scripts-executable)
  (hrs/single-space-after-periods)
  (hrs/offer-to-create-parent-directories-on-save)
  (hrs/yank-to-point-on-mouse-click))

(hrs/use-all-settings)
