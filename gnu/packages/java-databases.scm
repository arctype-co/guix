;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2021 Ryan Sundberg <ryan@arctype.co>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (gnu packages java-databases)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages java)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (ice-9 match))

(define-public java-rocksdb
  (let* ((lib (lambda (name hash)
                (origin (method url-fetch)
                        (uri (string-append "https://rocksdb-deps.s3-us-west-2.amazonaws.com/jars/" name))
                        (sha256 (base32 hash)))))
         (test-libraries
           `(("junit-4.13.1.jar"
              ,(lib "junit-4.13.1.jar" "08k1bzx0yls48294bqdshma00xspi9iv74g17xwm4r2djzdij1y3"))
             ("hamcrest-2.2.jar"
              ,(lib "hamcrest-core-1.3.jar" "1sfqqi8p5957hs9yik44an3lwpv8ln2a6sh9gbgli4vkx68yzzb6"))
             ("mockito-all-1.10.19.jar"
              ,(lib "mockito-all-1.10.19.jar" "0186qzs12ydrhiwrzpasx2pi1dblnf0km9p0qc7mrnxk2kpsg9yi"))
             ("cglib-3.3.0.jar"
              ,(lib "cglib-3.3.0.jar" "04ljkbqb03c1xd5vb2jh5c90df8zps3wd6h1zv6hq534finw5q4z"))
             ("assertj-core-2.9.0.jar"
              ,(lib "assertj-core-2.9.0.jar" "1gxsx0q14s8ij13i37s94a6rrykr9747dv3g6jhqmi73rczfm22y"))))
          (test-library-names (match test-libraries
                                     (((library-name _) ...)
                                      library-name))))
    (package
      (inherit rocksdb)
      (name "java-rocksdb")
      (build-system gnu-build-system)
      (arguments
        (substitute-keyword-arguments (package-arguments rocksdb)
          ;; We must explicitly set DEBUG_LEVEL=0 when not building the shared_lib target
          ((#:make-flags make-flags)
           `(cons* "DEBUG_LEVEL=0" ,make-flags))
          ((#:phases phases)
           `(modify-phases ,phases
              (add-after 'unpack 'unpack-library-sources
                (lambda* (#:key inputs #:allow-other-keys)
                  (define (extract-library name)
                    (let ((input-path (assoc-ref inputs name)))
                      (copy-recursively input-path (string-append "java/test-libs/" name))))
                  (mkdir-p "java/test-libs")
                  (for-each extract-library ',test-library-names)
                  #t))
              (add-before 'build 'set-java-home
                (lambda* (#:key inputs #:allow-other-keys)
                  (setenv "JAVA_HOME" (assoc-ref inputs "jdk"))))
              (replace 'build
                (lambda* (#:key inputs (make-flags '()) parallel-build? #:allow-other-keys)
                    (apply invoke "make" "DEBUG_LEVEL=0" "rocksdbjava"
                           `(,@(if parallel-build?
                                   `("-j" ,(number->string (parallel-job-count)))
                                   '())
                             ,@make-flags))))
              (delete 'configure)
              (replace 'install
                ; TODO: Add support/wildcard for alternate system architectures
                (lambda* (#:key outputs #:allow-other-keys)
                  (let ((output (assoc-ref outputs "out"))
                        (jar-name (string-append "rocksdbjni-" ,(package-version rocksdb) "-linux64.jar")))
                    (mkdir-p (string-append output "/lib"))
                    (copy-file "java/target/librocksdbjni-linux64.so" (string-append output "/lib/librocksdbjni-linux64.so"))
                    (copy-file (string-append "java/target/" jar-name) (string-append output "/" jar-name))
                    (symlink (string-append output "/" jar-name) (string-append output "/rocksdbjni-linux64.jar"))
                    #t)))))
          ((#:test-target test-target) "jtest")))
      (native-inputs
        `(,@test-libraries
          ,@(package-native-inputs rocksdb)
          ("curl" ,curl)))
      (inputs
       `(,@(package-inputs rocksdb)
          ("jdk" ,openjdk11 "jdk")))
      (home-page "https://rocksdb.org/")
      (synopsis "Persistent key-value store for fast storage. This is the JNI library.")
      (description
       "RocksDB is a library that forms the core building block for a fast
  key-value server, especially suited for storing data on flash drives.  It
  has a @dfn{Log-Structured-Merge-Database} (LSM) design with flexible tradeoffs
  between @dfn{Write-Amplification-Factor} (WAF), @dfn{Read-Amplification-Factor}
  (RAF) and @dfn{Space-Amplification-Factor} (SAF).  It has multi-threaded
  compactions, making it specially suitable for storing multiple terabytes of
  data in a single database.  RocksDB is partially based on @code{LevelDB}.")
      ;; RocksDB is dual licensed under GPL2 and ASL 2.0.  Some header
      ;; files carry the 3-clause BSD license.
      (license (list license:gpl2 license:asl2.0 license:bsd-3)))))
