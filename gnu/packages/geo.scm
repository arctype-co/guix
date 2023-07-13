;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2016 Leo Famulari <leo@famulari.name>
;;; Copyright © 2016 Alex Griffin <a@ajgrf.com>
;;; Copyright © 2017, 2018 Björn Höfling <bjoern.hoefling@bjoernhoefling.de>
;;; Copyright © 2018–2021 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2018, 2023 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2018, 2019 Arun Isaac <arunisaac@systemreboot.net>
;;; Copyright © 2018 Joshua Sierles, Nextjournal <joshua@nextjournal.com>
;;; Copyright © 2018, 2019, 2020, 2021 Julien Lepiller <julien@lepiller.eu>
;;; Copyright © 2019-2023 Guillaume Le Vaillant <glv@posteo.net>
;;; Copyright © 2019-2023 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2019, 2021 Wiktor Żelazny <wzelazny@vurv.cz>
;;; Copyright © 2019, 2020 Hartmut Goebel <h.goebel@crazy-compilers.com>
;;; Copyright © 2020, 2022 Marius Bakke <marius@gnu.org>
;;; Copyright © 2020 Christopher Baines <mail@cbaines.net>
;;; Copyright © 2020, 2021, 2022, 2023 Felix Gruber <felgru@posteo.net>
;;; Copyright © 2021, 2023 Sharlatan Hellseher <sharlatanus@gmail.com>
;;; Copyright © 2021, 2023 Vinicius Monego <monego@posteo.net>
;;; Copyright © 2021 Clément Lassieur <clement@lassieur.org>
;;; Copyright © 2021, 2022 Nikolay Korotkiy <sikmir@disroot.org>
;;; Copyright © 2022 Roman Scherer <roman.scherer@burningswell.com>
;;; Copyright © 2022, 2023 Maxim Cournoyer <maxim.cournoyer@gmail.com>
;;; Copyright © 2022 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
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

(define-module (gnu packages geo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system ant)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system qt)
  #:use-module (guix build-system r)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix svn-download)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages astronomy)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages build-tools)
  #:use-module (gnu packages c)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages cran)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages datastructures)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gps)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-processing)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages java)
  #:use-module (gnu packages kde)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages time)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages wxwidgets)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg))

(define-public gmt
  (package
    (name "gmt")
    (version "6.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/GenericMappingTools/gmt/"
                           "releases/download/"
                           version "/gmt-" version "-src.tar.xz"))
       (sha256
        (base32 "0wh694cwcw2dz5rsh6pdn9irx08d65iih0vbxz350vzrkkjzyvml"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #false)) ;tests need costline data and caches
    (inputs
     (list curl ffmpeg fftw gdal geos ghostscript netcdf openblas pcre2))
    (native-inputs
     (list graphicsmagick pkg-config))
    (home-page "https://www.generic-mapping-tools.org/")
    (synopsis "Generic mapping tools")
    (description "GMT is a collection of about 100 command-line tools for
manipulating geographic and Cartesian data sets (including filtering, trend
fitting, gridding, projecting, etc.) and producing high-quality illustrations
ranging from simple x-y plots via contour maps to artificially illuminated
surfaces, 3D perspective views and animations.  The GMT supplements add
another 50 more specialized and discipline-specific tools.  GMT supports over
30 map projections and transformations and requires support data such as GSHHG
coastlines, rivers, and political boundaries and optionally DCW country
polygons.")
    (license license:lgpl3+)))

(define-public libaec
  (package
    (name "libaec")
    (version "1.0.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.dkrz.de/k202009/libaec")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14myrmmiz9z6wgxqywf3a63cq514vrzsd6z4zvpwigvawlk30iip"))))
    (build-system cmake-build-system)
    (home-page "https://gitlab.dkrz.de/k202009/libaec")
    (synopsis "Adaptive Entropy Coding library")
    (description "Libaec provides fast lossless compression of 1 up to 32 bit
wide signed or unsigned integers (samples).  The library achieves best results
for low entropy data as often encountered in space imaging instrument data or
numerical model output from weather or climate simulations.  While floating
point representations are not directly supported, they can also be efficiently
coded by grouping exponents and mantissa.")
    (license license:bsd-2)))

(define-public eccodes
  (package
    (name "eccodes")
    (version "2.27.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://confluence.ecmwf.int/download/attachments/45757960/"
             "eccodes-" version "-Source.tar.gz"))
       (sha256
        (base32 "16cw4v2d0kjq6gq04paqny0sh5jymn70w449mig7m5h3spzv7rgd"))))
    (build-system cmake-build-system)
    (arguments
     `(#:configure-flags '("-DENABLE_MEMFS=ON" "-DENABLE_PNG=ON")
       #:validate-runpath? #f))
    (inputs
     (list jasper libaec libjpeg-turbo libpng netcdf openjpeg))
    (native-inputs
     (list gfortran perl pkg-config python))
    (home-page "https://confluence.ecmwf.int/display/ECC")
    (synopsis "Library for handling the GRIB, BUFR and GTS file formats")
    (description "ecCodes is a package developed by @acronym{ECMWF, European
Centre for Medium-Range Weather Forecasts} which provides an application
programming interface and a set of tools for decoding and encoding messages in
the @acronym{WMO, World Meteorological Organization} FM-92 GRIB, WMO FM-94
BUFR and WMO GTS abbreviated header formats.")
    (license license:asl2.0)))

(define-public cdo
  (package
    (name "cdo")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://code.mpimet.mpg.de/attachments/download/27481/cdo-"
             version ".tar.gz"))
       (sha256
        (base32 "1k18llghpf3jnjn0xcnhmbg7arb1fiy854qqn9m5c1abjin38wdq"))))
    (build-system gnu-build-system)
    (arguments
     (list #:configure-flags
           #~(list (string-append "--with-curl="
                                  #$(this-package-input "curl"))
                   (string-append "--with-eccodes="
                                  #$(this-package-input "eccodes"))
                   (string-append "--with-fftw3="
                                  #$(this-package-input "fftw"))
                   (string-append "--with-hdf5="
                                  #$(this-package-input "hdf5"))
                   (string-append "--with-netcdf="
                                  #$(this-package-input "netcdf"))
                   (string-append "--with-proj="
                                  #$(this-package-input "proj"))
                   (string-append "--with-udunits2="
                                  #$(this-package-input "udunits"))
                   (string-append "--with-libxml2="
                                  #$(this-package-input "libxml2")))
           ;; Some tests can fail on machines with many threads.
           #:parallel-tests? #f))
    (inputs
     (list curl eccodes fftw hdf5 libxml2 netcdf proj udunits))
    (native-inputs
     (list pkg-config))
    (home-page "https://code.mpimet.mpg.de/projects/cdo")
    (synopsis "Climate data operators")
    (description "@acronym{CDO, Climate Data Operators} is a collection of command-line
operators to manipulate and analyse climate and NWP model data.  Supported
data formats are GRIB 1/2, netCDF 3/4, SERVICE, EXTRA and IEG.  There are more
than 600 operators available.")
    (license license:bsd-3)))

(define-public h3
  (package
    (name "h3")
    (version "4.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/uber/h3")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0x764xzna8ka6yhgv2y4hb158a61y3g9a6835qckqp7wfkpqvb7f"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags #~(list "-DBUILD_SHARED_LIBS=ON")))
    (home-page "https://h3geo.org/")
    (synopsis "Hexagonal hierarchical geospatial indexing system")
    (description "H3 is a geospatial indexing system using a hexagonal grid
that can be (approximately) subdivided into finer and finer hexagonal grids,
combining the benefits of a hexagonal grid with S2's hierarchical
subdivisions.")
    (license license:asl2.0)))

;; For python-timezonefinder, remove it when it starts supporting newer
;; version.
(define-public h3-3
  (package
    (inherit h3)
    (name "h3")
    (version "3.7.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/uber/h3")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0bvsljfxmjvl23v9gxykc4aynjzh5xfy3wg02bxad7cknr1amx9j"))))))

(define-public python-h3
  (package
    (name "python-h3")
    (version "4.0.0b2")
    (source
     (origin
       (method git-fetch) ; no tests data in PyPi package
       (uri (git-reference
             (url "https://github.com/uber/h3-py")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1k1n256hhlh05gjcj64pqh08zlaz6962jkb6nk1aazsgg8p41zs0"))
       (modules '((guix build utils)))
       ;; Remove bundeled H3 lib.
       (snippet #~(begin (delete-file-recursively "src/h3lib")))))
    (build-system pyproject-build-system)
    (arguments
     (list
      ;; FIXME: Check why these tests are failing.
      ;; test_versions - assert (4, 1) == (4, 0)
      ;; test_resolution - h3._cy.error_system.H3Failed
      #:test-flags #~(list "-k" (string-append
                                 "not test_versions"
                                 " and not test_resolution"))
      #:phases
      #~(modify-phases %standard-phases
          ;; Use packaged in Guix h3 source.
          (add-after 'unpack 'patch-cmakelists
            (lambda _
              (substitute* "CMakeLists.txt"
                (("add_subdirectory\\(src/h3lib\\)")
                 (string-append
                  "include_directories(" #$(this-package-input "h3")
                  "/include/h3)\n"
                  "link_directories(" #$(this-package-input "h3")
                  "/lib)\n"))
                ((".*CMAKE_CURRENT_BINARY_DIR.*")
                 (string-append #$(this-package-input "h3")
                                "/include/h3/h3api.h\n"))))))))
    (native-inputs
     (list cmake-minimal
           python-cython
           python-numpy
           python-pytest
           python-scikit-build
           python-setuptools-scm))
    (inputs (list h3))
    (home-page "https://uber.github.io/h3-py")
    (synopsis "Python bindings for H3")
    (description "This package provides a Python bindings for H3, a
hierarchical hexagonal geospatial indexing system")
    (license license:asl2.0)))

;; For python-timezonefinder, remove it when it starts supporting newer
;; version.
(define-public python-h3-3
  (package
    (inherit python-h3)
    (name "python-h3")
    (version "3.7.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/uber/h3-py")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16gxa1sivghxw179rik87r918mjasars2qkzidlwq83qfa4axn20"))))
    (inputs
     (modify-inputs (package-inputs python-h3)
       (replace "h3" h3-3)))))

(define-public memphis
  (package
    (name "memphis")
    (version "0.2.3")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/jiuka/memphis")
         (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "068c3943pgbpfjq44pmvn5fmkh005ak5aa67vvrq3fn487c6w54q"))))
    (build-system glib-or-gtk-build-system)
    (outputs '("out" "doc"))
    (arguments
     `(#:configure-flags
       (list "--disable-static"
             "--enable-gtk-doc"
             "--enable-vala"
             (string-append "--with-html-dir=" #$output "/share/gtk-doc/html"))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-autogen
           (lambda _
             (substitute* "autogen.sh"
               (("\\./configure \"\\$@\"")
                "")))))))
    (native-inputs
     (list autoconf
           automake
           docbook-xml-4.3
           gobject-introspection
           gtk-doc/stable
           libtool
           libxml2                      ;for XML_CATALOG_FILES
           pkg-config
           python-wrapper
           seed
           vala))
    (inputs (list expat glib))
    (propagated-inputs (list cairo))
    (synopsis "Map-rendering for OpenSteetMap")
    (description "Memphis is a map-rendering application and a library for
OpenStreetMap written in C using eXpat, Cairo and GLib.")
    (home-page "http://trac.openstreetmap.ch/trac/memphis/")
    (license license:lgpl2.1+)))

(define-public geos
  (package
    (name "geos")
    (version "3.11.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://download.osgeo.org/geos/geos-"
                                  version
                                  ".tar.bz2"))
              (sha256
               (base32
                "1k744nwfa5sj4amzsdjxgac83wh6xfb9xi7z5bka7ic1jik7gw5i"))))
    (build-system cmake-build-system)
    (arguments `(#:phases
                 (modify-phases %standard-phases
                   (add-after
                    'unpack 'patch-test-shebangs
                    (lambda _
                      (substitute* '("tests/xmltester/testrunner.sh"
                                     "tests/geostest/testrunner.sh")
                        (("/bin/sh") (which "sh"))))))))
    (inputs
     (list glib))
    (home-page "https://libgeos.org/")
    (synopsis "Geometry Engine for Geographic Information Systems")
    (description
     "GEOS provides a spatial object model and fundamental geometric
functions.  It is a C++ port of the Java Topology Suite (JTS).  As such,
it aims to contain the complete functionality of JTS in C++.  This
includes all the OpenGIS Simple Features for SQL spatial predicate
functions and spatial operators, as well as specific JTS enhanced
topology functions.")
    (license (list license:lgpl2.1+          ; Main distribution.
                   license:zlib              ; tests/xmltester/tinyxml/*
                   license:public-domain)))) ; include/geos/timeval.h

(define-public gnome-maps
  (package
    (name "gnome-maps")
    (version "43.0")                    ;for libsoup 3 support
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://gnome/sources/" name "/"
                                  (version-major version) "/"
                                  name "-" version ".tar.xz"))
              (sha256
               (base32
                "1r1l6ajs6zz316m8zac5r0l3qgdv616xh376bfn2fflcnz7wys08"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:glib-or-gtk? #t
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'skip-cache-and-database-updates
            (lambda _
              (substitute* "meson.build"
                (("([a-z_]*): true" all option)
                 (cond                ; cond rather than match saves an import
                  ((member option '("gtk_update_icon_cache"
                                    "update_desktop_database"))
                   (string-append option ": false"))
                  (else all))))))
          (add-after 'install 'wrap
            (lambda _
              (let ((gi-typelib-path (getenv "GI_TYPELIB_PATH")))
                (substitute* (string-append #$output "/share/gnome-maps/"
                                            "org.gnome.Maps")
                  (("imports\\.package\\.init" all)
                   (string-append "'" gi-typelib-path "'.split(':').forEach("
                                  "path => imports.gi.GIRepository.Repository."
                                  "prepend_search_path(path));\n"
                                  all)))))))))
    (native-inputs
     (list gettext-minimal
           `(,glib "bin")
           gobject-introspection
           pkg-config))
    (inputs
     (list folks
           evolution-data-server
           geoclue
           geocode-glib
           gfbgraph
           gjs
           glib
           glib-networking
           gnome-online-accounts
           gsettings-desktop-schemas
           gtk+
           libadwaita
           libgee
           libgweather4
           libhandy
           librsvg
           libsecret
           libshumate
           libsoup
           libxml2
           rest-next
           webkitgtk))
    (synopsis "Graphical map viewer and wayfinding program")
    (description "GNOME Maps is a graphical map viewer.  It uses map data from
the OpenStreetMap project.  It can provide directions for walking, bicycling,
and driving.")
    (home-page "https://wiki.gnome.org/Apps/Maps")
    (license license:gpl2+)))

