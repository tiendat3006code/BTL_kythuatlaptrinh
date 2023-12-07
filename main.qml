import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Window {
    width: Screen.width
    height: Screen.height
    visible: true
    title: qsTr("Control Car")
    color: "black"
    id: root
    // visibility: Window.FullScreen

    property int power: Math.floor(powerSlider.value)

    Rectangle{
        width: 600
        height: 600
        color: "black"
        x: 50
        y: 50
        CircularGauge{
            id: speedGauge
            anchors.fill: parent
            minimumValue: 0
            maximumValue: 255
            value: power

            Text {
                id: powerText
                anchors.horizontalCenter: speedGauge.horizontalCenter
                anchors.bottom: parent.bottom
                text: "Power: " + Math.floor(power/255*100) + " %"
                font.pointSize: 25
                color: "white"
            }
        }
    }
    Rectangle{
        // anchors.horizontalCenter: root.horizontalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height - height - 100
        width: 400
        height: 30
        color: "black"
        id: powerRect
        Slider{
            from: 0
            to: 255
            stepSize: 5
            focus: true
            id: powerSlider
            anchors.fill: parent
            Keys.onUpPressed: {
                console.log("up key pressed")
                value + 5
            }
            Keys.onDownPressed: {
                console.log("down key pressed")
                value - 5
            }
            Keys.onEnterPressed: control.setPower(power)
            onValueChanged: {
                console.log(value)
            }
        }
    }

    Button{
        id: setPowerButton
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height - powerRect.height - 50
        text: "SET POWER"
        onClicked: {
            control.setPower(power)
        }
    }

}
