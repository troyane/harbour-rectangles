// FirstPage.qml

import QtQuick 2.2
import Sailfish.Silica 1.0

import "../components"

Page {
    id: page

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        id: flickable
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("About")
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge

            PageHeader {
                title: qsTr("Rectangles")
            }

            GridView {
                id: grid
                property int blockSize: Math.floor(Theme.paddingLarge * 2)

                x: Theme.paddingLarge
                width: page.width - 2 * Theme.paddingLarge
                height: page.width - 2 * Theme.paddingLarge
                cellWidth: blockSize
                cellHeight: blockSize

                delegate: Block {
                    id: block
                    size: grid.blockSize
                    currentColor: block.randomColor()
                    newColor: block.randomColor()
                }

                Component.onCompleted: {
                    var rowItems = Math.floor( grid.width / blockSize )
                    model = rowItems * rowItems
                    print(rowItems, model)
                }
            } // grid
        } // column
    } // flickable
} // page


