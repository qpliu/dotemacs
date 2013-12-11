; don't eat this line

;; startup
(setq term-setup-hook '(lambda () (cd (expand-file-name "~/"))
			 (let ((process-connection-type nil)) (display-time))
			 (and (fboundp 'scroll-bar-mode)
			      (scroll-bar-mode -1)))
;      load-path (append load-path (list ;"/usr/local/lib/emacs/calc"
;					(expand-file-name "~/.emacs.d")))
;      mail-default-reply-to "peter.liu@lightsurf.com"
;      message-default-headers "From: peter.liu@lightsurf.com\nReply-To: peter.liu@lightsurf.com\n"
;      rmail-file-name (expand-file-name "~/mail/RMAIL")
;      mail-yank-prefix ">"
      )
;(set-variable 'rmail-primary-inbox-list
;	      (list "~/mbox" "/var/spool/mail/qpliu"))
;(setenv "P4PORT" "perforce:1666")
;(setenv "P4USER" "pliu")
;(setenv "P4CLIENT" "pliu")
;(setenv "P4CONFIG" ".p4config")
;(setenv "JAVA_HOME" "/home/pliu/java/j2sdk1.4.2_12")
;(setenv "JAVA_HOME" "/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home")
(setenv "PAGER" "cat")
(setenv "EDITOR" "/usr/bin/emacsclient")
(server-start)

