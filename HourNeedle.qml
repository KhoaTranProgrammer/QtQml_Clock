import QtQuick 2.0

Item {
    id: id_root
    property int value: 0
    property int valueminute: 0
    property int granularity: 12

    Rectangle {
        width: 2
        height: id_root.height * 0.3
        color: "blue"
        anchors {
            horizontalCenter: id_root.horizontalCenter
            bottom: id_root.verticalCenter
        }
        antialiasing: true
    }

    rotation: 360/granularity * (value%granularity) + 360/granularity * (valueminute / 60)
    antialiasing: true
}
