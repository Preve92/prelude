;; -*- coding: utf-8; lexical-binding: t; -*-

;;Always autofill text to 80 char
(setq fill-column 80)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(global-set-key (kbd "C-c q") 'auto-fill-mode)

;; Remove scroll bars
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))
(when (fboundp 'tooltip-mode)
  (tooltip-mode -1))
(set-window-scroll-bars (minibuffer-window) nil nil) ; scroll bar in mini-buffer

;; Use the [[https://github.com/bbatsov/solarized-emacs][solarized theme]]
;;(prelude-require-package 'solarized-theme)
;;(setq solarized-high-contrast-mode-line t ; make modeline high contrast
;;      x-underline-at-descent-line t       ; put the underline below the font bottomline instead of the baseline
;;      )

;; Easily toggle between dark and light theme with =heaven-and-hell=
;;(prelude-require-package 'heaven-and-hell)
;;(setq heaven-and-hell-theme-type 'dark ; Omit to use light by default
;;      heaven-and-hell-themes '((light . solarized-light)
;;                               (dark . solarized-dark))) ; Themes can be the list: (dark . (tsdh-dark wombat))
;;(add-hook 'after-init 'heaven-and-hell-init-hook)
;;(global-set-key (kbd "C-c <f6>") 'heaven-and-hell-load-default-theme)
;;(global-set-key (kbd "<f6>") 'heaven-and-hell-toggle-theme)

;; Hide minor modes and display time in the mode-line
(require 'minions)
;; The ;-) symbol can be hided with the following settings
;;(setq minions-mode-line-lighter ""
;;      minions-mode-line-delimiters '("" . ""))

(minions-mode)

;; set scratch buffer message
(setq initial-scratch-message ";; Happy hacking Marco")

;; Make file sizes human-readable in dired and hide '.' and '..'
(setq-default dired-listing-switches "-lAh")

;; Ask confirmation before closing Emacs
(setq confirm-kill-emacs 'y-or-n-p)