(define-public libgeotiff
  (package
    (name "libgeotiff")
    (version "1.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://download.osgeo.org/geotiff/libgeotiff/libgeotiff-"
                           version ".tar.gz"))
       (patches (search-patches "libgeotiff-fix-tests-with-proj-9.1.1.patch"))
       (sha256
        (base32 "1mjmgv48x51ppax5dnb6lq7z600czxll53bx6jbzqwd4m93i7aq5"))
       (modules '((guix build utils)))
       (snippet
        '(begin
           ;; Remove .csv files, distributed from EPSG under a restricted
           ;; license. See LICENSE for full license text.
           (for-each delete-file (find-files "." "\\.csv$"))
           #t))))
    (build-system gnu-build-system)
    (inputs
     (list libjpeg-turbo libtiff zlib))
    (propagated-inputs
     (list ;; libgeotiff headers include proj headers, so ensure those are available.
           proj))
    (arguments
     `(#:configure-flags
       (list "--disable-static"
             "--with-zlib" "--with-jpeg"
             (string-append "--with-libtiff=" (assoc-ref %build-inputs "libtiff")))))
    (synopsis "Library for handling GeoTIFF (geographic enabled TIFF)")
    (description "libgeotiff is a library on top of libtiff for reading and
writing GeoTIFF information tags.")
    (home-page "https://trac.osgeo.org/geotiff/")
    ;; This is a mixture of various contributions under different licenses.
    ;; Note that the EPSG database is NOT "free to use" as the LICENSE file
    ;; states, as its commercial redistribution is restricted. Hence, we have
    ;; removed it from the package.
    (license (list license:public-domain
                   license:x11
                   license:bsd-3
                   (license:non-copyleft "file://LICENSE"
                                         "See LICENSE in the distribution.")))))

(define-public librasterlite2
  (package
    (name "librasterlite2")
    (version "1.1.0-beta1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.gaia-gis.it/gaia-sins/librasterlite2-sources/"
             "librasterlite2-" version ".tar.gz"))
       (sha256
        (base32
         "1x24gqp4hsq97c31ncwxblab0x0863q8v1z42jil7lvsq3glqa7p"))))
    (build-system gnu-build-system)
    (native-inputs
     (list pkg-config))
    (inputs
     (list cairo
           curl
           freetype
           freexl
           giflib
           libgeotiff
           libjpeg-turbo
           libpng
           librttopo
           libspatialite
           libtiff
           libwebp
           libxml2
           lz4
           minizip
           openjpeg
           proj
           sqlite
           `(,zstd "lib")))
    (synopsis "Library to work with huge raster coverages using a SpatiaLite")
    (description
     "librasterlite2 is a library that stores and retrieves huge raster
coverages using a SpatiaLite DBMS.")
    (home-page "https://www.gaia-gis.it/fossil/librasterlite2/index")
    ;; For the genuine librasterlite-sources holds:
    ;; Any of the licenses MPL1.1, GPL2+ or LGPL2.1+  may be picked.
    ;; Files under src/control_points are from GRASS
    ;; and are licensed under GPL2+ only.
    ;; src/md5.[ch]: Placed into the public domain by Alexander Peslyak.
    ;; The tools supporting the library (both rl2tool and wmslite) are
    ;; licensed under the GPL v3 (or any subsequent version) terms.
    ;; The test/*.svg files are placed in the public domain, except for
    ;; test/Car_Yellow.svg which is licensed under the Free Art License 1.3.
    (license (list license:gpl2+
                   license:gpl3+
                   license:lal1.3
                   license:lgpl2.1+
                   license:mpl1.1
                   license:public-domain))))

(define-public librttopo
  (package
    (name "librttopo")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://git.osgeo.org/gitea/rttopo/librttopo")
             (commit (string-append "librttopo-" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0h7lzlkn9g4xky6h81ndy0aa6dxz8wb6rnl8v3987jy1i6pr072p"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-autogen
           (lambda _
             (let ((autoconf (which "autoconf"))
                   (autoheader (which "autoheader"))
                   (aclocal (which "aclocal"))
                   (automake (which "automake"))
                   (libtoolize (which "libtoolize")))
               (substitute* "autogen.sh"
                            (("`which autoconf 2>/dev/null`") autoconf)
                            (("`which autoheader 2>/dev/null`") autoheader)
                            (("ACLOCAL=.*$")
                             (string-append "ACLOCAL=" aclocal "\n"))
                            (("AUTOMAKE=.*$")
                             (string-append "AUTOMAKE=" automake "\n"))
                            (("LIBTOOLIZE=.*$")
                             (string-append "LIBTOOLIZE=" libtoolize "\n"))))
             #t)))))
    (native-inputs
     (list autoconf automake libtool pkg-config))
    (inputs
     (list geos))
    (synopsis "Library to handle SQL/MM topologies")
    (description
     "The RT Topology Library exposes an API to create and manage standard
(ISO 13249 aka SQL/MM) topologies using user-provided data stores.")
    (home-page "https://git.osgeo.org/gitea/rttopo/librttopo")
    (license license:gpl2+)))

(define-public libspatialite
  (package
    (name "libspatialite")
    (version "5.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.gaia-gis.it/gaia-sins/libspatialite-"
                           version ".tar.gz"))
       (sha256
        (base32
         "164y82rw2lrp5glfc0rkn7n6xvx5dvlgmh7bb7815067251wkjzf"))))
    (build-system gnu-build-system)
    (native-inputs
     (list pkg-config))
    (inputs
     (list freexl
           geos
           librttopo
           libxml2
           minizip
           proj
           sqlite))
    (arguments
     `(#:configure-flags
       '("--enable-rttopo=yes")
       ;; FIXME: Several tests fail with Proj 9.
       #:tests? #f
       #:phases
       (modify-phases %standard-phases
         ;; 1 test is failing, ignore it:
         (add-after 'unpack 'ignore-broken-tests
           (lambda _
             (substitute* '("test/Makefile.in")
               (("check_wms\\$\\(EXEEXT\\) check_drop_rename\\$\\(EXEEXT\\) ")
                "check_wms$(EXEEXT) ")))))))
    (synopsis "Extend SQLite to support Spatial SQL capabilities")
    (description
     "SpatiaLite is a library intended to extend the SQLite core to support
fully fledged Spatial SQL capabilities.")
    (home-page "https://www.gaia-gis.it/fossil/libspatialite/index")
    ;; For the genuine libspatialite-sources holds:
    ;; Any of the licenses MPL1.1, GPL2+ or LGPL2.1+  may be picked.
    ;; Files under src/control_points are from GRASS
    ;; and are licensed under GPL2+ only.
    ;; src/md5.[ch]: Placed into the public domain by Alexander Peslyak.
    (license (list license:gpl2+
                   license:lgpl2.1+
                   license:mpl1.1
                   license:public-domain))))

(define-public proj
  (package
    (name "proj")
    (version "9.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://download.osgeo.org/proj/proj-"
                           version ".tar.gz"))
       (sha256
        (base32
         "03nm1sgvh237my7ss6kayn6887cbnayvjxrrxsrfcakkmbsida6y"))))
    (build-system cmake-build-system)
    (native-inputs (list googletest pkg-config))
    (propagated-inputs (list curl libtiff sqlite)) ;required by proj.pc
    (home-page "https://proj.org/")
    (synopsis "Coordinate transformation software")
    (description
     "Proj is a generic coordinate transformation software that transforms
geospatial coordinates from one @acronym{CRS, coordinate reference system}
to another.  This includes cartographic projections as well as geodetic
transformations.  Proj includes command line applications for easy
conversion of coordinates from text files or directly from user input.
In addition, Proj also exposes an application programming interface that
lets developers use the functionality of Proj in their own software.")
    (license (list license:expat
                   ;; src/projections/patterson.cpp
                   license:asl2.0
                   ;; src/geodesic.*, src/tests/geodtest.cpp
                   license:x11))))

; This is the last version of proj that provides the old proj.4 API.
(define-public proj-7
  (package (inherit proj)
    (version "7.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://download.osgeo.org/proj/proj-"
                           version ".tar.gz"))
       (sha256
        (base32
         "050apzdn0isxpsblys1shrl9ccli5vd32kgswlgx1imrbwpg915k"))
       (patches
        (search-patches "proj-7-initialize-memory.patch"))))
    (arguments
     `(#:configure-flags '("-DUSE_EXTERNAL_GTEST=ON")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-version
           (lambda _
             (substitute* "CMakeLists.txt"
               (("MAJOR 7 MINOR 2 PATCH 0") "MAJOR 7 MINOR 2 PATCH 1")))))))))

(define-public proj.4
  (package
    (name "proj.4")
    (version "4.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://download.osgeo.org/proj/proj-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "1xw5f427xk9p2nbsj04j6m5zyjlyd66sbvl2bkg8hd1kx8pm9139"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-test-paths
           (lambda _
             (substitute* '("nad/test27"
                            "nad/test83"
                            "nad/testvarious"
                            "nad/testdatumfile"
                            "nad/testflaky"
                            "nad/testIGNF")
               (("/bin/rm") (which "rm")))
             #t))
         ;; Precision problems on i686 and other platforms. See:
         ;; https://web.archive.org/web/20151006134301/http://trac.osgeo.org/proj/ticket/255
         ;; Disable failing test.
         (add-after 'patch-test-paths 'ignore-failing-tests
           (lambda _
             (substitute* '("nad/Makefile.in")
               (("\tPROJ_LIB.*" all) (string-append  "#" all)))
             #t)))))
    (inputs
     (list glib))
    (home-page "https://proj.org/")
    (synopsis "Cartographic Projections Library")
    (description
     "Proj.4 is a library for converting coordinates between cartographic
projections.")
    (license (list license:expat
                   ;; src/PJ_patterson.c
                   license:asl2.0
                   ;; src/geodesic.c/h
                   license:x11
                   ;; Embedded EPSG database.
                   (license:non-copyleft "http://www.epsg.org/TermsOfUse")
                   ;; cmake/*
                   license:boost1.0))))

(define-public python-pyproj
  (package
    (name "python-pyproj")
    (version "3.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "pyproj" version))
        (sha256
          (base32
            "1xhvr0n5gb7v6x0wd7cqmc0zrky2fag7bq2shx6l2qqq3icx2ncq"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-proj-path
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((proj (assoc-ref inputs "proj")))
               (setenv "PROJ_DIR" proj)
               (substitute* "pyproj/datadir.py"
                 (("(internal_datadir = ).*$" all var)
                  (string-append var "Path(\"" proj "/share/proj\")\n")))))))))
    (inputs
      (list proj))
    (propagated-inputs
      (list python-certifi))
    (native-inputs
      (list python-cython python-numpy python-pandas python-pytest
            python-xarray))
    (home-page "https://github.com/pyproj4/pyproj")
    (synopsis
      "Python interface to PROJ")
    (description
      "This package provides a Python interface to PROJ, a cartographic
projections and coordinate transformations library.")
    (license license:expat)))

(define-public python-fiona
  (package
    (name "python-fiona")
    (version "1.9.4.post1")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "Fiona" version))
        (sha256
          (base32
            "083120rqc4rrqzgmams0yjd8b1h4p5xm4n9fnxg064ymw3vx6yan"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'check 'remove-local-fiona
           (lambda _
             ; This would otherwise interfere with finding the installed
             ; fiona when running tests.
             (delete-file-recursively "fiona")))
         (replace 'check
           (lambda* (#:key tests? inputs outputs #:allow-other-keys)
             (add-installed-pythonpath inputs outputs)
             (setenv "GDAL_ENABLE_DEPRECATED_DRIVER_GTM" "YES")
             (when tests?
               (invoke "pytest"
                       "-m" "not network and not wheel"
                       ;; FIXME: Find why the
                       ;;   test_no_append_driver_cannot_append[PCIDSK]
                       ;; test is failing.
                       "-k" "not test_no_append_driver_cannot_append")))))))
    (inputs
      (list gdal))
    (propagated-inputs
      (list python-attrs
            python-certifi
            python-click
            python-click-plugins
            python-cligj
            python-importlib-metadata
            python-six))
    (native-inputs
      (list gdal ; for gdal-config
            python-boto3
            python-cython
            python-pytest python-pytest-cov python-pytz))
    (home-page "https://github.com/Toblerity/Fiona")
    (synopsis
      "Fiona reads and writes spatial data files")
    (description
      "Fiona is GDAL’s neat and nimble vector API for Python programmers.
Fiona is designed to be simple and dependable.  It focuses on reading
and writing data in standard Python IO style and relies upon familiar
Python types and protocols such as files, dictionaries, mappings, and
iterators instead of classes specific to OGR.  Fiona can read and write
real-world data using multi-layered GIS formats and zipped virtual file
systems and integrates readily with other Python GIS packages such as
pyproj, Rtree, and Shapely.")
    (license license:bsd-3)))

(define-public python-geopandas
  (package
    (name "python-geopandas")
    (version "0.13.2")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "geopandas" version))
        (sha256
          (base32
            "0s59jjk02l1zajz95n1c7fr3fyj44wzxn569q2y7f34042f6vdg5"))))
    (build-system pyproject-build-system)
    (arguments
     (list
       #:test-flags
       '(list
         ;; Test files are missing
         "--ignore=geopandas/tests/test_overlay.py"
         "--ignore=geopandas/io/tests/test_file.py"
         ;; Disable tests that require internet access.
         "-m" "not web")))
    (propagated-inputs
      (list python-fiona python-packaging python-pandas python-pyproj
            python-shapely))
    (native-inputs
      (list python-pytest))
    (home-page "https://geopandas.org")
    (synopsis "Geographic pandas extensions")
    (description "The goal of GeoPandas is to make working with
geospatial data in Python easier.  It combines the capabilities of
Pandas and Shapely, providing geospatial operations in Pandas and a
high-level interface to multiple geometries to Shapely.  GeoPandas
enables you to easily do operations in Python that would otherwise
require a spatial database such as PostGIS.")
    (license license:bsd-3)))

(define-public python-osmnx
  (package
    (name "python-osmnx")
    (version "1.1.2")
    (source
     (origin
       ; Fetch from github as the pypi package is missing the tests dir.
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gboeing/osmnx")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1n8qjn184p5a2s3j6x6iyc1i7p3l3xnbqqxm6ajwgwv6j5fw1d5a"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:test-flags
      '(list "-k"
             (string-append
               ;; The following tests require network access.
               "not test_geocode_to_gdf"
               " and not test_stats"
               " and not test_osm_xml"
               " and not test_elevation"
               " and not test_routing"
               " and not test_plots"
               " and not test_find_nearest"
               " and not test_api_endpoints"
               " and not test_graph_save_load"
               " and not test_graph_from_functions"
               " and not test_geometries"))))
    (propagated-inputs
      (list python-folium
            python-geopandas
            python-matplotlib
            python-networkx
            python-numpy
            python-pandas
            python-pyproj
            python-requests
            python-rtree
            python-shapely))
    (native-inputs
      (list python-numpy python-pytest))
    (home-page "https://github.com/gboeing/osmnx")
    (synopsis
      "Retrieve, model, analyze, and visualize OpenStreetMap street networks")
    (description
      "OSMnx is a Python library that lets you download geospatial data
from OpenStreetMap and model, project, visualize, and analyze real-world
street networks and any other geospatial geometries.  You can download
and model walkable, drivable, or bikeable urban networks with a single
line of Python code then easily analyze and visualize them.  You can
just as easily download and work with other infrastructure types,
amenities/points of interest, building footprints, elevation data,
street bearings/orientations, and speed/travel time.")
    (license license:expat)))

(define-public mapnik
  ;; There hasn't been a release since early 2021, and it fails to build with
  ;; Boost 1.77+.
  (let ((commit "81103491b467e17218140f50bc0bb9dc8c1f0317")
        (revision "0"))
    (package
      (name "mapnik")
      (version (git-version "3.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mapnik/mapnik")
               (commit commit)
               ;; TODO: Un-bundle mapbox dependencies (not yet packaged).
               (recursive? #t)))        ;for mapbox dependencies and test data
         (file-name (git-file-name name version))
         (sha256
          (base32 "094nam57bdd5nak88qy33z2p3kjahk3vk2nk56m5jkcr5d3hlnx2"))))
      (build-system qt-build-system)
      (arguments
       (list
        #:cmake cmake                   ;for FIND_PACKAGE_ARGS
        #:configure-flags
        #~(list (string-append "-DCMAKE_CXX_FLAGS=-I"
                               #$(this-package-native-input "catch2")
                               "/include/catch2"))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'use-system-catch2
              (lambda _
                (substitute* "test/CMakeLists.txt"
                  (("GIT_TAG.*v2.13.7" all)
                   (string-append all "\n"
                                  "  FIND_PACKAGE_ARGS NAMES Catch2"))
                  (("^include.*Catch2_SOURCE_DIR.*contrib/Catch.cmake.*")
                   "include(Catch)\n"))))
            (add-after 'unpack 'disable-problematic-tests
              (lambda _
                ;; The 'ogr' test fails for unknown reasons.  Mark it as
                ;; expected to fail (see:
                ;; https://github.com/mapnik/mapnik/issues/4329).
                (substitute* "test/unit/datasource/ogr.cpp"
                  (("TEST_CASE\\(\"ogr\"" all)
                   (string-append all ", \"[!shouldfail]\""))))))))
      (native-inputs
       (list catch2
             pkg-config
             postgresql))
      (inputs
       (list boost
             cairo
             freetype
             gdal
             harfbuzz
             icu4c
             libjpeg-turbo
             libpng
             libtiff
             libwebp
             libxml2
             proj
             sqlite
             zlib))
      (home-page "https://mapnik.org/")
      (synopsis "Toolkit for developing mapping applications")
      (description "Mapnik is a toolkit for developing mapping applications.  It
is basically a collection of geographic objects like maps, layers,
datasources, features, and geometries.  At its core is a C++ shared library
providing algorithms and patterns for spatial data access and visualization.
The library does not rely on any specific windowing system and can be deployed
to any server environment.  It is intended to play fair in a multi-threaded
environment and is aimed primarily, but not exclusively, at web-based
development.")
      (license (list license:lgpl2.1+
                     ;; demo/viewer, demo/python/rundemo.py
                     license:gpl2+
                     ;; deps/boost, deps/mapbox, deps/agg/include/agg_conv_offset.h
                     license:boost1.0
                     ;; deps/mapnik/sparsehash
                     license:bsd-3
                     ;; deps/agg
                     (license:non-copyleft "file://deps/agg/copying"))))))

(define-public spatialite-gui
  (package
    (name "spatialite-gui")
    (version "2.1.0-beta1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.gaia-gis.it/gaia-sins/spatialite-gui-sources/"
             "spatialite_gui-" version ".tar.gz"))
       (sha256
        (base32 "0cyv4cycl073p9lnnnglcb72qn71g8h9g5zn4gzw7swcy5nxjj5s"))))
    (build-system gnu-build-system)
    (native-inputs
     (list pkg-config))
    (inputs
     (list curl
           freexl
           geos
           giflib
           libjpeg-turbo
           librasterlite2
           librttopo
           libspatialite
           libwebp
           libxlsxwriter
           libxml2
           lz4
           minizip
           openjpeg
           postgresql
           proj
           sqlite
           virtualpg
           wxwidgets
           `(,zstd "lib")))
    (arguments
     `(#:phases (modify-phases %standard-phases
                  (add-after 'unpack 'fix-gui
                    (lambda _
                      ;; Fix for the GUI not showing up.
                      (substitute* "Main.cpp"
                        (("Hide\\(\\);") ""))
                      #t)))))
    (synopsis "Graphical user interface for SpatiaLite")
    (description "Spatialite-gui provides a visual interface for viewing and
 maintaining a spatialite database.  You can easily see the structure of the
 tables and data contents using point and click functions, many of which
 construct common SQL queries, or craft your own SQL queries.")
    (home-page "https://www.gaia-gis.it/fossil/spatialite_gui/index")
    (license license:gpl3+)))

(define-public gdal
  (package
    (name "gdal")
    (version "3.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                     "http://download.osgeo.org/gdal/" version "/gdal-"
                     version ".tar.gz"))
              (sha256
               (base32
                "1qckwnygszxkkq40bf87s3m1sab6jj9jyakdvskh0qf7dq8zjarf"))
              (modules '((guix build utils)))
              (snippet
                `(begin
                   ;; TODO: frmts contains a lot more bundled code.
                   (for-each delete-file-recursively
                     ;; bundled code
                     '("frmts/png/libpng"
                       "frmts/gif/giflib"
                       "frmts/jpeg/libjpeg"
                       "frmts/jpeg/libjpeg12"
                       "frmts/gtiff/libtiff"
                       "frmts/gtiff/libgeotiff"
                       "frmts/zlib"
                       "ogr/ogrsf_frmts/geojson/libjson"))))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f
       #:configure-flags
       (list "-DGDAL_USE_INTERNAL_LIBS=WHEN_NO_EXTERNAL"
             "-DGDAL_USE_JPEG12_INTERNAL=OFF")))
    (inputs
     (list curl
           expat
           freexl
           geos
           giflib
           json-c
           libgeotiff
           libjpeg-turbo
           libjxl
           libpng
           libtiff
           libwebp
           lz4
           netcdf
           openssl
           openjpeg
           pcre2
           postgresql ; libpq
           proj
           qhull
           sqlite
           swig
           zlib
           zstd))
    (native-inputs
     (list pkg-config
           python))
    (propagated-inputs
     (list python-numpy))
    (home-page "https://gdal.org/")
    (synopsis "Raster and vector geospatial data format library")
    (description "GDAL is a translator library for raster and vector geospatial
data formats.  As a library, it presents a single raster abstract data model
and single vector abstract data model to the calling application for all
supported formats.  It also comes with a variety of useful command line
utilities for data translation and processing.")
    (license (list
               ;; general license
               license:expat
               ;; frmts/gtiff/tif_float.c, frmts/pcraster/libcsf,
               ;; ogr/ogrsf_frmts/dxf/intronurbs.cpp, frmts/pdf/pdfdataset.cpp
               ;; frmts/mrf/
               license:bsd-3
               ;; frmts/hdf4/hdf-eos/*
               ;; similar to the expat license, but without guarantee exclusion
               (license:non-copyleft "file://frmts/hdf4/hdf-eos/README")
               ;; frmts/grib/degrib/
               license:public-domain ; with guarantee exclusion
               ;; port/cpl_minizip*
               ;; Some bsd-inspired license
               (license:non-copyleft "file://port/LICENCE_minizip")
               ;; alg/internal_libqhull
               ;; Some 5-clause license
               (license:non-copyleft "file://alg/internal_libqhull/COPYING.txt")
               ;; frmts/mrf/libLERC
               license:asl2.0))))

(define-public python-pyshp
  (package
    (name "python-pyshp")
    (version "2.1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/GeospatialPython/pyshp")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jsraqzq82pw19wvx84x7w5cs8agr44a9b5y0jjw540wim4xa73r"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests?
               ;; This is the only test file.
               (invoke "python" "-m" "pytest" "test_shapefile.py")))))))
    (native-inputs
     (list python-pytest python-pytest-runner))
    (home-page "https://github.com/GeospatialPython/pyshp")
    (synopsis "Read/write support for ESRI Shapefile format")
    (description
      "The Python Shapefile Library (PyShp) reads and writes ESRI Shapefiles.")
    (license license:expat)))

(define-public python-cartopy
  (package
    (name "python-cartopy")
    ;; This is a post-release fix that adds build_ext to setup.py.
    (version "0.21.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Cartopy" version))
       (sha256
        (base32 "02i5rjhvrsi3vgj8kfsdx77g1xl59jh2a671qqqj4n682abn9mc9"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda* (#:key inputs outputs tests? #:allow-other-keys)
             (when tests?
               (add-installed-pythonpath inputs outputs)
               (invoke "python" "-m" "pytest" "--pyargs" "cartopy"
                       ;; These tests require online data.
                       "-m" "not natural_earth and not network"
                       "-k"
                       (string-append
                         ;; This one too but it's not marked as such.
                         "not test_gridliner_labels_bbox_style"
                         ;; Those tests fail with proj 9.2.0
                         ;; https://github.com/SciTools/cartopy/issues/2145
                         " and not test_epsg"
                         " and not test_default"
                         " and not test_eccentric_globe"
                         " and not test_ellipsoid_transform"
                         " and not test_eccentric_globe"))))))))
    (propagated-inputs
     (list python-matplotlib
           python-numpy
           python-pykdtree
           python-pyproj
           python-pyshp
           python-scipy
           python-shapely))
    (inputs
     (list geos))
    (native-inputs
     (list python-cython
           python-flufl-lock
           python-pytest
           python-pytest-mpl))
    (home-page "https://scitools.org.uk/cartopy/docs/latest/")
    (synopsis "Cartographic library for visualisation")
    (description
     "Cartopy is a Python package designed to make drawing maps for data
analysis and visualisation easy.

It features:

@itemize
@item object oriented projection definitions
@item point, line, polygon and image transformations between projections
@item integration to expose advanced mapping in Matplotlib with a simple and
intuitive interface
@item powerful vector data handling by integrating shapefile reading with
Shapely capabilities
@end itemize")
    (license license:lgpl3+)))

(define-public postgis
  (package
    (name "postgis")
    (version "3.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.osgeo.org/postgis/source/postgis-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0gl9d6xy2an82ldb9sixz5blyngjryq8m3509fr38ffawvfniazv"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f
       #:make-flags
       (list (string-append "datadir=" (assoc-ref %outputs "out") "/share")
             (string-append "docdir="(assoc-ref %outputs "out") "/share/doc")
             (string-append "pkglibdir="(assoc-ref %outputs "out") "/lib")
             (string-append "bindir=" (assoc-ref %outputs "out") "/bin"))
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'fix-install-path
           (lambda* (#:key outputs #:allow-other-keys)
             (substitute* '("raster/loader/Makefile" "raster/scripts/python/Makefile")
               (("\\$\\(DESTDIR\\)\\$\\(PGSQL_BINDIR\\)")
                (string-append (assoc-ref outputs "out") "/bin"))))))))
    (inputs
     (list gdal
           geos
           giflib
           json-c
           libjpeg-turbo
           libxml2
           openssl
           pcre
           postgresql
           protobuf-c
           proj))
    (native-inputs
     (list perl pkg-config))
    (home-page "https://postgis.net")
    (synopsis "Spatial database extender for PostgreSQL")
    (description "PostGIS is a spatial database extender for PostgreSQL
object-relational database.  It adds support for geographic objects allowing
location queries to be run in SQL.  This package provides a PostgreSQL
extension.")
    (license (list
               ;; General license
               license:gpl2+
               ;; loader/dbfopen, safileio.*, shapefil.h, shpopen.c
               license:expat
               ;; loader/getopt.*
               license:public-domain
               ;; doc/xsl
               license:bsd-3 ; files only say "BSD"
               ;; doc
               license:cc-by-sa3.0))))

(define-public tegola
  (package
    (name "tegola")
    (version "0.16.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://github.com/go-spatial/tegola")
                     (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1mjfn0izf1lj402845mx0cv9fald8s5443q35y16d9crqf3i6mav"))))
    (build-system go-build-system)
    (arguments
     `(#:import-path "github.com/go-spatial/tegola/cmd/tegola"
       #:unpack-path "github.com/go-spatial/tegola"
       #:build-flags '(,(string-append "-ldflags=-X github.com/go-spatial/tegola/internal/build.Version=" version))
       #:install-source? #f))
    (home-page "https://tegola.io")
    (synopsis "Vector tile server for maps")
    (description "Tegola is a free vector tile server written in Go.  Tegola
takes geospatial data and slices it into vector tiles that can be efficiently
delivered to any client.")
    (license (list
               license:expat
               ;; Some packages in vendor have other licenses
               license:asl2.0
               license:bsd-2
               license:bsd-3
               license:wtfpl2))))

(define-public imposm3
  (package
    (name "imposm3")
    (version "0.11.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/omniscale/imposm3")
              (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32
          "1ifniw57l3s0sl7nb3zwxxm86i46451yrhfqnnkxr46cnpbzmwxr"))))
    (build-system go-build-system)
    (arguments
     `(#:import-path "github.com/omniscale/imposm3/cmd/imposm"
       #:unpack-path "github.com/omniscale/imposm3"
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'set-version
           (lambda _
             (substitute* "src/github.com/omniscale/imposm3/version.go"
               (("0.0.0-dev") ,version))
             #t)))))
    (inputs
     (list geos leveldb))
    (home-page "https://imposm.org/")
    (synopsis "OpenStreetMap importer for PostGIS")
    (description "Imposm is an importer for OpenStreetMap data.  It reads PBF
files and imports the data into PostgreSQL/PostGIS databases.  It is designed
to create databases that are optimized for rendering/tile/map-services.")
    (license (list
               license:asl2.0
               ;; Some dependencies in vendor have different licenses
               license:expat
               license:bsd-2
               license:bsd-3))))

(define-public libosmium
  (package
    (name "libosmium")
    (version "2.18.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/osmcode/libosmium")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0fh57mpii1ksacwfx5rz213j896aklib53jbybld2i517q2mmxr0"))))
    (build-system cmake-build-system)
    (propagated-inputs
     (list boost
           bzip2
           expat
           gdal
           geos
           lz4
           proj
           protozero
           sparsehash
           utfcpp
           zlib))
    (native-inputs
     (list doxygen))
    (home-page "https://osmcode.org/libosmium/")
    (synopsis "C++ library for working with OpenStreetMap data")
    (description "Libosmium is a fast and flexible C++ library for working with
OpenStreetMap data.")
    (license license:boost1.0)))

(define-public osmium-tool
  (package
    (name "osmium-tool")
    (version "1.14.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/osmcode/osmium-tool")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0zgyqyrs89vch0qnkh9m5xq079sr2wmydy5zz4l8xbysbjf6xry5"))
       (modules '((guix build utils)))
       (snippet
        ;; Remove bundled libraries.
        '(delete-file-recursively "include/rapidjson"))))
    (build-system cmake-build-system)
    (inputs
     (list libosmium
           rapidjson))
    (native-inputs
     (list pandoc))
    (home-page "https://osmcode.org/osmium-tool/")
    (synopsis "Osmium command-line tool")
    (description "Command line tool for working with OpenStreetMap data
based on the Osmium library.")
    (license license:gpl3+)))

(define-public osm2pgsql
  (package
    (name "osm2pgsql")
    (version "1.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/openstreetmap/osm2pgsql")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ssz7ny4wx8dzl3027p37xc5h7m1aj6bzxzdc6g8fbp7q57ykvxz"))
       (modules '((guix build utils)))
       (snippet
        ;; Remove bundled libraries.
        '(delete-file-recursively "contrib"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f; tests fail because we need to setup a database
       #:configure-flags
       (list "-DEXTERNAL_LIBOSMIUM=ON"
             "-DEXTERNAL_PROTOZERO=ON"
             "-DEXTERNAL_FMT=ON")))
    (inputs
     (list boost
           bzip2
           expat
           fmt-8
           libosmium
           lua
           postgresql
           proj
           protozero
           zlib))
    (native-inputs
     (list python python-psycopg2))
    (home-page "https://github.com/openstreetmap/osm2pgsql")
    (synopsis "OSM data importer to postgresql")
    (description "Osm2pgsql is a tool for loading OpenStreetMap data into a
PostgreSQL / PostGIS database suitable for applications like rendering into a
map, geocoding with Nominatim, or general analysis.")
    (license license:gpl2+)))

(define-public tippecanoe
  (package
    (name "tippecanoe")
    (version "2.17.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/felt/tippecanoe")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1q2snvsbs10l9pjydid3zxkidlha5hav8gvb0p731m2pwg3xw0qr"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases (delete 'configure))
       #:test-target "test"
       #:make-flags
       (list (string-append "CC=" ,(cc-for-target))
             (string-append "PREFIX=" (assoc-ref %outputs "out")))))
    (inputs
     (list perl sqlite zlib))
    (home-page "https://github.com/mapbox/tippecanoe")
    (synopsis "Vector tile server for maps")
    (description "Tippecanoe creates scale-independent view of data, so that
the texture and density of features is visible at every zoom level, instead of
dropping features at lower levels.")
    (license license:bsd-2)))

(define-public osmctools
  (package
    (name "osmctools")
    (version "0.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/osm-c-tools/osmctools")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1m8d3r1q1v05pkr8k9czrmb4xjszw6hvgsf3kn9pf0v14gpn4r8f"))))
    (build-system gnu-build-system)
    (native-inputs
     (list autoconf automake))
    (inputs
     (list zlib))
    (home-page "https://gitlab.com/osm-c-tools/osmctools")
    (synopsis "Tools to convert, filter and update OpenStreetMap data files")
    (description "This project contains a few tools which are used in the
OpenStreetMap project.  They can be used to convert, filter and update
OpenStreetMap data files.")
    (license license:agpl3)))

(define-public osm-gps-map
  (package
    (name "osm-gps-map")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nzjrs/osm-gps-map/releases/download/"
             version "/osm-gps-map-" version ".tar.gz"))
       (sha256
        (base32
         "11imsf4cz1dpxdjh178k2s29axmq86rkfg1pqmn7incyxmjzhbwg"))))
    (build-system gnu-build-system)
    (native-inputs
     (list gnome-common gtk-doc/stable pkg-config))
    (inputs
     (list cairo glib gobject-introspection gtk+ libsoup-minimal-2))
    (home-page "https://nzjrs.github.io/osm-gps-map/")
    (synopsis "GTK+ widget for displaying OpenStreetMap tiles")
    (description
     "This package provides a GTK+ widget (and Python bindings) that when
given GPS coordinates,draws a GPS track, and points of interest on a moving
map display.  Downloads map data from a number of websites, including
@url{https://www.openstreetmap.org}.")
    (license license:gpl2+)))

(define-public xygrib
  (package
    (name "xygrib")
    (version "1.2.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://github.com/opengribs/XyGrib")
                     (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0xzsm8pr0zjk3f8j880fg5n82jyxn8xf1330qmmq1fqv7rsrg9ia"))
              (patches (search-patches "xygrib-fix-finding-data.patch"
                                       "xygrib-newer-proj.patch"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  (delete-file-recursively "data/fonts")
                  ;; Fixes compilation, can be removed with the next release.
                  ;; Upstream link: https://github.com/opengribs/XyGrib/pull/255
                  (substitute* "src/SkewT.h"
                    (("QMessageBox>") "QMessageBox>\n#include <QPainterPath>"))
                  ;; Accept newer versions of openjpeg
                  ;; https://github.com/opengribs/XyGrib/pull/298
                  (substitute* "CMakeLists.txt"
                    (("openjpeg-2.4") "openjpeg-2.5 openjpeg-2.4"))))))
    (build-system cmake-build-system)
    (arguments
     `(#:configure-flags (list "-DGNU_PACKAGE=ON")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-directories
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((jpeg (assoc-ref inputs "openjpeg"))
                   (font (assoc-ref inputs "font-liberation")))
               (substitute* "CMakeLists.txt"
                 ;; Skip looking for the static library.
                 (("\"libnova.a\"") ""))
               ;; Don't use the bundled font-liberation.
               (substitute* "src/util/Font.cpp"
                 (("Util::pathFonts\\(\\)\\+\"liberation-fonts/\"")
                  (string-append "\"" font "/share/fonts/truetype/\"")))
               (substitute* "src/util/Util.h"
                 (("pathData\\(\\)\\+\"data/fonts/\"")
                  (string-append "\"" font "/share/fonts/\"")))))))
       #:tests? #f)) ; no tests
    (native-inputs
     (list qttools-5))
    (inputs
     (list bzip2
           font-liberation
           libnova
           libpng
           openjpeg
           proj
           qtbase-5
           zlib))
    (native-search-paths
     (list (search-path-specification
            (variable "XDG_DATA_DIRS")
            (files '("share")))))
    (synopsis "Weather Forecast Visualization")
    (description
     "XyGrib is a Grib file reader and visualizes meteorological data providing
an off-line capability to analyse weather forecasts or hindcasts.  It is
intended to be used as a capable weather work station for anyone with a serious
interest in examining weather. This would include members of the sailing
community, private and sport aviators, farmers, weather buffs and many more.
XyGrib is the continuation of the zyGrib software package with a new team of
volunteers.")
    (home-page "https://opengribs.org")
    (license license:gpl3+)))

(define-public libspatialindex
  (package
    (name "libspatialindex")
    (version "1.9.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/libspatialindex/libspatialindex/"
                           "releases/download/" version "/spatialindex-src-"
                           version ".tar.bz2"))
       (sha256
        (base32
         "02n5vjcyk04w0djidyp21hfbxfpbbara8ifd9nml6158rwqr8lja"))))
    (build-system cmake-build-system)
    (home-page "https://libspatialindex.org")
    (synopsis "Spatial indexing library")
    (description "The purpose of this library is to provide:

@itemize
 @item An extensible framework that will support robust spatial indexing
methods.
 @item Support for sophisticated spatial queries.  Range, point location,
 nearest neighbor and k-nearest neighbor as well as parametric queries (defined
by spatial constraints) should be easy to deploy and run.
 @item Easy to use interfaces for inserting, deleting and updating information.
 @item Wide variety of customization capabilities.  Basic index and storage
characteristics like the page size, node capacity, minimum fan-out, splitting
algorithm, etc. should be easy to customize.
 @item Index persistence.  Internal memory and external memory structures
should be supported.  Clustered and non-clustered indices should be easy to be
persisted.
@end itemize
")
    (license license:expat)))

(define-public python-rtree
  (package
    (name "python-rtree")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Rtree" version))
       (sha256
        (base32 "0aalh07fyf6vpr0a6zswnqvvrjhyic1zg6w4bl368fihkilj2892"))))
    (build-system pyproject-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'find-libspatialindex
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((libspatialindex (assoc-ref inputs "libspatialindex")))
               (substitute* "rtree/finder.py"
                 (("find_library\\(\"spatialindex_c\"\\)")
                  (string-append  "\"" libspatialindex
                                  "/lib/libspatialindex_c.so\"")))))))))
    (native-inputs
     (list python-numpy python-pytest python-wheel))
    (inputs
     (list libspatialindex))
    (home-page "https://github.com/Toblerity/rtree")
    (synopsis "R-Tree spatial index for Python GIS")
    (description
     "RTree is a Python package with bindings for @code{libspatialindex}.")
    (license license:expat)))

(define-public java-jmapviewer
  (package
    (name "java-jmapviewer")
    (version "2.13")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://svn.openstreetmap.org/applications/"
                                  "viewer/jmapviewer/releases/" version
                                  "/JMapViewer-" version "-Source.zip"))
              (sha256
               (base32
                "0sy6r5fkbb9bclw0is6gwnbzz627m7pjfnsqydxz58pbndakkhrv"))))
    (build-system ant-build-system)
    (native-inputs
     (list unzip))
    (arguments
     `(#:build-target "pack"
       #:tests? #f; No tests
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'clean
           (lambda* _
             (invoke "ant" "clean")))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((dir (string-append (assoc-ref outputs "out") "/share/java/")))
               (mkdir-p dir)
               (copy-file "JMapViewer.jar" (string-append dir "JMapViewer.jar"))
               #t))))))
    (home-page "https://wiki.openstreetmap.org/wiki/JMapViewer")
    (synopsis "OSM map integration in Java")
    (description "JMapViewer is a Java component which easily
integrates an OSM map view into your Java application.  It is maintained as
an independent project by the JOSM team.")
    (license license:gpl2)))

(define-public java-opening-hours-parser
  (package
    (name "java-opening-hours-parser")
    (version "0.27.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://github.com/simonpoole/OpeningHoursParser")
                     (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1sw5ccxqw4ly5hzxnnljjqx4876gyvagi10sg8r9w25n211lq0x4"))))
    (build-system ant-build-system)
    (arguments
     `(#:jar-name "java-opening-hours-parser.jar"
       #:source-dir "src/main/java"
       #:test-exclude (list "**/IndividualTest.java")
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'copy-resources
           (lambda _
             (copy-recursively "src/main/resources" "build/classes")
             #t))
         (add-before 'build 'generate-parser
           (lambda* _
             (let* ((dir "src/main/java/ch/poole/openinghoursparser")
                    (file (string-append dir "/OpeningHoursParser.jj")))
               (invoke "javacc" "-DEBUG_PARSER=false"
                       "-DEBUG_TOKEN_MANAGER=false" "-JDK_VERSION=1.8"
                       "-GRAMMAR_ENCODING=UTF-8"
                       (string-append "-OUTPUT_DIRECTORY=" dir)
                       file)))))))
    (inputs
     (list java-jetbrains-annotations))
    (native-inputs
     (list javacc java-junit java-hamcrest-core))
    (home-page "https://github.com/simonpoole/OpeningHoursParser")
    (synopsis "Java parser for the OpenStreetMap opening hour format")
    (description "This is a very simplistic parser for string values according
to the OSM opening hours specification.")
    (license license:expat)))

