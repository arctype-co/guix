(define-module (gnu packages nextcloud)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages tls)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:select (gpl2))
  #:use-module (guix utils))

(define disable-dbus-add-activation-service-patch
  ; This macro attemps to install a systemd unit file to an illegal location. Disable it.
  (plain-file "disable-dbus-add-activation-service.patch"
  "diff --git a/shell_integration/libcloudproviders/CMakeLists.txt b/shell_integration/libcloudproviders/CMakeLists.txt
index 45c8b0f32..828b38ff1 100644
--- a/shell_integration/libcloudproviders/CMakeLists.txt
+++ b/shell_integration/libcloudproviders/CMakeLists.txt
@@ -53,6 +53,5 @@ IF (UNIX AND Qt5DBus_FOUND AND LIBCLOUDPROVIDERS_FOUND)
     set(LIBCLOUDPROVIDERS_DBUS_BUS_NAME \"${DBUS_PREFIX}.${DBUS_VENDOR}.${DBUS_APPLICATION_NAME}\")
     set(LIBCLOUDPROVIDERS_DBUS_OBJECT_PATH \"/${DBUS_PREFIX}/${DBUS_VENDOR}/${DBUS_APPLICATION_NAME}\")
 
-    dbus_add_activation_service(org.freedesktop.CloudProviders.service.in)
     libcloudproviders_add_config(org.freedesktop.CloudProviders.ini.in)
 ENDIF ()"))

; Runtime needs QTWEBENGINEPROCESS_PATH=(string-append qtwebengine "/lib/qt5/libexec/QtWebEngineProcess")

(define nextcloud-desktop
  (package
    (name "nextcloud-desktop")
    (version "3.1.3")
    (source
      (origin
	      (method git-fetch)
	      (uri (git-reference
		     (url "https://github.com/nextcloud/desktop")
		     (commit (string-append "v" version))))
	      (sha256 (base32 "15ymk3gvfmgwzmqbhlw7jjy9y65ib3391h1dlmpll65iaj2miajk"))
        (patches (list disable-dbus-add-activation-service-patch))))
    (build-system cmake-build-system)
    ;; pending https://github.com/nextcloud/desktop/pull/2886
    ;; for INOTIFY warnings
    (inputs
      `(("dbus" ,dbus)
        ("doxygen" ,doxygen)
        ("glib" ,glib)
        ("glibc" ,glibc)
        ("graphviz" ,graphviz)
        ("libcloudproviders" ,libcloudproviders)
        ("openssl" ,openssl)
        ("pkg-config" ,pkg-config)
        ("qtbase" ,qtbase)
        ("qtdeclarative" ,qtdeclarative)
        ("qtkeychain" ,qtkeychain)
        ("qtquickcontrols2" ,qtquickcontrols2)
        ("qttools" ,qttools)
        ("qtsvg" ,qtsvg)
        ("qtwebchannel" ,qtwebchannel)
        ("qtwebengine" ,qtwebengine)
        ("qtwebkit" ,qtwebkit)
        ("qtwebsockets" ,qtwebsockets)
        ("sqlite" ,sqlite)
        ("texlive" ,texlive)
        ("zlib" ,zlib)))
    (arguments
      '(#:configure-flags 
        `("-DNO_SHIBBOLETH=True")
        #:tests? #f))
    (home-page "https://nextcloud.com")
    (synopsis "Nextcloud Desktop Client")
    (description "The computer Nextcloud Desktop Client is a tool to synchronize files from Nextcloud Server with your computer.")
    (license gpl2)))

nextcloud-desktop
