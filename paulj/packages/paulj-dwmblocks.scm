(define-public paulj-dwmblocks
  (package
    (name "paulj-dwmblocks")
    (version "6.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/paul-jewell/paulj-dwmblocks.git"
                         (commit "747067e64e64c2723c5a71f518498c2162195d45"))))
              (sha256
               (base32 "05ixpad1xh3nmcm5vfkv0x04jys56wwqsgiy41pbd6ga5d5jq88y"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f
       #:make-flags
       (list (string-append "CC=" ,(cc-for-target))
             (string-append "PREFIX=" %output))
       #:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda _
             (substitute* "Makefile" (("\\$\\{CC\\}") "gcc"))
             #t))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (invoke "make" "install"
                       (string-append "DESTDIR=" out) "PREFIX=")))))))
    (home-page "https://github.com/paul-jewell/paulj-dwmblocks.git")
    (synopsis "Status bar manager for dwm")
    (description "dwmblocks is a status bar manager for dwm window manager.")
    (license license:isc)))
