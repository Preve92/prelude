;; -*- coding: utf-8; lexical-binding: t; -*-

;; Activation
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; Preferences
(setq org-agenda-start-on-weekday 1
      org-odt-preferred-output-format "doc"
      org-log-into-drawer t
      org-enforce-todo-dependencies t ; For more complex dependancies, check =org-depend.el=
      org-enforce-todo-checkbox-dependencies nil
      ;; N.B. If parent has :ORDERED: property, DONE status will be blocked for untill
      ;; all prior sibilings are DONE.
      org-agenda-dim-blocked-tasks t ; and dim blocked TODO in agenda view
      org-directory "/home/marco/org"
      org-default-notes-file (concat org-directory "/Inbox.org")
      org-refile-targets '((org-agenda-files :maxlevel . 4)
                           (nil :maxlevel . 5) ; current buffer
                           ("Archive.org" :maxlevel . 2))
      org-refile-use-outline-path 'file
      org-outline-path-complete-in-steps nil
      org-refile-allow-creating-parent-nodes 'confirm
      org-log-refile 'time
      )

;; Modify org-mode markup
(with-eval-after-load 'org
  (setcar (nthcdr 4 org-emphasis-regexp-components) 5) ; allows markup to span 5 lines
  (org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)
  )

;; TODO keywords
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "WAIT(w@/!)" "SOMEDAY(s)" "|" "DONE(d!/!)" "DELEGATED(D@/!)")
              (sequence "VERIFY(v@/!)" "|" "NOTE(N)")
              (sequence "PROJECT(p@/!)" "|" "COMPLETE(c!/!)" "CANCELLED(C@/!)")
              ))
      )

;; TODO keywords faces
(setq org-todo-keyword-faces '(("TODO" . (:foreground "orange" :weight bold))
                               ("NEXT" . (:foreground "red" :weight bold))
                               ("WAIT"  . (:foreground "yellow" :slant italic))
                               ("VERIFY" . (:foreground "yellow" :underline t))
                               ("NOTE" . (:foreground "gray" :weight bold))
                               ("SOMEDAY" . (:foreground "gray" :background "blue" :weight bold))
                               ("PROJECT" . (:foreground "orange" :background "black" :weight bold))
                               ("COMPLETE" . (:foreground "green" :background "magenta" :weight bold))
                               ("CANCELLED" . (:foreground "gary" :overline "black"))
                               ))

;; Change PROJECT to COMPLETE automatically
(defun org-auto-project-status (n-done n-not-done)
  "Switch entry to COMPLETE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "COMPLETE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; Add support for link between orgmode and pdf-tools
(eval-after-load 'org '(require 'org-pdfview))

(eval-after-load 'org '(add-to-list 'org-file-apps
                                    '("\\.pdf\\'" . (lambda (file link)
                                                      (org-pdfview-open link)))))

;; Define agenda files
(setq org-agenda-files (list "/home/marco/org/Resources.org"
                             "/home/marco/org/Areas.org"
                             "/home/marco/org/Inbox.org"
                             "/home/marco/org/Projects.org"))
