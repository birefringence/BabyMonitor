# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-babymonitor

CONFIG += sailfishapp

SOURCES += \
    src/soundanalyzer.cpp \
    src/harbour-babymonitor.cpp \
    src/appsettings.cpp

OTHER_FILES += \
    qml/cover/CoverPage.qml \
    translations/*.ts \
    qml/script/functions.js \
    harbour-babymonitor.desktop \
    rpm/harbour-babymonitor.yaml \
    rpm/harbour-babymonitor.spec \
    rpm/harbour-babymonitor.changes.in \
    qml/harbour-babymonitor.qml \
    qml/pages/AboutPage.qml \
    qml/pages/MainPage.qml \
    LICENSE \
    README.md \
    qml/script/defaults.js

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/harbour-babymonitor-de.ts \
    translations/harbour-babymonitor-fr.ts \
    translations/harbour-babymonitor-zh_CN.ts

QT += dbus multimedia

PKGCONFIG += libpulse

HEADERS += \
    src/soundanalyzer.h \
    src/appsettings.h