(define-public josm
  (package
    (name "josm")
    (version "18646")
    (source (origin
              (method svn-fetch)
              (uri (svn-reference
                     (url "https://josm.openstreetmap.de/svn/trunk")
                     (revision (string->number version))
                     (recursive? #f)))
              (sha256
               (base32
                "0zr3p1i39wi0f29lgb3xrnv6lijrq5ia8jxn4wnq1yz0xdlbg98i"))
              (file-name (string-append name "-" version "-checkout"))
              (modules '((guix build utils)))
            (snippet
             '(begin
                (for-each delete-file (find-files "." ".*.jar$"))
                #t))))
    (build-system ant-build-system)
    (native-inputs
     (list javacc))
    (inputs
     (list java-commons-jcs
           java-commons-compress
           java-jmapviewer
           java-jsonp-api
           java-jsonp-impl ; runtime dependency
           java-jsr305
           java-metadata-extractor
           java-opening-hours-parser
           java-openjfx-media
           java-signpost-core
           java-svg-salamander))
    (arguments
     `(#:tests? #f
       #:jar-name "josm.jar"
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'rm-build.xml
           (lambda* _
             (delete-file "build.xml")
             #t))
         (add-before 'build 'fix-revision
           (lambda* _
             (with-output-to-file "REVISION.XML"
               (lambda _
                 (display
                   (string-append "<info><entry><commit revision=\"" ,version "\">"
                                  "<date>1970-01-01 00:00:00 +0000</date>"
                                  "</commit></entry></info>"))))
             #t))
         (add-before 'build 'fix-classpath
           (lambda* (#:key inputs #:allow-other-keys)
             (setenv "CLASSPATH"
                     (string-join
                       (filter
                         (lambda (s)
                           (let ((source (assoc-ref inputs "source")))
                             (not (equal? (substring s 0 (string-length source))
                                          source))))
                         (string-split (getenv "CLASSPATH") #\:))
                       ":"))
             #t))
         (add-before 'build 'generate-parser
           (lambda* _
             (let* ((dir "src/org/openstreetmap/josm/gui/mappaint/mapcss")
                    (out (string-append dir "/parsergen"))
                    (file (string-append dir "/MapCSSParser.jj")))
               (mkdir-p "src/org/openstreetmap/josm/gui/mappaint/mapcss/parsergen")
               (invoke "javacc" "-DEBUG_PARSER=false"
                       "-DEBUG_TOKEN_MANAGER=false" "-JDK_VERSION=1.8"
                       "-GRAMMAR_ENCODING=UTF-8"
                       (string-append "-OUTPUT_DIRECTORY=" out)
                       file))
             #t))
         (add-after 'build 'generate-epsg
           (lambda _
             (system* "javac" "scripts/BuildProjectionDefinitions.java"
                      "-cp" "build/classes")
             (mkdir-p "data/projection")
             (with-output-to-file "data/projection/custom-epsg"
               (lambda _ (display "")))
             (invoke "java" "-cp" "build/classes:scripts:."
                     "BuildProjectionDefinitions" ".")
             #t))
         (add-after 'generate-epsg 'copy-resources
           (lambda _
             (copy-recursively "resources" "build/classes")
             #t))
         (add-before 'install 'regenerate-jar
           (lambda _
             ;; We need to regenerate the jar file to add data.
             (delete-file "build/jar/josm.jar")
             (invoke "jar" "-cf" "build/jar/josm.jar" "-C"
                     "build/classes" ".")
             #t))
         (add-before 'build 'copy-revision
           (lambda _
             (mkdir-p "build/classes")
             (with-output-to-file "build/classes/REVISION"
               (lambda _
                 (display
                   (string-append "Revision: " ,version "\n"
                                  "Is-Local-Build: true\n"
                                  "Build-Date: 1970-01-01 00:00:00 +0000\n"))))
             #t))
         (add-after 'install 'install-share-directories
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out               (assoc-ref outputs "out"))
                   (share-directories '("applications" "icons" "man" "menu"
                                        "metainfo" "mime" "pixmaps"))
                   (desktop "org.openstreetmap.josm.desktop"))
               (for-each (lambda (directory)
                           (copy-recursively (string-append
                                              "native/linux/tested/usr/share/"
                                              directory)
                                             (string-append
                                              out "/share/" directory)))
                         share-directories)
               (substitute* (string-append out "/share/applications/" desktop)
                 (("josm-MainApplication") "josm-gui-MainApplication")))
             #t))
         (add-after 'install 'install-bin
           (lambda* (#:key outputs inputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin")))
               (mkdir-p bin)
               (with-output-to-file (string-append bin "/josm")
                 (lambda _
                   (display
                     (string-append "#!/bin/sh\n"
                                    (assoc-ref inputs "jdk") "/bin/java"
                                    " -cp " out "/share/java/josm.jar:"
                                    (getenv "CLASSPATH")
                                    " org.openstreetmap.josm.gui.MainApplication"))))
               (chmod (string-append bin "/josm") #o755))
             #t)))))
    (home-page "https://josm.openstreetmap.de")
    (synopsis "OSM editor")
    (description "JOSM is an extensible editor for OpenStreetMap (OSM).  It
supports loading GPX tracks, background imagery and OSM data from local
sources as well as from online sources and allows editing the OSM data (nodes,
ways, and relations) and their metadata tags.")
    (license license:gpl2+)))

(define-public libmaxminddb
  (package
    (name "libmaxminddb")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/maxmind/libmaxminddb"
                           "/releases/download/" version "/"
                           "/libmaxminddb-" version ".tar.gz"))
       (sha256
        (base32 "0rw2z7rx8jzgdcgqlmc4wqrsjmiwd8vm5wvvrldy472rghcaq83n"))))
    (build-system gnu-build-system)
    (arguments
     `(#:make-flags
       (list ,(string-append "CC=" (cc-for-target)))))
    (native-inputs
     (list perl))
    (home-page "https://maxmind.github.io/libmaxminddb/")
    (synopsis "C library for the MaxMind DB file format")
    (description "The libmaxminddb library provides a C library for reading
MaxMind DB files, including the GeoIP2 databases from MaxMind.  The MaxMind DB
format is a custom, but open, binary format designed to facilitate fast
lookups of IP addresses while allowing flexibility in the type of data
associated with an address.")
    (license license:asl2.0)))

(define-public python-maxminddb
  (package
    (name "python-maxminddb")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "maxminddb" version))
       (sha256
        (base32
         "1rc4a403r3b4vhmhb03gidd0fmsbvfpbf3qfcw25h4db9zn0fxz3"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f)) ;; Tests require a copy of the maxmind database
    (inputs
     (list libmaxminddb))
    (home-page "https://www.maxmind.com/")
    (synopsis "Reader for the MaxMind DB format")
    (description "MaxMind DB is a binary file format that stores data indexed
by IP address subnets (IPv4 or IPv6).  This is a Python module for reading
MaxMind DB files.")
    (license license:asl2.0)))

(define-public python-geoip2
  (package
    (name "python-geoip2")
    (version "2.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "geoip2" version))
       (sha256
        (base32
         "1w7cay5q6zawjzivqbwz5cqx1qbdjw6kbriccb7l46p7b39fkzzp"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f)) ;; Tests require a copy of the maxmind database
    (inputs
     (list python-maxminddb python-requests))
    (home-page "https://www.maxmind.com/")
    (synopsis "MaxMind GeoIP2 API")
    (description "Provides an API for the GeoIP2 web services and databases.
The API also works with MaxMind’s free GeoLite2 databases.")
    (license license:asl2.0)))

(define-public routino
  (package
   (name "routino")
   (version "3.3.3")
   (source
    (origin
     (method url-fetch)
     (uri (string-append "http://www.routino.org/download/routino-"
                         version ".tgz"))
     (sha256
      (base32 "1xa7l2bjn832nk6bc7b481nv8hd2gj41jwhg0d2qy10lqdvjpn5b"))))
   (build-system gnu-build-system)
   (native-inputs
    (list perl))
   (inputs
    (list bzip2 xz zlib))
   (arguments
    `(#:test-target "test"
      #:phases
      (modify-phases %standard-phases
        (replace 'configure
          (lambda* (#:key outputs #:allow-other-keys)
            (substitute* "Makefile.conf"
              (("prefix=/usr/local")
               (string-append "prefix=" (assoc-ref outputs "out")))
              (("LDFLAGS_LDSO=-Wl,-R\\.")
               "LDFLAGS_LDSO=-Wl,-R$(libdir)")
              (("#CFLAGS\\+=-DUSE_XZ")
               "CFLAGS+=-DUSE_XZ")
              (("#LDFLAGS\\+=-llzma")
               "LDFLAGS+=-llzma"))
            #t)))))
   (synopsis "Routing application for OpenStreetMap data")
   (description
    "Routino is an application for finding a route between two points
using the dataset of topographical information collected by
@url{https://www.OpenStreetMap.org}.")
   (home-page "https://www.routino.org/")
   (license license:agpl3+)))

(define-public r-rnaturalearthhires
  (let ((commit "c3785a8c44738de6ae8f797080c0a337ebed929d")
        (revision "1"))
    (package
      (name "r-rnaturalearthhires")
      (version (git-version "0.2.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/ropensci/rnaturalearthhires")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1fr0yb2fbr9zbk7gqr3rnzz2w4ijjpl6hlzdrh4n27lf0ip3h0cx"))))
      (properties `((upstream-name . "rnaturalearthhires")))
      (build-system r-build-system)
      (propagated-inputs (list r-sp))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/ropensci/rnaturalearthhires")
      (synopsis
       "High Resolution World Vector Map Data from Natural Earth used in rnaturalearth")
      (description
       "Facilitates mapping by making natural earth map data from http://
www.naturalearthdata.com/ more easily available to R users.  Focuses on vector
data.")
      (license license:cc0))))

(define-public qmapshack
  (package
    (name "qmapshack")
    (version "1.16.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Maproom/qmapshack")
             (commit (string-append "V_" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "184fqmsfzr3b333ssizjk6gvv7mncmygq8dj5r7rsvs5md26z2ys"))))
    (build-system qt-build-system)
    (native-inputs
     (list pkg-config qttools-5))
    (inputs
     (list curl
           gdal
           libjpeg-turbo
           proj
           qtbase-5
           qtdeclarative-5
           qtlocation
           qtwebchannel-5
           qtwebengine-5
           quazip
           routino
           sqlite ; See wrap phase
           zlib))
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-cmake-modules
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "CMakeLists.txt"
               (("find_package\\(Qt5PrintSupport        REQUIRED\\)" all)
                (string-append all "\nfind_package(Qt5Positioning REQUIRED)")))
             (substitute* "cmake/Modules/FindROUTINO.cmake"
               (("/usr/local")
                (assoc-ref inputs "routino"))))))))
    (synopsis "GPS mapping application")
    (description
     "QMapShack can be used to plan your next outdoor trip or to visualize and
archive all the GPS recordings of your past trips.  It is the successor of the
QLandkarte GT application.")
    (home-page "https://github.com/Maproom/qmapshack/wiki")
    (license license:gpl3+)))

(define-public readosm
  (package
    (name "readosm")
    (version "1.1.0a")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.gaia-gis.it/gaia-sins/"
                           "readosm-" version ".tar.gz"))
       (sha256
        (base32 "0igif2bxf4dr82glxz9gyx5mmni0r2dsnx9p9k6pxv3c4lfhaz6v"))))
    (build-system gnu-build-system)
    (inputs
     (list expat zlib))
    (synopsis "Data extractor for OpenStreetMap files")
    (description
     "ReadOSM is a library to extract valid data from within an OpenStreetMap
input file (in @code{.osm} or @code{.osm.pbf} format).")
    (home-page "https://www.gaia-gis.it/fossil/readosm/index")
    (license (list license:gpl2+
                   license:lgpl2.1+
                   license:mpl1.1))))

