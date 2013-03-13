;; -*-emacs-lisp-*-
;;
;; Emacs startup file, e.g.  /etc/emacs/site-start.d/50haml-mode.el
;; for the Debian haml-mode package
;;
;; Originally contributed by Nils Naumann <naumann@unileoben.ac.at>
;; Modified by Dirk Eddelbuettel <edd@debian.org>
;; Adapted for dh-make by Jim Van Zandt <jrv@debian.org>
;; Adapted for haml by Gunnar Wolf <gwolf@debian.org>

;; The haml-mode package follows the Debian/GNU Linux 'emacsen' policy and
;; byte-compiles its elisp files for each 'emacs flavor' (emacs19,
;; xemacs19, emacs20, xemacs20...).  The compiled code is then
;; installed in a subdirectory of the respective site-lisp directory.
;; We have to add this to the load-path:
(let ((package-dir (concat "/usr/share/"
                           (symbol-name flavor)
                           "/site-lisp/haml-elisp")))
;; If package-dir does not exist, the haml-mode package must have
;; removed but not purged, and we should skip the setup.
  (when (file-directory-p package-dir)
    ;; Use debian-pkg-add-load-path-item per §9 of debian emacs subpolicy
    (debian-pkg-add-load-path-item package-dir )
    (autoload 'haml-mode "haml-mode"
      "Major mode for editing haml-mode files." t)
    (add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))
    ;; The same package provides HAML and SASS modes in the same
    ;; directory - So repeat only the last two instructions for sass
    (autoload 'sass-mode "sass-mode"
      "Major mode for editing sass-mode files." t)
    (add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode))
    ))
