import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3


Item {
    property int power: Math.floor(powerSlider.value)
    property bool leftStatus: false
    property bool rightStatus: false
    anchors.fill: parent
    Rectangle{
        width: parent.width
        height: parent.height
        color: "black"
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

                style: CircularGaugeStyle{
                    labelStepSize: 20
                }

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
            width: 600
            height: 600
            color: "black"
            x: parent.width - 650
            y: 50
            CircularGauge{
                id: sensorGauge
                anchors.fill: parent
                minimumValue: 0
                maximumValue: 1000
                // labelStepSize: 10
                style: CircularGaugeStyle{
                    labelStepSize: 100
                }

                Text {
                    id: sensorText
                    anchors.horizontalCenter: sensorGauge.horizontalCenter
                    anchors.bottom: parent.bottom
                    text: "SENSOR VALUE: " + Car.getSensorResult()
                    font.pointSize: 25
                    color: "white"

                }
                Timer{
                    interval: 100
                    running: true
                    repeat: true
                    onTriggered: {
                        sensorText.text = "Sensor value: " + Car.getSensorResult() + " ppm"
                        sensorGauge.value = Car.getSensorResult()
                    }
                }
            }
        }

        Rectangle{
            // anchors.horizontalCenter: root.horizontalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height - height - 150
            width: 500
            height: 50
            color: "black"
            id: powerRect
            Slider{
                from: 0
                to: 255
                stepSize: 5
                // focus: true
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
            y: parent.height - powerRect.height - 100
            width: 150
            height: 50
            text: "SET POWER"
            onClicked: {
                Car.setPower(power)
            }
        }

        Rectangle{
            anchors.horizontalCenter: parent.horizontalCenter
            y: 150
            width: 500
            height: 500
            color: "black"
            id: rectButton

            Keys.onPressed: {
                if(event.key === Qt.Key_W){
                    console.log("key W pressed")
                    forwardButton.clickedEvent(1)
                }
                else if(event.key === Qt.Key_S){
                    console.log("key S pressed")
                    backwardButton.clickedEvent(-1)
                }
                else if(event.key === Qt.Key_A){
                    console.log("key A pressed")
                    leftButton.clickedEvent(3)
                }
                else if(event.key === Qt.Key_D){
                    console.log("key D pressed")
                    rightButton.clickedEvent(2)
                }
            }

            Keys.onSpacePressed: {
                console.log("key SPACE pressed")
                stopButton.clickedEvent(0)
            }

            ControlButton{
                id: stopButton
                value: 0
                buttonText: "STOP"
                anchors.centerIn: parent
                onClicked: {
                    leftStatus = false
                    rightStatus = false
                    turnLeftImg.opacity = 0
                    turnRightImg.opacity = 0
                }
            }

            ControlButton{
                id: leftButton
                value: 3
                buttonText: "LEFT"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                onClicked: {
                    rightStatus = false
                    leftStatus = true
                    turnRightImg.opacity = 0
                }
            }

            ControlButton{
                id: rightButton
                value: 2
                buttonText: "RIGHT"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                onClicked: {
                    leftStatus = false
                    rightStatus = true
                    turnLeftImg.opacity = 0
                }
            }

            ControlButton{
                id: forwardButton
                value: 1
                buttonText: "FORWARD"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                onClicked: {
                    leftStatus = false
                    rightStatus = false
                    turnLeftImg.opacity = 0
                    turnRightImg.opacity = 0
                }
            }

            ControlButton{
                id: backwardButton
                value: -1
                buttonText: "BACKWARD"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                onClicked: {
                    leftStatus = false
                    rightStatus = false
                    turnLeftImg.opacity = 0
                    turnRightImg.opacity = 0
                }
            }
        }

        Rectangle{
            id: rectState
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            width: 600
            height: 100
            color: "black"

            Text {
                id: clock
                text: "Clock"
                color: "white"
                font.pointSize: 15
                anchors{
                    horizontalCenter: parent.horizontalCenter

                }
                y: 50
            }
            Text {
                id: dayInfo
                text: "Date"
                color: "white"
                font.pointSize: 15
                anchors{
                    horizontalCenter: parent.horizontalCenter
                    // centerIn: parent
                }
                y: 75 }

            Rectangle{
                width: 150
                height: 100
                anchors.left: parent.left
                color: "black"
                Image {
                    id: turnLeftImg
                    source: "qrc:/Turn_Left.png"
                    anchors.fill: parent
                    opacity: 0
                }
            }

            Rectangle{
                width: 150
                height: 100
                anchors.right: parent.right
                color: "black"
                Image {
                    id: turnRightImg
                    source: "qrc:/Turn_Right.png"
                    anchors.fill: parent
                    opacity: 0
                }
            }

            Timer {
                interval: 500
                running: true
                repeat: true

                onTriggered: {
                    var date = new Date()
                    clock.text = date.toLocaleTimeString(Qt.locale("vi_VN"), "HH:mm:ss")
                    dayInfo.text = date.toLocaleDateString(Qt.locale("vi_VN"))

                }
            }
        }

        SequentialAnimation{
            loops: Animation.Infinite
            running: leftStatus

            OpacityAnimator{
                target: turnLeftImg
                from: 0
                to: 1
                duration: 500
            }

        }

        SequentialAnimation{
            loops: Animation.Infinite
            running: rightStatus

            OpacityAnimator{
                target: turnRightImg
                from: 0
                to: 1
                duration: 500
            }
        }

        Component.onCompleted: {
            rectButton.forceActiveFocus()
        }
    }
}