(define-public shapelib
  (package
    (name "shapelib")
    (version "1.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/OSGeo/shapelib")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1lzch0jf6yqhw391phhafzw4ghmiz98zkf698h4fmq109fa2vhqd"))))
    (build-system gnu-build-system)
    (native-inputs
     (list autoconf automake libtool))
    (home-page "http://shapelib.maptools.org/")
    (synopsis "Provides C library to write and update ESRI Shapefiles")
    (description
     "The Shapefile C Library provides the ability to write simple C programs
for reading, writing and updating (to a limited extent) ESRI Shapefiles, and the
associated attribute file (@file{.dbf}).")
    (license license:gpl2+)))

(define-public spatialite-tools
  (package
    (name "spatialite-tools")
    (version "5.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.gaia-gis.it/gaia-sins/"
                           "spatialite-tools-" version ".tar.gz"))
       (sha256
        (base32 "070p6pg541wvwb28wkn7k0z1qdyirik2qc2jpj4pf0vzx02w414n"))))
    (build-system gnu-build-system)
    (native-inputs
     (list pkg-config))
    (inputs
     (list expat
           freexl
           geos
           librttopo
           libspatialite
           libxml2
           minizip
           proj
           readosm
           sqlite))
    (synopsis "Collection of command line tools for SpatiaLite")
    (description
     "@code{spatialite-tools} is a collection of Command Line Interface (CLI)
tools supporting SpatiaLite.")
    (home-page "https://www.gaia-gis.it/fossil/spatialite-tools/index")
    (license license:gpl3+)))

