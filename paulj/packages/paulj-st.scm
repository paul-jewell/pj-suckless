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
           (branch "paulj")
           (commit "4ef0cbd8b9371f37f7d02ef37b5378b879e6b8bf")))
     (sha256
      (base32 "1x9j2xm28b0hd1d5mmsjh4703wjdyv1hprha453kk5lz0w43057p"))))
   (home-page "https://github.com/paul-jewell/paulj-st.git")
   (synopsis "paulj version of st")))

