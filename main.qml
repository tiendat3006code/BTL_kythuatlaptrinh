import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        id: rect_1
        width: 200
        height: 200
        anchors.centerIn: parent
        color: "red"
        radius : width

        MouseArea {
            id: mouseArea
            width: 100
            height: 100
            anchors.fill: parent

            onPressed: rect_1.color = "blue"
            onReleased: rect_1.color = "red"
        }

    }
}
