// AboutPage.qml

import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    id: page

    SilicaFlickable {
        id: flickable
        anchors.fill: parent
        contentHeight: column.height
        Column {
            id: column
            width: page.width
            spacing: Theme.paddingMedium

            PageHeader { title: qsTr("About Rectangles") }
            DetailItem { label: qsTr("Version"); value: qsTr("Under development") }
            DetailItem { label: qsTr("Author"); value: qsTr("Gerasymchuk Nazar") }

            Label {
                x: Theme.paddingLarge
                width: page.width - 2*Theme.paddingLarge
                textFormat: Text.RichText
                color: Theme.highlightColor
                wrapMode: Text.WordWrap
                font {
                    pixelSize: Theme.fontSizeMedium
                    family: Theme.fontFamily
                }
                text: qsTr("<b>Rectangles</b> is a simple game where you have
to find and select four blocks of the same color which are the rectangle's corners.
<br/><br/>
Try to find bigger rectangles to get more points.
<br/><br/>
Have fun!
<br/><br/>
<small><b>Application repository:</b> <a href=\"https://github.com/troyane/harbour-rectangles\">
troyane/harbour-rectangles on GitHub</a></small>")
                onLinkActivated: {
                    console.log(link + " link activated")
                    Qt.openUrlExternally(link)
                }
            }
        } // column
    } // flickable
} // page
