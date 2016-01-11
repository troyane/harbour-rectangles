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
TARGET = harbour-rectangles

CONFIG += sailfishapp

SOURCES += \
    src/harbour-rectangles.cpp

lupdate_only {
    SOURCES += \
    $$PWD/qml/*.qml \
    $$PWD/qml/pages/*.qml \
    $$PWD/qml/cover/*.qml \
    $$PWD/qml/components/*.qml
}

OTHER_FILES += \
    qml/harbour-rectangles.qml \
    qml/pages/AboutPage.qml \
    qml/pages/FirstPage.qml \
    qml/cover/CoverPage.qml \
    qml/components/Block.qml \
    rpm/harbour-rectangles.changes.in \
    rpm/harbour-rectangles.spec \
    rpm/harbour-rectangles.yaml \
    translations/*.ts \
    harbour-rectangles.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# To disable building translations every time, comment out the following CONFIG line
#CONFIG += sailfishapp_i18n
#TRANSLATIONS += \
#    translations/harbour-rectangles-uk.ts \
#    translations/harbour-rectangles-en.ts \
#    translations/harbour-rectangles-ru.ts

RESOURCES += \
    resources.qrc
