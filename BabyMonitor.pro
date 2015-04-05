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
TARGET = BabyMonitor

CONFIG += sailfishapp

SOURCES += src/BabyMonitor.cpp \
    src/soundanalyzer.cpp

OTHER_FILES += qml/BabyMonitor.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/BabyMonitor.changes.in \
    rpm/BabyMonitor.spec \
    rpm/BabyMonitor.yaml \
    translations/*.ts \
    BabyMonitor.desktop \
    qml/script/functions.js

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/BabyMonitor-de.ts

QT += dbus multimedia

PKGCONFIG += libpulse

HEADERS += \
    src/soundanalyzer.h
