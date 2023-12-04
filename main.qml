import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

Window {
    width: Screen.width
    height: Screen.height
    visible: true
    title: qsTr("Control Car")


    Column{
        anchors.centerIn: parent
        spacing: 10
        id: culumnButton

        Button{
            id: forward
            text: "FORWARD"
            onClicked: {
                controller.controlcar(1)
                console.log("forward")
            }
        }
        Button{
            id: backward
            text: "BACKWARD"
            onClicked: {
                controller.controlcar(-1)
                console.log("backward")
            }
        }
        Button{
            id: stop
            text: "STOP"
            onClicked: {
                controller.controlcar(0)
                console.log("stop")
            }
        }
        Button{
            id: right
            text: "RIGHT"
            onClicked: {
                controller.controlcar(2)
                console.log("right")
            }
        }
        Button{
            id: left
            text: "LEFT"
            onClicked: {
                controller.controlcar(3)
                console.log("left")
            }
        }

        Slider{
            id:spinboxID
            from: 0
            to: 255
            onValueChanged: {
                console.log("Speed: " + value)
            }
        }

        Text {
            id: spinboxvaluedisplay
            text: Math.floor(spinboxID.value)
        }
        Button{
            text: " Set car power"
            onClicked: {
                console.log("Speed: " + spinboxID.value)
                controller.setPower(Math.floor(spinboxID.value))
            }
        }
    }



}
