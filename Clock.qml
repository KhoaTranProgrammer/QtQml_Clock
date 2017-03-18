import QtQuick 2.0

Item {
    id: id_root

    property color color: "#F4FF81"

    property int hours: currentDate.getHours()
    property int minutes: currentDate.getMinutes()
    property int seconds: currentDate.getSeconds()
    property var currentDate: new Date()

    Timer {
        id: timer
        repeat: true
        interval: 1000
        running: true

        onTriggered: id_root.currentDate = new Date()
    }

    Rectangle {
        id: id_plate

        anchors.centerIn: parent
        height: Math.min(id_root.width, id_root.height)
        width: height
        radius: width/2
        color: id_root.color
        border.color: "gold"
        border.width: 4

        Repeater {
            model: 12

            Item {
                id: hourContainer

                property int hour: index
                height: id_plate.height/2
                transformOrigin: Item.Bottom
                rotation: index * 30
                x: id_plate.width/2
                y: 0

                Rectangle {
                    height: id_plate.height*0.05
                    width: height
                    radius: width/2
                    color: "black"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 4
                }

                Text {
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                    }
                    x: 0
                    y: id_plate.height*0.06
                    rotation: 360 - index * 30
                    text: hourContainer.hour == 0 ? 12 : hourContainer.hour
                    font.pixelSize: id_plate.height*0.1
                    font.family: "Comic Sans MS"
                }
            }
        }
    }

    Rectangle {
        id: id_center

        anchors.centerIn: parent
        height: id_plate.height*0.05
        width: height
        radius: width/2
        color: "gold"
    }

    SecondNeedle {
        anchors {
            top: id_plate.top
            bottom: id_plate.bottom
            horizontalCenter: parent.horizontalCenter
        }
        value: id_root.seconds
    }

    MinuteNeedle {
        anchors {
            top: id_plate.top
            bottom: id_plate.bottom
            horizontalCenter: parent.horizontalCenter
        }
        value: id_root.minutes
    }

    HourNeedle {
        anchors {
            top: id_plate.top
            bottom: id_plate.bottom
            horizontalCenter: parent.horizontalCenter
        }
        value: id_root.hours
        valueminute: id_root.minutes
    }
}
