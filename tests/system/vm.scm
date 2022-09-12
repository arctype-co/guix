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

(define-module (tests system vm)
  #:use-module (gnu bootloader)
  #:use-module (gnu bootloader grub)
  #:use-module (gnu system)
  #:use-module (gnu system vm)
  #:use-module (guix derivations)
  #:use-module (guix monads)
  #:use-module (guix store)
  #:use-module (guix tests)
  #:use-module ((guix utils) #:select (%current-system %current-target-system))
  #:use-module (ice-9 format)
  #:use-module (srfi srfi-64)
  #:use-module (tests system fixture))

;; These tests build a whole operating system, which can
;; be very slow.
(define %enable-large-tests? #f)

;; Test the (gnu system vm) module.

(test-begin "system vm")

(when %enable-large-tests?
  (test-begin "build a QEMU image with a GPT partition table")

  (let ((vm-image
         (with-external-store %store
           (run-with-store %store
             (mlet* %store-monad
                    ((os -> (operating-system
                              (inherit %os)
                              (bootloader
                                (bootloader-configuration
                                  (inherit (operating-system-bootloader %os))
                                  (bootloader grub-efi-bootloader)))))
                     (vm-drv (system-qemu-image/shared-store-script
                               os
                               #:system "x86_64-linux"
                               #:target #f
                               #:full-boot? #t
                               #:partition-table-type 'gpt
                               #:disk-image-size (* 2 (expt 2 30)) ; 2 GB
                               #:memory-size 1024))
                     (built? -> (build-derivations %store (list vm-drv))))
                    (return (if built?
                                (derivation->output-path vm-drv)
                                #f)))))))

    (test-assert
      "QEMU image generates a viable output"
      (string? vm-image)))

  (test-end))

(test-end)
