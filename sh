#!/bin/sh
exec guix environment --pure guix --ad-hoc git guile-colorized guile-git guile-readline less strace which -- \
  ./pre-inst-env bash --norc $@
