(define-module (pj packages slime-swank)
  #:use-module (gnu packages)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (gnu packages lisp-xyz)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix utils)
  #:use-module (guix build-system asdf)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages base)
;  #:use-module (gnu packages c)
;  #:use-module (gnu packages compression)
;  #:use-module (gnu packages databases)
;  #:use-module (gnu packages enchant)
;  #:use-module (gnu packages figlet)
;  #:use-module (gnu packages file)
;  #:use-module (gnu packages fonts)
;  #:use-module (gnu packages fontutils)
;  #:use-module (gnu packages game-development)
;  #:use-module (gnu packages gl)
;  #:use-module (gnu packages glib)
;  #:use-module (gnu packages gnome)
;  #:use-module (gnu packages gnupg)
;  #:use-module (gnu packages graphviz)
;  #:use-module (gnu packages gtk)
;  #:use-module (gnu packages image)
;  #:use-module (gnu packages imagemagick)
;  #:use-module (gnu packages kerberos)
;  #:use-module (gnu packages libevent)
;  #:use-module (gnu packages libffi)
;  #:use-module (gnu packages linux)
;  #:use-module (gnu packages lisp)
;  #:use-module (gnu packages lisp-check)
;  #:use-module (gnu packages maths)
;  #:use-module (gnu packages mp3)
;  #:use-module (gnu packages mpi)
;  #:use-module (gnu packages ncurses)
;  #:use-module (gnu packages networking)
;  #:use-module (gnu packages package-management)
;  #:use-module (gnu packages pkg-config)
;  #:use-module (gnu packages python)
;  #:use-module (gnu packages python-xyz)
;  #:use-module (gnu packages readline)
;  #:use-module (gnu packages rsync)
;  #:use-module (gnu packages sdl)
;  #:use-module (gnu packages serialization)
;  #:use-module (gnu packages sqlite)
;  #:use-module (gnu packages statistics)
;  #:use-module (gnu packages tcl)
;  #:use-module (gnu packages tls)
;  #:use-module (gnu packages version-control)
;  #:use-module (gnu packages video)
;  #:use-module (gnu packages web)
;  #:use-module (gnu packages webkit)
;  #:use-module (gnu packages xdisorg)
;  #:use-module (gnu packages xml)
;  #:use-module (gnu packages xorg)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-19))

(package
  (name "pj-sbcl-slime-swank")
  (version "2.27")
  (source
   (origin
     (file-name (git-file-name "slime-swank" version))
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/slime/slime/")
           (commit (string-append "v" version))))
     (sha256
      (base32 "1s5mbljlz22pb90gwbd380nighkz6gdxl77hc08gri7wwr5gy5n2"))
     (modules '((guix build utils)))
     (snippet
      ;; The doc folder drags `gawk' into the closure.  Doc is already
      ;; provided by emacs-slime.
      `(begin
         (delete-file-recursively "doc")
         #t))))
  (build-system asdf-build-system/sbcl)
  (arguments
   '(#:asd-systems '("swank")
     #:phases
     (modify-phases %standard-phases
       (add-after 'unpack 'set-fasl-directory
         (lambda* (#:key outputs #:allow-other-keys)
           (let* ((out (assoc-ref outputs "out"))
                  (lib-dir (string-append out "/lib/common-lisp/"
                                          (%lisp-type)
                                          "/slime-swank/")))
             ;; Use the ASDF registry instead of Swank's default that places
             ;; the .fasl files in ~/.slime.
             (substitute* "swank.asd"
               (("\\(load \\(asdf::component-pathname f\\)\\)" all)
                (string-append
                 all "\n"
                 "(setf (symbol-value"
                 "(read-from-string \"swank-loader::*fasl-directory*\"))"
                 "\"" lib-dir "\")")))
             (substitute* "swank-loader.lisp"
               (("\\(probe-file fasl\\)" all)
                ;; Do not try to delete Guix store files.
                (string-append
                 all "\n"
                 " (not (equal (subseq (pathname-directory fasl) 1 3)"
                 " '(\"gnu\" \"store\"))) ; XXX: GUIX PATCH")))))))))
  (inputs (list sbcl-trivial-cltl2))
  (home-page "https://github.com/slime/slime")
  (synopsis "Common Lisp Swank server")
  (description
   "This is only useful if you want to start a Swank server in a Lisp
processes that doesn't run under Emacs.  Lisp processes created by
@command{M-x slime} automatically start the server.")
  (license (list license:gpl2+ license:public-domain)))
