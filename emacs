;;; Load files and set variables
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)


(let ((default-directory "~/.emacs.d/lisp/"))
      (normal-top-level-add-to-load-path '("."))
      (normal-top-level-add-subdirs-to-load-path))

(let ((default-directory "~/.emacs.d/elpa"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(setenv "PATH"
	(concat 
	 "/usr/texbin:/opt/local/bin" 
	 ":" 
	 (getenv "PATH")))
(unless (window-system)
  (setenv "TERM" "xterm-256color"))
(add-to-list 'load-path "~/.emacs.d/themes")

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'solarized-dark t)
;;(load-theme 'tango t)

;;(global-set-key "\C-c\C-t" (load-theme 'solarized-dark))


(setq make-backup-files nil)

(set-face-attribute 'default nil :height 120 :family "DejaVu Sans Mono" :weight 'normal)
;; (add-to-list 'load-path "~/.emacs.d/lisp/")
;; (add-to-list 'load-path "~/.emacs.d/lisp/company-mode/")
;; (add-to-list 'load-path "~/.emacs.d/lisp/nxml/")
;; (add-to-list 'load-path "~/.emacs.d/lisp/org-mode/")

(setq line-number-mode t)
(setq column-number-mode t)

(require 'cl)

;; Autocomplete
(require 'auto-complete)
(global-auto-complete-mode t)
(setq ac-auto-start 3)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(require 'auto-complete-config)
(ac-config-default)
;;



(setq auto-save-default nil)
;; (global-visual-line-mode 1)
;; (recentf-mode t)

;; (require 'generic-x)
;; (define-generic-mode 'my-mode ;; name of the mode
;;   '("#")                           ;; comments delimiter
;;   '("function" "@begin" "@end")   ;; some keywords
;; n  '(("@[a-zA-Z][a-zA-Z0-9]*(.*)" . 'font-lock-builtin-face)
;;     ("@begin{[a-zA-Z]+}" . 'font-lock-doc-face)
;;     ("@end{[a-zA-Z]+}" . 'font-lock-doc-face))     ;; a built-in 
;;   '("\\.myext$")                    ;; files that trigger this mode
;;   nil                              ;; any other functions to call
;;   "My custom highlighting mode"     ;; doc string
;;   )

;; Tramp
(setq tramp-default-method "ssh")

;; IDO Mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-create-new-buffer 'always)

;;;; Modes for editing and programming


;; AucTeX
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq-default TeX-master nil)
;; Django
(load "django-html-mode.el" nil t t)
;; Folding
(autoload 'folding-mode          "folding" "Folding mode" t)
(autoload 'turn-off-folding-mode "folding" "Folding mode" t)
(autoload 'turn-on-folding-mode  "folding" "Folding mode" t)

(if (load "folding" 'nomessage 'noerror)
    (folding-mode-add-find-file-hook))
(folding-add-to-marks-list 'tuareg-mode "(*{{{"  "(*}}}*)"  nil t)
(add-hook 'tuareg-mode-hook 'folding-mode)
;; GO Programming language
(require 'go-mode-load)
(add-to-list 'auto-mode-alist '("\\.go" . go-mode))


;; Haskell
(load "~/.emacs.d/lisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; Javascript
;; (require 'coffee-mode)
;; (add-to-list 'auto-mode-alist '("\\.coffee" . coffee-mode))

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))
(setq js-indent-level 2)

;; Jinja2 mode

;; Julia
(require 'julia-mode)
(add-to-list 'auto-mode-alist '("\\.jl" . julia-mode))

;; Markdown
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.mdwn" . markdown-mode) auto-mode-alist))


;; org-mode

(require 'org-install)
(require 'org-latex)
(add-to-list 'auto-mode-alist '("\\.org" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-switchb)
(add-to-list 'org-export-latex-classes 
	     '("amsart"	       "\\documentclass[11pt]{amsart}\n\\usepackage{geometry}\n\\usepackage{hyperref}"
	      ("\\section{%s}" . "\\section*{%s}")
	      ("\\subsection{%s}" . "\\subsection*{%s}")
	      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "|" "DONE")
	(sequence "EASY" "HARD" "SOFT" "|" "PLAIN")))

(setq org-publish-project-alist 
      '(("vu"
	 :base-directory "~/code/web/vu/10f/org"
	 :base-extension "org"
	 :publishing-directory "~/code/web/vu/10f/html"
	 :publishing-function org-publish-org-to-html
	 :body-only t
	 :headline-level 3
	 :section-numbers nil
	 :style-include-default nil
	 :style "<link rel='stylesheet' type='text/css' href='/~mrinalr/css/style.css'/>"
	 :auto-preamble nil
	 :auto-postamble nil
	 :preamble "Hello this is it"
	 :postamble "Done")))


;; OCaml

(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

(require 'ocp-indent)
(require 'merlin)

(setq merlin-use-auto-complete-mode 'easy)
(setq merlin-error-after-save nil)
(setq merlin-command 'opam)

(add-hook 'tuareg-mode-hook 
          '(lambda () 
             (merlin-mode)
             (setq indent-line-function 'ocp-indent-line)
             (utop-setup-ocaml-buffer)
             ))

(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist)) 
(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
;;(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
;;(add-hook 'tuareg-mode-hook 'merlin-mode)
;;(setq merlin-use-auto-complete-mode t)


;; Setup environment variables using opam
(dolist (var (car (read-from-string (shell-command-to-string "opam config env --sexp"))))
  (setenv (car var) (cadr var)))

;; Update the emacs path
(setq exec-path (append (parse-colon-path (getenv "PATH"))
                        (list exec-directory)))

;;Update the emacs load path
(add-to-list 'load-path (expand-file-name "../../share/emacs/site-lisp"
                                          (getenv "OCAML_TOPLEVEL_PATH")))

;; Automatically load utop.el
(autoload 'utop "utop" "Toplevel for OCaml" t)

;; (autoload 'tuareg-mode "tuareg" "Major mode for editing OCaml code" t)
;; (autoload 'tuareg-run-ocaml "tuareg" "Run an inferior OCaml process." t)
;; (autoload 'ocamldebug "ocamldebug" "Run the OCaml debugger" t)
;; (add-hook 'tuareg-mode-hook 'tuareg-imenuset-imenu)
;; (add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))

;; Python mode
;; (autoload 'python "python" nil t t)
;; (require 'python) 
;; (require 'ipython)
(require 'python-mode)
(autoload 'python-mode "python-mode" "Python Mode." t)   

(add-to-list 'auto-mode-alist '("\\.py" . python-mode))   
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(require 'cython-mode)
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxd\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxi\\'" . cython-mode))

(setq-default py-indent-offset 4)
(setq python-indent 4)
(setq python-indent-offset 4)



;; Pymacs
;; (setenv "PYMACS_PYTHON" "python2.6")
;; (require 'pymacs)
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)

;; ;; ROPE
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)

;; ReStructuredText mode
(autoload 'rst-mode "rst.el")
(setq auto-mode-alist
      (append '(("\\.rst" . rst-mode)
		("\\.rest" . rst-mode)) auto-mode-alist))

;; Ruby
(add-to-list 'auto-mode-alist '("\\.rb" . ruby-mode))

;;Scala

;; Load the ensime lisp code...
;;(add-to-list 'load-path "OT/elisp/")
;; (require 'ensime)

;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; SLIME
;; (setq inferior-lisp-program "/usr/loca/bin/sbcl")
;; (add-to-list 'load-path "~/.emacs.d/lisp/slime/")
;; (require 'slime)
;; (slime-setup '(slime-fancy))
;; (setq slime-startup-animation t)
;; (add-hook 'lisp-mode-hook (lambda () (slime-mode t)))


(require 'ess-site)
;; Web
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; YAML
(autoload 'yaml-mode "yaml-mode.el")
(add-to-list 'auto-mode-alist '("\\.yaml" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.json" . yaml-mode))

;; YASnippet
;; (add-to-list 'load-path "/dir/to/yasnippet.el")
(require 'yasnippet)
(setq yas/root-directory '("~/.emacs.d/lisp/custom-snippets"
                           "~/.emacs.d/lisp/yasnippet/snippets"))
;; (yas/load-directory yas/root-directory)
(setq yas/trigger-key (kbd "C-c y"))
(yas/initialize)
(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt
			     yas/ido-prompt
			     yas/completing-prompt))

;;;; User interface changes

;; Turn off startup screen
(setq inhibit-startup-message t)
;; Turn off the audible bell and replace with visible bell
(setq bell-volume 0)
(setq visible-bell nil)
;; Display time and date in modeline
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)

;; color-themes made easy
;; (require 'color-theme)
;; (require 'color-theme-blackbard)
;; (require 'color-theme-tango)
;; (require 'color-theme-zenburn)
;; (require 'color-theme-git)
;; (require 'color-theme-light)

;; (require 'color-theme-freak)
;; (require 'color-theme-bill-clementson)
;; (color-theme-bill-clementson)

;; Show line numbers
(global-linum-mode t)
;; Change indentation so that tab are spaces
(put 'upcase-region 'disabled nil)
;; Get ansi colors in shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; Remove scrollbars and menu and toolbar
(if (fboundp 'scroll-bar-mode) 
    (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) 
    (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))
;; modify the keymap so that C-x C-m is the same as M-x
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-cm" 'execute-extended-command)
(global-set-key "\C-xm" 'execute-extended-command)
;; Stole this function from somewhere to auto resize the emacs screen
;; based on the current resolution
;; (defun set-frame-size-according-to-resolution ()
;;   (interactive)
;;   (if window-system
;;   (progn
;;     ;; use 120 char wide window for largeish displays
;;     ;; and smaller 80 column windows for smaller displays
;;     ;; pick whatever numbers make sense for you
;;     (if (> (x-display-pixel-width) 1280)
;;         (add-to-list 'default-frame-alist (cons 'width 80))
;;       (add-to-list 'default-frame-alist (cons 'width 80)))
;;     ;; for the height, subtract a couple hundred pixels
;;     ;; from the screen height (for panels, menubars and
;;     ;; whatnot), then divide by the height of a char to
;;     ;; get the height we want
;;     (add-to-list 'default-frame-alist 
;;                  (cons 'height (/ (- (x-display-pixel-height)
;;                  120) 
;;                                   (frame-char-height)))))))

;; (unless (fboundp 'set-frame-size-according-to-resolution)
;;   (set-frame-size-according-to-resolution))
;; Emacs queries before killing session
(defun query-kill-emacs ()
  (yes-or-no-p "Kill Emacs? "))
(unless (memq 'query-kill-emacs kill-emacs-query-functions)
  (setq kill-emacs-query-functions 
        (cons 'query-kill-emacs kill-emacs-query-functions)))
;; (setq kill-emacs-query-functions 
;;      (cons (lambda () (yes-or-no-p "Kill Emacs? "))
;;	    kill-emacs-query-functions))
;; (setq kill-emacs-query-functions
;;      (cons 'query-kill-emacs kill-emacs-query-functions))
;; (defun query-kill-emacs ()
;;  (yes-or-no-p "Kill Emacs? "))

; from newsgroup gnu.emacs.help, by Richard Riley, 2009-08-02 
(defun open-current-file-as-admin ()
  "Open the current buffer as unix root. This command works on
unixes only."
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/sudo:root@localhost:" buffer-file-name))))
; (add-to-list 'initial-frame-alist '(width . 80))
; (add-to-list 'initial-frame-alist '(height . 36))
; (require 'ess-site)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(defvar current-date-time-format "%m/%d/%Y (%A) at %H"
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

(defvar current-time-format "%a %H:%M:%S"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defun insert-current-date-time ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
       (interactive)
;       (insert "==========\n")
;       (insert (let () (comment-start)))
       (insert (format-time-string current-date-time-format (current-time)))
       (insert "\n")
       )

(defun insert-current-time ()
  "insert the current time (1-week scope) into the current buffer."
       (interactive)
       (insert (format-time-string current-time-format (current-time)))
       (insert "\n")
       )

(global-set-key "\C-c\C-d" 'insert-current-date-time)
(global-set-key "\C-x\C-t" 'insert-current-time)
(add-hook 'TeX-mode-hook
          '(lambda () 
             (local-set-key "\C-c\C-d" 'insert-current-date-time)))

(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq redisplay-dont-pause t)



