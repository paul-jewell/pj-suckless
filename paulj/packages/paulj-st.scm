(define-module (paulj packages paulj-st)
  #:use-module (gnu packages suckless)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (paulj packages))

(define-public paulj-st
  (package
   (inherit st)
   (name "paulj-st")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/paul-jewell/paulj-st.git")
           (commit "7e68b121ec178f21d6d05b190ed217dfd04f9ca9")))
     (sha256
      (base32 "1xgiwr894h8mvplyzlb1wlnjrgb4nsrf1w27bliiw4fg2py0ps0d"))))
   (home-page "https://github.com/paul-jewell/paulj-st.git")
   (synopsis "paulj version of st")))

