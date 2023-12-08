import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4

Button{
    property alias buttonText: label.text
    property int value
    property alias buttonColor: rectButton.color

    width: 150
    height: 150
    hoverEnabled: true

    Text {
        id: label
        text: buttonText.text
        anchors.centerIn: parent
        font.pointSize: 15
    }

    background: Rectangle {
        id: rectButton
        width: parent.width
        height: parent.height
        radius: 15
        color: parent.down ? "#33ccff" :
                             (parent.hovered ? "#00ffff" : "#66ffff")
    }

    onClicked: {
        clickedEvent(value);
    }

    function clickedEvent(state){
        if(state === 1){
            Car.controlcar(1)
            console.log("Car move forward")
        }
        else if(state === -1){
            Car.controlcar(-1)
            console.log("Car move backward")
        }
        else if(state === 0){
            Car.controlcar(0)
            console.log("Car stop")
        }
        else if(state === 2){
            Car.controlcar(2)
            console.log("Car move right")
        }
        else if(state === 3){
            Car.controlcar(3)
            console.log("Car move left")
        }
        else {
            console.log("Invalid param")
        }
    }
}

