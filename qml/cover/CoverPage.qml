// CoverPage.qml

import QtQuick 2.0
import Sailfish.Silica 1.0

import "../components"

CoverBackground {
    id: cover
    anchors {
        fill: parent
        margins: Theme.paddingSmall
    }
    Column {
        GridView {
            id: grid
            x: Theme.paddingSmall
            property int blockSize: Math.floor(cover.width/4)
            width: cover.width
            height: cover.width
            cellHeight: blockSize
            cellWidth: blockSize
            model: 16
            delegate: Block {
                size: grid.blockSize
                currentColor: randomColor()
            }
        }

        Label {
            id: label
            width: cover.width
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("Rectangles")
        }
    }
}


