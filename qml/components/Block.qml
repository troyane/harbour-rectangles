// Block.qml

import QtQuick 2.2
import Sailfish.Silica 1.0
import QtGraphicalEffects 1.0

Item {
    id: blockItem
    property int animationTime: 200
    property color currentColor: "red"
    property color newColor: "transparent"
    property int size: 10

    function randomColor() {
        return Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
    }

    width: size * 0.9
    height: size * 0.9

    Item {
        id: block
        anchors {
            centerIn: parent
        }
        width: parent.width
        height: parent.height

        Rectangle {
            id: mask
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            radius: blockItem.width / 4
            clip: true
            visible: false
        }

        Image {
            id: back
            source: "qrc:/imgs/thatch.png"
            anchors.centerIn: parent
            width: parent.width
            height: parent.height

            fillMode: Image.PreserveAspectCrop
            visible: false
            rotation: Math.random(100)
        }

        OpacityMask {
            // Used here to make round borders of image.
            id: maskResult
            anchors.fill: mask
            source: back
            maskSource: mask
        }

        ColorOverlay {
            // Overlay a 50% transparent color over image.
            anchors.fill: maskResult
            source: maskResult
            color: {
                var col = blockItem.currentColor
                var newCol = Qt.rgba(col.r, col.g, col.b, 0.5)
                return newCol
            }
        }
    }

    ParallelAnimation {
        id: fadeOutAnimation
        loops: 1
        running: false

        RotationAnimation {
            target: block
            // Dirty hack according to QTBUG-22141
            property: "rotation"
            duration: blockItem.animationTime
            direction: RotationAnimation.Counterclockwise
            from: 0
            to: 180
        }
        PropertyAnimation {
            target: block
            properties: "width,height"
            duration: blockItem.animationTime
            from: blockItem.size * 0.9
            to: 0
        }

        onStopped: {
            // Toggle color
            blockItem.currentColor = blockItem.newColor
            fadeInAnimation.start()
        }
    }

    ParallelAnimation {
        id: fadeInAnimation
        loops: 1
        running: false

        RotationAnimation {
            target: block
            // Dirty hack according to QTBUG-22141
            property: "rotation"
            duration: blockItem.animationTime
            direction: RotationAnimation.Clockwise
            from: 0
            to: 180
        }
        PropertyAnimation {
            target: block
            properties: "width,height"
            duration: blockItem.animationTime
            from: 0
            to: blockItem.size * 0.9
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            // Start fadeOutAnimation, after its end it will trigger color change
            // and start fadeInAnimation
            fadeOutAnimation.start()
        }
    }
}
