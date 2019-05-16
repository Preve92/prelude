;; -*- coding: utf-8; lexical-binding: t; -*-

;; wrapper for save-buffer ignoring arguments
(defun bjm/save-buffer-no-args ()
  "Save buffer ignoring arguments"
  (save-buffer))

(require 'pdf-tools)
(pdf-tools-install-noverify)

(with-eval-after-load "pdf-tools"
  (setq-default pdf-view-display-size 'fit-width)
  (setq pdf-annot-activate-created-annotations t) ; automatically annotate highlights
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward) ; use isearch instead of swiper
  (add-hook 'pdf-view-mode-hook (lambda () (cua-mode 0))) ; turn off cua so copy works
  (setq pdf-view-resize-factor 1.1)  ; more fine-grained zooming
  )

;; keyboard shortcuts
(define-key pdf-view-mode-map (kbd "h") 'pdf-annot-add-highlight-markup-annotation)
(define-key pdf-view-mode-map (kbd "t") 'pdf-annot-add-text-annotation)
(define-key pdf-view-mode-map (kbd "D") 'pdf-annot-delete)

;; wait until map is available
(with-eval-after-load "pdf-annot"
  (define-key pdf-annot-edit-contents-minor-mode-map (kbd "<C-return>") 'pdf-annot-edit-contents-commit)
  ;; save after adding comment
  (advice-add 'pdf-annot-edit-contents-commit :after 'bjm/save-buffer-no-args))
