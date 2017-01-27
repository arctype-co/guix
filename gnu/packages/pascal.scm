;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2017 Kei Kebreau <address@hidden>
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

(define-module (gnu packages pascal)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bootstrap)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages xml)
  #:use-module (ice-9 match))

(define fpc-bootstrap-i386-3.0.4
  (origin
    (method url-fetch)
    (uri
     "mirror://sourceforge/freepascal/Linux/3.0.4/fpc-3.0.4.i386-linux.tar")
    (sha256
     (base32
      "05xfgxa6vb0y2ryfsgn21m2kwaxhci6l2zxa3akvlnqminjsjvda"))))

(define fpc-bootstrap-x86_64-3.0.4
  (origin
    (method url-fetch)
    (uri
     "mirror://sourceforge/freepascal/Linux/3.0.4/fpc-3.0.4.x86_64-linux.tar")
    (sha256
     (base32
      "0xzxh689iyjfmkqkhcqg9plrjmdx82hbyywyyc7jm0n92fpmp5ky"))))

(define-public fpc
  (package
    (name "fpc")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://sourceforge/freepascal/Source/"
                                  version "/fpcbuild-" version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0f38glyn3ffmqww432snhx2b8wyrq0yj1njkp4zh56lqrvm19fgr"))
              (patches (search-patches "fpc-reproducibility.patch"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  (rename-file "install/doc" "install-doc")
                  (rename-file "install/man" "install-man")
                  ;; Contains executables--some of them created by
                  ;; closed-source compilers.
                  (delete-file-recursively "install")
                  (mkdir-p "install")
                  (rename-file "install-doc" "install/doc")
                  (rename-file "install-man" "install/man")
                  (delete-file "fpcsrc/tests/utils/dosbox/exitcode.exe")
                  #t))))
    (build-system gnu-build-system)
    (supported-systems '("i686-linux" "x86_64-linux"))
    (inputs
     `(("expat" ,expat)
       ("glibc" ,glibc)
       ("ld-wrapper" ,ld-wrapper)
       ("ncurses" ,ncurses)
       ("zlib" ,zlib)))
    (native-inputs
     ;; FPC is built with FPC, so we need bootstrap binaries.
     `(("fpc-binary"
        ,(match (or (%current-target-system)
                    (%current-system))
          ("i686-linux" fpc-bootstrap-i386-3.0.4)
          ;("powerpc64le-linux" fpc-bootstrap-ppc64le-3.0.4)
          ;("powerpc-linux" fpc-bootstrap-ppc-3.0.4)
          ("x86_64-linux" fpc-bootstrap-x86_64-3.0.4)
          (_ fpc-bootstrap-x86_64-3.0.4)))))
    (arguments
     `(#:tests? #f ; no tests available
       #:phases
       (let ((fpc-bootstrap-path
              (string-append (getcwd) "/" ,name "-" ,version "/fpc-bin"))
             (arch ,(match (or (%current-target-system)
                               (%current-system))
                     ("i686-linux" "i386")
                     ("x86_64-linux" "x86_64")
                     (_ "unknown"))))
         (modify-phases %standard-phases
           (add-after 'unpack 'unpack-bin
             (lambda* (#:key inputs #:allow-other-keys)
               (mkdir-p fpc-bootstrap-path)
               (with-directory-excursion fpc-bootstrap-path
                 (invoke "tar" "xvf" (assoc-ref inputs "fpc-binary")))))
           (add-after 'unpack-bin 'install-bin
             (lambda* (#:key inputs #:allow-other-keys)
               (with-directory-excursion
                 (string-append fpc-bootstrap-path "/fpc-3.0.4."
                                arch "-linux")
                 (let ((binary-tarball
                        (string-append "binary." arch "-linux.tar"))
                       (compiler-tarball
                        (string-append "base." arch "-linux.tar.gz"))
                       (fpcmake-tarball
                        (string-append "utils-fpcm." arch "-linux.tar.gz")))
                   ;; Only the base compiler and fpcmake are needed.
                   (invoke "tar" "xvf" binary-tarball compiler-tarball
                           fpcmake-tarball)
                   (invoke "tar" "xvf" compiler-tarball "-C..")
                   (invoke "tar" "xvf" fpcmake-tarball "-C..")))))
           (add-after 'patch-source-shebangs 'patch-inline-shebangs
             (lambda _
               (substitute* "fpcsrc/compiler/cscript.pas"
                 (("#!/bin/sh") (string-append "#!" (which "sh"))))
               #t))
           (replace 'configure
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (substitute* "fpcsrc/compiler/systems/t_linux.pas"
                 ;; Point to the current glibc dynamic linker.
                 (("/lib/ld-linux.so.2")
                  (string-append (assoc-ref inputs "libc")
                                 ,(glibc-dynamic-linker)))
                 (("/lib64/ld-linux-x86-64.so.2")
                  (string-append (assoc-ref inputs "libc")
                                 ,(glibc-dynamic-linker)))
                 ; TODO: /lib/ld-linux-armhf.so.3
                 ; TODO: /lib/ld-linux-aarch64.so.1
                 ; TODO: /lib64/ld64.so.2
                 ;; Add glibc to ld's search path.
                 (("if \\(isdll\\) then")
                  (string-append
                   "Add('SEARCH_DIR(\""
                   (assoc-ref inputs "libc") "/lib"
                   "\")');\n"
                   "if (isdll) then")))
               (substitute* "fpcsrc/compiler/options.pas"
                 (("exepath\\+'../etc/'")
                  (string-append "'" (assoc-ref outputs "out") "/etc'")))
               #t))
           (replace 'build
             (lambda* (#:key inputs #:allow-other-keys)
               (let* ((fpc-bin (string-append fpc-bootstrap-path "/bin"))
                      (fpc (string-append fpc-bin "/fpc"))
                      (fpcmake (string-append fpc-bin "/fpcmake")))
                 ;; The fpc binary needs to run the ppc[arch] binary (which
                 ;; does the actual compiling) in this directory.
                 (setenv "PATH"
                        (string-append (getenv "PATH") ":"
                                       fpc-bootstrap-path
                                       "/lib/fpc/3.0.4"))
                 (setenv "FPC" fpc)
                 ;; Specify target operating system using "-T" option
                 (invoke fpcmake (string-append "-T" arch "-linux"))
                 (invoke "make" "build" "NOGDB=1"))))
           (replace 'install
             (lambda* (#:key outputs #:allow-other-keys)
               (let* ((out (assoc-ref outputs "out"))
                     ;; This is the suffix of the ppc[arch] binary.
                     (suffix (if (string= arch "x86_64")
                                 "x64"
                                 "386"))
                     (ppc (string-append "ppc" suffix)))
                 (invoke "make" "install" "NOGDB=1"
                         (string-append "INSTALL_PREFIX=" out))
                 ;; Remove files that fail RUNPATH validation.
                 ;; TODO: Fix it instead.
                 (delete-file (string-append out "/lib/libpas2jslib.so"))
                 ;; Add a symlink to the ppc[arch] binary so fpc works.
                 (symlink (string-append out "/lib/fpc/" ,version "/" ppc)
                          (string-append out "/bin/" ppc))
                 ;; Install the example configuration file.
                 (mkdir (string-append out "/etc"))
                 (invoke
                   (string-append out "/lib/fpc/" ,version "/samplecfg")
                   (string-append out "/lib/fpc/" ,version)
                   (string-append out "/etc")))))
           (add-after 'install 'wrap
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (let* ((out (assoc-ref outputs "out"))
                      (fpc (string-append out "/bin/fpc"))
                      (ld (assoc-ref inputs "ld-wrapper"))
                      (glibc (assoc-ref inputs "glibc")))
                 (wrap-program fpc
                   `("PATH" ":" prefix (,(string-append ld "/bin")))
                   `("LIBRARY_PATH" ":" prefix (,(string-append glibc "/lib"))))
                 #t)))))))
    ;; fpc invokes gcc, so make sure LIBRARY_PATH et.al are set.
    ;(native-search-paths (package-native-search-paths gcc))
    (home-page "http://www.freepascal.org")
    (synopsis "The Free Pascal Compiler")
    (description
     "Free Pascal is a professional Object Pascal compiler.  It supports the
Turbo Pascal 7.0, Delphi, and Mac Pascal dialects.  Free Pascal also supports
many useful extensions to the Pascal programming language.")
    ;; The majority of the software included is licensed under the GPLv2
    ;; or later.  For more licensing details, see the appropriate files in
    ;; the install/doc directory of the source distribution.
    (license license:gpl2+)))