;(require 'ange-ftp)
(setq ;pop3-mailhost "mail.lightsurf.com"
      ;pop3-password ""
      ;pop3-maildrop "pliu"
      ;imap-password ""
      ;imap-username "pliu"
      ;gnus-select-method '(nnimap "mail.lightsurf.com")
      ;gnus-directory (expand-file-name "~/a/News")
      ;sendmail-program (expand-file-name "~/bin/fakesendmail")
;      rmail-mode-hook
;      '(lambda ()
;	 (if (not pop3-password)
;	     (setq pop3-password (ange-ftp-read-passwd "POP Password: ")))
;	 (define-key rmail-mode-map "g" 'pop3-rmail-get-new-mail)
;	 (pop3-movemail (expand-file-name "~/mbox")))
      )
;(global-set-key "\C-c\C-xg" 'gnus)

;(defun pop3-rmail-get-new-mail (arg)
;  (interactive "P")
;  (if (or arg (not pop3-password))
;      (setq pop3-password (ange-ftp-read-passwd "POP Password: ")))
;  (pop3-movemail (expand-file-name "~/mbox"))
;  (rmail-get-new-mail))
;(load (expand-file-name "~/bin/emacs/pop3.el"))
;(load (expand-file-name "~/bin/emacs/follow.el"))
;(load (expand-file-name "~/bin/emacs/caml.el"))
;(load (expand-file-name "~/bin/emacs/mk.elc"))
;(load (expand-file-name "~/bin/emacs/cwpuz.el"))
;(global-set-key "\C-c\C-xy" 'cwpuz-yahoo-and-save)
;(global-set-key "\C-c\C-xu" 'cwpuz-usatoday-and-save)
;(require 'egg)
;(setq egg-auto-update nil)
;(setq egg-switch-to-buffer t)

(and
 (eval-after-load "comint"
		  '(define-key comint-mode-map "\C-j" 'comint-send-input))
 (eq window-system 'x)
 (setq
  default-frame-alist
  (list '(minibuffer . t) '(left . 10) '(top . 0) '(width . 80)
	(cons 'height (+ -6 (/ (- (x-display-pixel-height) 25) 13)))
	'(font . "fixed")
	'(foreground-color . "blue") '(background-color . "white")
	'(mouse-color . "black") '(cursor-color . "orange")
	'(vertical-scroll-bars . -1) '(horizontal-scroll-bars . -1)
	'(menu-bar . nil) '(menu-bar-lines . 0))))
(modify-face 'region nil "gray" nil 0 0 0)
;fix annoying crap added to newer versions
;(menu-bar-mode 0)
;(tool-bar-mode 0)
;(blink-cursor-mode 0)

;; editing modes
(setq TeX-mode-hook '(lambda () (auto-fill-mode 1) (setq fill-column 75)
		       (define-key TeX-mode-map "\C-\M-a" 'backward-paragraph)
		       (define-key TeX-mode-map "\C-\M-e" 'forward-paragraph)
		       (define-key TeX-mode-map "\C-cb" 'TeX-BiBTeX-buffer)
		       (define-key TeX-mode-map "\C-cq" 'TeX-clean-zap-files))
      LaTeX-mode-hook '(lambda () (auto-fill-mode 1) (setq fill-column 75))
      TeX-default-mode 'LaTeX-mode
      text-mode-hook '(lambda () (auto-fill-mode 1))
      emacs-lisp-mode-hook '(lambda ()
			      (define-key emacs-lisp-mode-map "\C-c\C-h"
				'mark-defun))
      fortran-mode-hook '(lambda () ; (abbrev-mode 1)
			   (define-key fortran-mode-map "\C-c\C-h"
			     'mark-fortran-subprogram)
			   (define-key fortran-mode-map "\M-\C-h"
			     'backward-kill-word)
			   (setq comment-line-start-skip
				 "^[Cc*#][^ \t\n]*[ \t]*"))
      fortran-continuation-string ">"
      fortran-continuation-indent 5
      c-mode-hook '(lambda () (define-key c-mode-map "\C-c\C-h"
				'c-mark-function)
		     (define-key c-mode-map "\M-\C-h" nil))
      c-default-style "linux"
      c++-mode-hook '(lambda () (define-key c++-mode-map "\C-c\C-h"
				  'c-mark-function)
		       (define-key c++-mode-map "\M-\C-h" nil))
      java-mode-hook '(lambda () (define-key java-mode-map "\C-c\C-h" nil)
			(define-key java-mode-map "\M-\C-h"
			  'backward-kill-word)
			(c-set-style "java")
			(setq indent-tabs-mode nil))
      perl-mode-hook '(lambda () (define-key perl-mode-map "\C-c\C-h"
				   'mark-perl-function)
			(define-key perl-mode-map "\M-\C-h" nil))
      tcl-mode-hook '(lambda () (define-key tcl-mode-map "\C-c\C-h"
				  'mark-tcl-function)
		       (define-key tcl-mode-map "\M-\C-h" nil))
      f90-mode-hook '(lambda () (setq f90-auto-hilit19 nil)
		       (define-key f90-mode-map "\C-\M-h" nil)
		       (define-key f90-mode-map "\C-c\C-h"
			 'f90-mark-subprogram))
      sh-mode-hook '(lambda ()
		      (define-key sh-mode-map "\C-c\C-r" nil))
      sgml-mode-hook '(lambda ()
			(define-key sgml-mode-map "\C-\M-h" nil)
			(define-key sgml-mode-map "\C-c\C-r" nil))
      caml-mode-hook '(lambda ()
			(define-key caml-mode-map "\C-c\C-r" nil)
			(define-key caml-mode-map "\M-\C-h" nil)))

;(setq auto-mode-alist (append (list '("\\.hf$" . fortran-mode)
;				    '("\\.Fh$" . fortran-mode)
;				    '("\\.F$" . fortran-mode)
;				    '("\\.if$" . fortran-mode)
;				    '("\\.cmn$" . fortran-mode)
;				    '("\\.f90$" . f90-mode)
;				    '("\\.sa$" . sather-mode)
;				    '("\\.html$" . text-mode)
;				    '("\\.java$" . java-mode)
;				    '("\\.ads$" . ada-mode)
;				    '("\\.adb$" . ada-mode)
;				    )
;			      auto-mode-alist))

;(autoload 'sather-mode "sather" "Sather Mode" t)
;(setenv "SATHER_HOME" (expand-file-name "/usr/local/Sather"))
;(autoload 'f90-mode "f90" "Fortran 90 Mode" t)

;(setq mail-setup-hook
;      '(lambda () (save-excursion (goto-char (point-min))
;				  (insert "From: peter.liu@lightsurf.com\n")
;				  (delete-matching-lines "^Full-Name:"))))

;; calc
;(setq calc-angle-mode 'rad)

;; enable useful things
(put 'eval-expression 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; customization
;(setq compile-command "ant -s build.xml -emacs")

;; convenient bindings
(global-set-key "\M-\C-r" 'isearch-backward-regexp)
(global-set-key "\C-x\C-b" 'electric-buffer-list)
;(global-set-key "\M-\C-m" 'my-compile)
(global-set-key "\M-\C-m" 'compile)
;; free up control h for deleting
(global-set-key "\M-?" 'help-command)
(global-set-key "\C-x?" 'help-for-help)
;; make control h more like del where convenient
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-\C-h" 'backward-kill-word)
(global-set-key "\C-t" 'my-transpose-chars)
(global-set-key "\C-\\" 'auto-define-key)
(global-set-key "\C-^" 'auto-define-key)
;(global-set-key "\C-x," 'goto-line)
(and (fboundp 'hippie-expand)
     (global-set-key "\C-\M-i" 'hippie-expand))
(global-set-key "\C-c\C-r" 'revert-buffer)
(global-set-key "\C-c\C-w" 'compare-windows)

(defun my-transpose-chars (arg)
  (interactive "P")
  (or arg (and (eolp) (backward-char 1)))
  (call-interactively 'transpose-chars))

;(require 'compile)
;(setq compilation-error-regexp-alist
;  (append (list
;     ;; works for jikes under ant
;     '("^\\s-*\\[[^]]*\\]\\s-*\\(.+\\):\\([0-9]+\\):\\([0-9]+\\):[0-9]+:[0-9]+:" 1 2 3)
;     ;; works for javac under ant
;     ;'("^\\s-*\\[[^]]*\\]\\s-*\\(.+\\):\\([0-9]+\\):[^0-9]" 1 2)
;     )
;  compilation-error-regexp-alist))

;(defun my-compile ()
;  (interactive)
;  (let ((ext (file-name-extension (buffer-file-name)))
;	(src (file-name-nondirectory (buffer-file-name))))
;    (cond
;     ((or (equal "ml" ext) (equal "mli" ext))
;      (setq compile-command (concat "ocamlc -c " src)))
;     ((equal "Makefile" src)
;      (setq compile-command "make -k "))
;     (t
;      (let ((build-xml (find-build-xml (buffer-file-name))))
;	(cond
;	 (build-xml
;	    (setq compile-command
;		(concat "ant -s build.xml -Dbuild.compiler.emacs=true "
;			(find-ant-build-args (buffer-file-name)))))
;	 ((equal "java" ext)
;	  (setq compile-command (concat "javac " src)))))))
;    (call-interactively 'compile)))

;(defun find-build-xml (filename)
;  (let ((build-xml nil))
;    (while (and filename (not (equal "/" filename)) (not build-xml))
;      (setq filename (file-name-directory filename))
;      (if (file-readable-p (concat filename "build.xml"))
;	  (setq build-xml (concat filename "build.xml")))
;      (setq filename (directory-file-name filename)))
;    build-xml))

;(defun find-ant-build-args (filename)
;  (let ((args-filename nil))
;    (while (and filename (not (equal "/" filename)) (not args-filename))
;      (setq filename (file-name-directory filename))
;      (if (file-readable-p (concat filename ".build"))
;	  (setq args-filename (concat filename ".build")))
;      (setq filename (directory-file-name filename)))
;    (if args-filename
;	(with-temp-buffer
;	  (insert-file-contents args-filename)
;	  (buffer-substring
;	   (point-min) (progn (goto-char (point-min)) (end-of-line) (point))))
;      "")))

(defun auto-define-key (key command)
  "Sets the calling key to a command by qpliu@ss01.pppl.gov june 1990"
  (interactive (list
		(this-command-keys)
		(read-command (concat "Set key "
				      (key-description (this-command-keys))
				      " locally to command: "))))
  (local-set-key key command))
