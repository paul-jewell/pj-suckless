(define-module (paulj packages paulj-slock)
  #:use-module (gnu packages suckless)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (paulj-packages))

(define-public paulj-slock
  (package
   (inherit slock)
   (name "paulj-slock")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/paul-jewell/paulj-slock.git")
           (commit "35633d45672d14bd798c478c45d1a17064701aa9")))
     (sha256
      (base32 "1zys661530nsmap9invvggbmh6djqfzwiq0wyc9x600zn1yg4h3z"))))
   (home-page "https://github.com/paul-jewell/paulj-slock.git")
   (synopsis "paulj version of slock")))
