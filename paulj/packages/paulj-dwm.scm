(define-module (paulj packages paulj-dwm)
  #:use-module (gnu packages suckless)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (paulj packages))

(define-public paulj-dwm
  (package
   (inherit dwm)
   (name "paulj-dwm")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/paul-jewell/paulj-dwm.git")
           (commit "61bb8b2241d4db08bea4261c82e27cd9797099e7")))
     (sha256
      (base32 "1j3vly8dln35vnwnwwlaa8ql9fmnlmrv43jcyc8dbfhfxiw6f34l"))))
   (home-page "https://github.com/paul-jewell/paulj-dwm")
   (synopsis "paulj version of dwm")))