(define-public virtualpg
  (package
    (name "virtualpg")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.gaia-gis.it/gaia-sins/"
                           "virtualpg-" version ".tar.gz"))
       (sha256
        (base32 "12z0l7368r4116ljzg7nljy5hf425r11vxc540w79wlzikmynamy"))))
    (build-system gnu-build-system)
    (inputs
     (list postgresql sqlite))
    (synopsis "Allow SQLite/SpatiaLite to access PostgreSQL/PostGIS tables")
    (description
     "VirtualPG is a dynamic extension for the SQLite DBMS.  It implements
the VirtualPostgres driver, allowing to directly exchange data between SQLite
and PostgreSQL; if SpatiaLite is available even PostGIS geometries can be
exchanged form one Spatial DBMS and the other.")
    (home-page "https://www.gaia-gis.it/fossil/virtualpg/index")
    (license (list license:gpl2+
                   license:lgpl2.1+
                   license:mpl1.1))))

(define-public opencpn
  (package
    (name "opencpn")
    (version "5.6.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/OpenCPN/OpenCPN")
             (commit (string-append "Release_" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16hb0ycp0kbx2h8fx08rqkgrlz48kaym0d6wqvpjrcfa2r4myss8"))))
    (build-system cmake-build-system)
    (native-inputs
     (list gettext-minimal pkg-config))
    (inputs
     (list alsa-utils
           bzip2
           cairo
           curl
           eudev
           glu
           gtk+
           jasper
           libarchive
           libelf
           libexif
           libjpeg-turbo
           libsndfile
           libusb
           lz4
           mesa
           pango
           portaudio
           sqlite
           tinyxml
           wxsvg
           wxwidgets-3.0
           xz
           zlib))
    (arguments
     `(#:configure-flags '("-DOCPN_USE_BUNDLED_LIBS=OFF"
                           "-DOCPN_ENABLE_PORTAUDIO=ON"
                           "-DOCPN_ENABLE_SNDFILE=ON"
                           "-DOCPN_BUNDLE_TCDATA=ON"
                           "-DOCPN_BUNDLE_GSHHS=ON")
       #:tests? #f ; No tests defined
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-build
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "CMakeLists.txt"
               (("wx-32.c; cc")
                 "wx-32.c; gcc")
               (("\"/bin/sh\" \"-c\"")
                (string-append "\"" (which "bash") "\" \"-c\""))
               (("include\\(TargetSetup\\)")
                "set(PKG_TARGET \"guix\")\nset(PKG_TARGET_VERSION 1)")))))))
    (synopsis "Chart plotter and marine GPS navigation software")
    (description
     "OpenCPN is a chart plotter and marine navigation software designed to be
used at the helm station of your boat while underway.  Chart a course and
track your position right from your laptop.")
    (home-page "https://opencpn.org/")
    (license (list license:asl2.0
                   license:cc0
                   license:bsd-2
                   license:bsd-3
                   license:expat
                   license:gpl3+
                   license:lgpl2.1+
                   license:lgpl3+
                   license:sgifreeb2.0
                   license:zlib))))

(define-public openorienteering-mapper
  (package
    (name "openorienteering-mapper")
    (version "0.9.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OpenOrienteering/mapper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "11b578h8f3q9yvphbjhqmy2w1cfc9skslzawypqmc3k44v24aj0s"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f
       #:configure-flags
       (list
        "-DLICENSING_PROVIDER:BOOL=OFF"
        "-DMapper_MANUAL_QTHELP:BOOL=OFF")))
    (inputs
     `(("clipper" ,clipper)
       ("cups" ,cups)
       ("curl" ,curl)
       ("gdal" ,gdal)
       ("proj" ,proj)
       ("qtbase" ,qtbase-5)
       ("qtimageformats" ,qtimageformats)
       ("qtlocation" ,qtlocation)
       ("qtsensors" ,qtsensors)
       ("zlib" ,zlib)))
    (native-inputs
     `(("doxygen" ,doxygen)
       ("qttools-5" ,qttools-5)))
    (home-page "https://www.openorienteering.org/apps/mapper/")
    (synopsis "OpenOrienteering Mapper (OOM)")
    (description
     "OpenOrienteering Mapper is a software for creating maps for the
orienteering sport.")
    (license license:gpl3+)))

(define-public grass
  (let* ((version "7.8.7")
         (majorminor (string-join (list-head (string-split version #\.) 2) ""))
         (grassxx (string-append "grass" majorminor)))
    (package
      (name "grass")
      (version version)
      (source
       (origin
         (method url-fetch)
         (uri (string-append "https://grass.osgeo.org/" grassxx
                             "/source/grass-" version ".tar.gz"))
         (sha256
          (base32 "0sbz0ba9p963phvd0gmvfqq1fg4ixpipzcjbf20ys86qavjppzsg"))))
      (build-system gnu-build-system)
      (inputs
       `(("bzip2" ,bzip2)
         ("cairo" ,cairo)
         ("fftw" ,fftw)
         ("freetype" ,freetype)
         ("gdal" ,gdal)
         ("geos" ,geos)
         ("glu" ,glu)
         ("lapack" ,lapack)
         ("libpng" ,libpng)
         ("libtiff" ,libtiff)
         ("mesa" ,mesa)
         ("mariadb-dev" ,mariadb "dev")
         ("mariadb-lib" ,mariadb "lib")
         ("netcdf" ,netcdf)
         ("openblas" ,openblas)
         ("perl" ,perl)
         ("postgresql" ,postgresql)
         ("proj" ,proj)
         ("python" ,python)
         ("python-dateutil" ,python-dateutil)
         ("python-numpy" ,python-numpy)
         ("python-wxpython" ,python-wxpython)
         ("readline" ,readline)
         ("sqlite" ,sqlite)
         ("wxwidgets" ,wxwidgets)
         ("zlib" ,zlib)
         ("zstd" ,zstd "lib")))
      (native-inputs
       `(("bash" ,bash-minimal)
         ("bison" ,bison)
         ("flex" ,flex)
         ("pkg-config" ,pkg-config)))
      (arguments
       `(#:tests? #f ; No tests
         #:modules ((guix build gnu-build-system)
                    ((guix build python-build-system) #:prefix python:)
                    (guix build utils))
         #:imported-modules (,@%gnu-build-system-modules
                             (guix build python-build-system))
         #:phases
         (modify-phases %standard-phases
           (replace 'configure
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (let ((shell (search-input-file inputs "/bin/bash")))
                 (setenv "SHELL" shell)
                 (setenv "CONFIG_SHELL" shell)
                 (setenv "LDFLAGS" (string-append "-Wl,-rpath -Wl,"
                                                  (assoc-ref outputs "out")
                                                  "/" ,grassxx "/lib")))
               (invoke "./configure"
                       (string-append "--prefix="
                                      (assoc-ref outputs "out"))
                       "--with-blas"
                       "--with-bzlib"
                       (string-append "--with-freetype-includes="
                                      (assoc-ref inputs "freetype")
                                      "/include/freetype2")
                       (string-append "--with-freetype-libs="
                                      (assoc-ref inputs "freetype")
                                      "/lib")
                       "--with-geos"
                       "--with-lapack"
                       "--with-mysql"
                       (string-append "--with-mysql-includes="
                                      (assoc-ref inputs "mariadb-dev")
                                      "/include/mysql")
                       (string-append "--with-mysql-libs="
                                      (assoc-ref inputs "mariadb-lib")
                                      "/lib")
                       "--with-netcdf"
                       "--with-postgres"
                       (string-append "--with-proj-share="
                                      (assoc-ref inputs "proj")
                                      "/share/proj")
                       "--with-pthread"
                       "--with-readline"
                       "--with-sqlite"
                       "--with-wxwidgets")))
           (add-after 'install 'install-links
             (lambda* (#:key outputs #:allow-other-keys)
               ;; Put links for includes and libraries in the standard places.
               (let* ((out (assoc-ref outputs "out"))
                      (dir (string-append out "/" ,grassxx)))
                 (symlink (string-append dir "/include")
                          (string-append out "/include"))
                 (symlink (string-append dir "/lib")
                          (string-append out "/lib")))
               #t))
           (add-after 'install-links 'python:wrap
             (assoc-ref python:%standard-phases 'wrap))
           (add-after 'python:wrap 'wrap-with-python-interpreter
             (lambda* (#:key outputs #:allow-other-keys)
               (let ((out (assoc-ref outputs "out")))
                 (wrap-program (string-append out "/bin/" ,grassxx)
                   `("GRASS_PYTHON" = (,(which "python3"))))
                 #t))))))
      (synopsis "GRASS Geographic Information System")
      (description
       "GRASS (Geographic Resources Analysis Support System), is a Geographic
Information System (GIS) software suite used for geospatial data management and
analysis, image processing, graphics and maps production, spatial modeling, and
visualization.")
      (home-page "https://grass.osgeo.org/")
      (license license:gpl2+))))

(define-public saga
  (package
    (name "saga")
    (version "8.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/saga-gis/SAGA%20-%20"
                           (version-major version) "/SAGA%20-%20" version
                           "/saga-" version ".tar.gz"))
       (sha256
        (base32 "008izjs6gvj09abxf16ssl1xy0ay3ljq4jswbggp6wiiq459minv"))
       (modules '((guix build utils)))
       (snippet
        '(substitute* "saga-gis/src/tools/docs/docs_pdf/doc_pdf.cpp"
           (("^#include <hpdf\\.h>\n" all)
            (string-append all "#include <hpdf_version.h>\n"))
           (("\\bHPDF_PROJECTING_SCUARE_END\\b")
            "HPDF_PROJECTING_SQUARE_END")))))
    (build-system cmake-build-system)
    (native-inputs
     (list pkg-config swig))
    (inputs
     (list curl
           fftw
           gdal
           hdf5
           jasper
           libharu
           libtiff
           opencv
           postgresql
           proj
           python
           qhull
           unixodbc
           vigra
           wxwidgets))
    (arguments
     '(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'cd-to-source-dir
           (lambda _
             (chdir "saga-gis"))))))
    (synopsis "System for Automated Geoscientific Analyses")
    (description
     "SAGA (System for Automated Geoscientific Analyses) is a Geographic
Information System (GIS) software.  It has been designed for an easy and
effective implementation of spatial algorithms and it offers a comprehensive,
growing set of geoscientific methods.")
    (home-page "https://www.saga-gis.org")
    (license (list license:gpl2+ license:lgpl2.1+))))

(define-public qgis
  (package
    (name "qgis")
    (version "3.30.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://qgis.org/downloads/qgis-"
                           version ".tar.bz2"))
       (sha256
        (base32 "0mdgqyqr3nswp5qfpjrpr35lxizcrz73a1gs3ddxsd1xr9amzb5s"))))
    (build-system cmake-build-system)
    (arguments
     `(#:modules ((guix build cmake-build-system)
                  ((guix build python-build-system) #:prefix python:)
                  (guix build qt-utils)
                  (guix build utils))
       #:imported-modules (,@%cmake-build-system-modules
                           (guix build python-build-system)
                           (guix build qt-utils))
       #:configure-flags
       '("-DWITH_QTWEBKIT=NO")
       #:phases
       (modify-phases %standard-phases
         ;; Configure correct path to PyQt5 SIP directory
         (add-after 'unpack 'configure-pyqt5-sip-path
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((sip-dir (string-append
                             (assoc-ref inputs "python-pyqt+qscintilla")
                             "/lib/python"
                             (python:python-version (assoc-ref inputs "python"))
                             "/site-packages/PyQt5/bindings")))
               (substitute* "cmake/FindPyQt5.py"
                 (("sip_dir = cfg.default_sip_dir")
                  (string-append "sip_dir = \"" sip-dir "\"")))
               (substitute* "cmake/FindPyQt5.cmake"
                 (("SET\\(PYQT5_SIP_DIR \"\\$\\{Python_SITEARCH\\}/PyQt5/bindings\"\\)")
                  (string-append "SET(PYQT5_SIP_DIR \"" sip-dir "\")"))))
             (substitute* (list "tests/code_layout/test_qt_imports.sh"
                                "tests/code_layout/test_qgsscrollarea.sh")
               (("\\$\\(git rev-parse --show-toplevel\\)")
                (getcwd)))))
         (replace 'check
           (lambda* (#:key inputs outputs tests? parallel-tests?
                     #:allow-other-keys)
             (when tests?
             (setenv "HOME" "/tmp")
             (system "Xvfb :1 &")
             (setenv "DISPLAY" ":1")
             (setenv "TRAVIS" "true")
             (setenv "CTEST_OUTPUT_ON_FAILURE" "1")
             (let* ((out (assoc-ref outputs "out"))
                    (grass-version ,(package-version grass))
                    (grass-majorminor (string-join
                                       (list-head
                                        (string-split grass-version #\.) 2)
                                       ""))
                    (grass (string-append (assoc-ref inputs "grass")
                                          "/grass" grass-majorminor)))
               (setenv "GISBASE" grass))
             (invoke "ctest"
                     "-j" (if parallel-tests?
                              (number->string (parallel-job-count))
                              "1")
                     "-E" (string-join
                           '(;; Disable tests that require network access
                             "PyQgsExternalStorageAwsS3"
                             "PyQgsExternalStorageWebDav"
                             "qgis_filedownloader"
                             "test_core_networkaccessmanager"
                             "test_core_tiledownloadmanager"
                             "test_gui_filedownloader"
                             "test_provider_wcsprovider"
                             ;; Disable tests that need OGR built with
                             ;; libspatialite support
                             "PyQgsAttributeTableModel"
                             "PyQgsOGRProviderSqlite"
                             "PyQgsWFSProvider"
                             "PyQgsOapifProvider"
                             ;; Disable tests that need Python compiled
                             ;; with loadable SQLite extensions.
                             "PyQgsFieldFormattersTest"
                             "PyQgsSpatialiteProvider"
                             "PyQgsLayerDependencies"
                             "PyQgsDBManagerGpkg"
                             "PyQgsDBManagerSpatialite"
                             ;; Disable tests that need poppler (with Cairo)
                             "PyQgsLayoutExporter"
                             "PyQgsPalLabelingLayout"
                             ;; Disable tests that need Orfeo ToolBox
                             "ProcessingOtbAlgorithmsTest"
                             ;; TODO: Find why the following tests fail
                             "ProcessingQgisAlgorithmsTestPt1"
                             "ProcessingQgisAlgorithmsTestPt3"
                             "ProcessingQgisAlgorithmsTestPt4"
                             "ProcessingGdalAlgorithmsRasterTest"
                             "ProcessingGdalAlgorithmsVectorTest"
                             "ProcessingGrass7AlgorithmsImageryTest"
                             "ProcessingGrass7AlgorithmsRasterTestPt1"
                             "ProcessingGrass7AlgorithmsRasterTestPt2"
                             "ProcessingGrass7AlgorithmsVectorTest"
                             "test_core_authmanager"
                             "test_core_compositionconverter"
                             "test_core_expression"
                             "test_core_gdalutils"
                             "test_core_labelingengine"
                             "test_core_layoutpicture"
                             "test_core_layouttable"
                             "test_core_pointcloudlayerexporter"
                             "test_core_projectstorage"
                             "test_core_coordinatereferencesystem"
                             "test_gui_queryresultwidget"
                             "test_provider_copcprovider"
                             "test_provider_eptprovider"
                             "test_analysis_processingalgspt1"
                             "test_analysis_processingalgspt2"
                             "test_analysis_processing"
                             "test_app_gpsintegration"
                             "PyQgsAnnotation"
                             "PyQgsAuthenticationSystem"
                             "PyQgsConnectionRegistry"
                             "PyQgsDatumTransform"
                             "PyQgsFileUtils"
                             "PyQgsGeometryTest"
                             "PyQgsGoogleMapsGeocoder"
                             "PyQgsGroupLayer"
                             "PyQgsHashLineSymbolLayer"
                             "PyQgsLayerMetadataProviderPython"
                             "PyQgsLayoutHtml"
                             "PyQgsLineSymbolLayers"
                             "PyQgsMapLayer"
                             "PyQgsOGRProviderGpkg"
                             "PyQgsProcessExecutablePt1"
                             "PyQgsProcessExecutablePt2"
                             "PyQgsProviderConnectionGpkg"
                             "PyQgsProviderConnectionSpatialite"
                             "PyQgsOGRProvider"
                             "PyQgsSettingsTreeNode"
                             "PyQgsTextRenderer"
                             "PyQgsVectorFileWriter"
                             "PyQgsVectorLayerEditBuffer"
                             "PyQgsVirtualLayerProvider"
                             "PyQgsAuxiliaryStorage"
                             "PyQgsSelectiveMasking"
                             "qgis_sipify"
                             "qgis_sip_include"
                             "qgis_sip_uptodate")
                           "|")))))
         (add-after 'install 'wrap-python
           (assoc-ref python:%standard-phases 'wrap))
         (add-after 'wrap-python 'wrap-qt
           (lambda* (#:key outputs inputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (wrap-qt-program "qgis" #:output out #:inputs inputs))))
         (add-after 'wrap-qt 'wrap-gis
           (lambda* (#:key inputs outputs #:allow-other-keys)
             ;; TODO: Find if there is a way to get SAGA to work.
             ;; Currently QGIS says "version of SAGA not supported".
             ;; Disable it for now.
             (let* ((out (assoc-ref outputs "out"))
                    ;;(saga (string-append (assoc-ref inputs "saga") "/bin"))
                    (grass-version ,(package-version grass))
                    (grass-majorminor (string-join
                                       (list-head
                                        (string-split grass-version #\.) 2)
                                       ""))
                    (grass (string-append (assoc-ref inputs "grass")
                                          "/grass" grass-majorminor)))
               (wrap-program (string-append out "/bin/qgis")
                 ;;`("PATH" ":" prefix (,saga))
                 `("QGIS_PREFIX_PATH" = (,out))
                 `("GISBASE" = (,grass)))))))))
    (inputs
     (list bash-minimal
           exiv2
           expat
           gdal
           geos
           gpsbabel
           grass
           gsl
           hdf5
           libspatialindex
           libspatialite
           libxml2
           libzip
           netcdf
           postgresql
           proj
           protobuf
           python
           python-chardet
           python-dateutil
           python-future
           python-jinja2
           python-numpy
           python-owslib
           python-psycopg2
           python-pygments
           python-pyqt+qscintilla
           python-pytz
           python-pyyaml
           python-requests
           python-sip
           python-six
           python-urllib3
           qca
           qscintilla
           qtbase-5
           qtdeclarative-5
           qtkeychain
           qtlocation
           qtmultimedia-5
           qtserialport
           qtsvg-5
           qwt
           ;; saga
           sqlite
           (list zstd "lib")))
    (native-inputs
     (append
       (list bison
             flex
             perl
             perl-yaml-tiny
             pkg-config
             python-mock
             python-nose2
             python-pyqt-builder
             qttools-5)
       (if (supported-package? shellcheck)
         (list shellcheck)
         '())
       (list xorg-server-for-tests)))
    (home-page "https://qgis.org")
    (synopsis "Geographical information system")
    (description "QGIS is an easy to use Geographical Information
System (GIS).  It is a GIS data viewer and editor.  QGIS supports a number of
raster and vector data formats, with new support easily added using the plugin
architecture.")
    (license
     (list
      license:asl1.1
      license:asl2.0
      license:bsd-2
      license:bsd-3
      license:boost1.0
      license:cc-by3.0
      license:cc-by4.0
      license:cc-by-sa3.0
      license:cc-by-sa4.0
      (license:fsdg-compatible "https://www.deviantart.com/elvensword")
      (license:fsf-free "file://debian/copyright" "Go Squared")
      license:expat
      license:fdl1.2+
      (license:fsf-free
       "https://www.deviantart.com/webgoddess/art/Reddish-Inspired-Gradients-42208824")
      (license:fsf-free
       "file://debian/copyright"
       "QT-Commercial or LGPL-2.1 with Digia Qt LGPL Exception 1.1 or GPL-3")
      license:gpl2
      license:gpl2+
      license:gpl3
      license:gpl3+
      license:isc
      license:lgpl2.0+
      license:lgpl2.1
      license:lgpl2.1+
      license:lgpl3
      (license:non-copyleft "file://debian/copyright" "BSD-like-gist")
      (license:non-copyleft "file://debian/copyright" "Jim Mossman Attribution")
      (license:non-copyleft
       "https://www.ncl.ucar.edu/Download/NCL_source_license.shtml"
       "NCL Source Code License")
      license:ogl-psi1.0
      license:opl1.0+
      license:public-domain
      license:qwt1.0))))

(define-public splat
  (package
    (name "splat")
    (version "1.5.0b3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoche/splat")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10djwjwb1pvznr0fjwnxdm5d961f3yngispb4zj9hyzdgq1xh217"))
       (modules '((guix build utils)))
       (snippet
        '(begin
           ;; Delete pre-compiled libraries.
           (delete-file-recursively "vstudio")))))
    (build-system gnu-build-system)
    (inputs
     (list bzip2 libjpeg-turbo libpng zlib))
    (arguments
     (list #:tests? #f ; No test suite.
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'fix-installation-scripts
                 (lambda _
                   (substitute* (list "install" "utils/install")
                     (("/usr/local")
                      #$output)
                     (("whoami=`whoami`")
                      "whoami=root"))))
               (delete 'configure)
               (add-before 'install 'create-bin-directory
                 (lambda _
                   (mkdir-p (string-append #$output "/bin")))))))
    (synopsis "Signal propagation and coverage analysis tool")
    (description
     "The SPLAT (Signal Propagation, Loss, And Terrain) program can use the
Longley-Rice path loss and coverage prediction using the Irregular Terrain
Model to predict the behaviour and reliability of radio links, and to predict
path loss.")
    (home-page "https://www.qsl.net/kd2bd/splat.html")
    (license license:gpl2+)))

(define-public python-geographiclib
  (package
    (name "python-geographiclib")
    (version "1.50")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "geographiclib" version))
        (sha256
         (base32
          "0cn6ap5fkh3mkfa57l5b44z3gvz7j6lpmc9rl4g2jny2gvp4dg8j"))))
    (build-system python-build-system)
    (home-page "https://geographiclib.sourceforge.io/1.50/python/")
    (synopsis "Python geodesic routines from GeographicLib")
    (description
     "This is a python implementation of the geodesic routines in GeographicLib.")
    (license license:expat)))

(define-public python-geopy
  (package
    (name "python-geopy")
    (version "2.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "geopy" version))
        (sha256
         (base32
          "0fx0cv0kgbvynpmjgsvq2fpsyngd5idiscdn8pd5201f1ngii3mq"))))
    (build-system python-build-system)
    (propagated-inputs
     (list python-geographiclib))
    (native-inputs
     (list python-async-generator
           python-coverage
           python-flake8
           python-isort
           python-pytest
           python-pytest-aiohttp
           python-readme-renderer
           python-pytz))
    (home-page "https://github.com/geopy/geopy")
    (synopsis "Geocoding library for Python")
    (description "@code{geopy} is a Python client for several popular geocoding
web services.  @code{geopy} makes it easy for Python developers to locate the
coordinates of addresses, cities, countries, and landmarks across the globe
using third-party geocoders and other data sources.")
    (license license:expat)))

(define-public python-haversine
  (package
    (name "python-haversine")
    (version "2.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    ;; There are no tests in the PyPi archive.
                    (url "https://github.com/mapado/haversine")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0inxyj5n4jzgg5xiadqx9sk83gdx5ff989l9s04smdzbd3b8c0c8"))))
    (build-system python-build-system)
    (native-inputs (list python-pytest python-numpy))
    (arguments
      (list #:phases
            #~(modify-phases %standard-phases
                (replace 'check
                  (lambda* (#:key tests? inputs #:allow-other-keys)
                    (when tests?
                      (invoke "pytest")))))))
    (home-page "https://github.com/mapado/haversine")
    (synopsis "Calculate the distance between 2 points on Earth")
    (description "This package provides functions to calculate the
distance in various units between two points on Earth using their
latitude and longitude.")
    (license license:expat)))

(define-public gplates
  (package
    (name "gplates")
    ;; Note: use a pre-release to cope with newer Boost, ref
    ;; https://discourse.gplates.org/t/compilation-error-with-boost-1-77/452/3
    (version "2.3.01-beta.3")
    (source (origin
              (method url-fetch)
              (uri "https://cloudstor.aarnet.edu.au/plus/s\
/ojsYNOyUYE3evNp/download?path=%2F&files=gplates_2.3.1-beta.3_src.zip")
              (file-name (string-append name "-" version ".zip"))
              (sha256
               (base32
                "06i87dfab0cq9gdi5mh6sf9wigawpp0d05zbyslv910443i26gwv"))))
    (build-system cmake-build-system)
    (arguments
     `(#:configure-flags (list "-DBoost_NO_BOOST_CMAKE=ON")
       #:tests? #f))                    ;no test target
    (native-inputs
     (list unzip))                      ;for the beta
    (inputs
     (list boost
           cgal
           curl
           gdal
           glew
           glu
           gmp
           mesa
           mpfr
           proj
           python-3
           python-numpy
           qtbase-5
           qtsvg-5
           qtxmlpatterns
           qwt
           zlib))
    (home-page "https://www.gplates.org")
    (synopsis "Plate tectonics simulation program")
    (description "GPlates is a plate tectonics program.  Manipulate
reconstructions of geological and paleogeographic features through geological
time.  Interactively visualize vector, raster and volume data.")
    (license license:gpl2+)))

(define-public navit
  (package
    (name "navit")
    (version "0.5.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/navit-gps/navit")
                    (commit (string-append "v" version))))
              (sha256
               (base32
                "1jhlif0sc5m8wqb5j985g1xba2ki7b7mm14pkvzdghjd0q0gf15s"))
              (file-name (git-file-name name version))))
    (build-system cmake-build-system)
    (arguments
     (list
      ;; There are no tests
      #:tests? #f
      ;; With -DSAMPLE_MAP=TRUE (the default), it tries to download a
      ;; map during the build process.
      #:configure-flags #~(list "-DSAMPLE_MAP=FALSE")
      #:phases
      #~(modify-phases %standard-phases
          (add-after
              'unpack 'patch-navit-config
            (lambda _
              ;; For now this package only supports SDL, so if we keep
              ;; the configuration as-is, Navit doesn't start.
              (substitute*
                  "navit/navit_shipped.xml"
                (("<graphics type=\"gtk_drawing_area\"/>")
                 "<graphics type=\"sdl\"/>"))
              ;; Users are expected to be able to add XML files inside
              ;; $NAVIT_SHAREDIR, however that directory is in the store.
              (substitute*
                  "navit/navit_shipped.xml"
                (("<xi:include href=\"\\$NAVIT_SHAREDIR/maps/\\*\\.xml\"/>")
                 "<xi:include href=\"$NAVIT_USER_DATADIR/maps/*.xml\"/>"))
              ;; Navit also works without GPS but in that case there is
              ;; no automatic zooming, so we need zoom buttons to be able
              ;; to manually zoom in or out.
              (substitute*
                  "navit/navit_shipped.xml"
                (((string-append
                   "<osd enabled=\"no\" type=\"button\" x=\"-96\" y=\"-96\" "
                   "command=\"zoom_in()"))
                 (string-append
                  "<osd enabled=\"yes\" type=\"button\" x=\"-96\" y=\"-96\" "
                  "command=\"zoom_in()"))
                (((string-append
                   "<osd enabled=\"no\" type=\"button\" x=\"0\" y=\"-96\" "
                   "command=\"zoom_out()"))
                 (string-append
                  "<osd enabled=\"yes\" type=\"button\" x=\"0\" y=\"-96\" "
                  "command=\"zoom_out()\" src=\"zoom_out.png\"/>")))))
          (add-before
              'build 'set-cache
            ;; During the build, svg icons are converted in different
            ;; formats, and this needs XDG_CACHE_HOME to work.
            (lambda _
              (setenv "XDG_CACHE_HOME" "/tmp/xdg-cache"))))))
    (inputs (list dbus-glib
                  espeak
                  freeglut
                  freeimage
                  freetype
                  glib
                  gettext-minimal
                  gpsd
                  gdk-pixbuf
                  imlib2
                  python
                  sdl
                  sdl-image))
    (native-inputs (list fontconfig
                         (librsvg-for-system)
                         pkg-config))
    (home-page "https://www.navit-project.org")
    (synopsis "Car navigation system with routing engine that uses vector maps data")
    (description "Navit is a car navigation system with a routing engine.

It is meant to work with touchscreen devices, but it also works
without a touchscreen.  It also supports text to speech.

It can be configured extensively through its own configuration file
format.  For instance we can configure the graphical interface, and
which map data is to be displayed at which zoom level.

It supports different routing profiles: bike, car, car_avoid_toll,
car_pedantic, car_shortest, horse, pedestrian, truck.

It can use gpsd or NMEA GPS directly to get position data.  It also
works without GPS: in this case users can also enter position data
directly.

It can also be used to log GPS data to files using the GPX or NMEA
formats, or to replay NMEA data.

For maps, it can uses its own \"binfile\" map format, or Garmin map
file format, and data from OpenStreetMap, Garmin maps, Marco Polo
Grosser Reiseplaner, Routeplaner Europa 2007, Map + Route.")
    (license license:gpl2)))
