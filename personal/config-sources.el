;;; -*- coding: utf-8; lexical-binding: t; -*-
;;; Author: Marco Prevedello

;; set package sources
(require 'package)
;; Prevent package system load before packages' archives being set
(setq package-enable-at-startup nil)
;; Set packages' archivies
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))
;; Initialise the built-in packages manager
(package-initialize)

;; prefer newer packages
(setq load-prefer-newer t)
