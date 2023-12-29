import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3

Item {

    anchors.fill: parent

    Rectangle{
        width: parent.width
        height: parent.height
        color: "#C0C0C0"
        Rectangle{
            x: 50
            y:50
            width: 250
            height: 350
            color: "#C0C0C0"
            Image {
                id: logoImg
                source: "qrc:/logo.png"
                anchors.fill: parent
            }
        }

        Label{
            anchors.horizontalCenter: parent.horizontalCenter
            y: 50
            text: "TRUONG CO KHI"
            font.pointSize: 40
            font.bold: true
        }

        Label{
            anchors.horizontalCenter: parent.horizontalCenter
            y: 100
            text: "DAI HOC BACH KHOA HA NOI"
            font.pointSize: 40
            font.bold: true
        }

        Label{
            anchors.horizontalCenter: parent.horizontalCenter
            y: 200
            text: "ME3213 - Ky thuat lap trinh trong co dien tu"
            font.pointSize: 40
            font.bold: false
        }

        Label{
            anchors.horizontalCenter: parent.horizontalCenter
            y: 300
            text: "De tai: Xe dieu khien bang bluetooth"
            font.pointSize: 35
            font.bold: false
        }


        Rectangle{
            id: rectNameID
            width: 600
            height: 200
            y: 400
            color: "#C0C0C0"
            anchors.horizontalCenter: parent.horizontalCenter
            Label{
                id: nameLabel
                text: "Nhom sinh vien thuc hien:"
                font.pointSize: 30
                anchors.left: parent.left
            }

            Text {
                id: tienDat
                text: "1) Cao Tien Dat     - 20194940"
                anchors.left: parent.left
                anchors.top: nameLabel.bottom
                font.pointSize: 30
            }
            Text {
                id: vanLoc
                text: "2) Pham Van Loc   - 20195072"
                anchors.left: parent.left
                anchors.top: tienDat.bottom
                font.pointSize: 30
            }
            Text {
                id: anhDuong
                text: "3) Nguyen Anh Duong - 20194981"
                anchors.left: parent.left
                anchors.top: vanLoc.bottom
                font.pointSize: 30
            }
        }

        Rectangle{
            anchors.horizontalCenter: parent.horizontalCenter
            y: 650
            width: 800
            height: 50
            color: "#C0C0C0"
            Text {
                id: gvText
                text: "Giang vien huong dan: TS.Nguyen Xuan Thuan"
                font.pointSize: 30
                anchors.fill: parent
            }
        }

        Button{
            anchors.horizontalCenter: parent.horizontalCenter
            width: 100
            height: 100
            y: 720
            Text {
                id: buttonName
                text: "BEGIN"
                font.pointSize: 15
                anchors.centerIn: parent
            }
            onClicked: {
                Car.serialInit()
                Car.serialRead()
                stackView.push("ControlView.qml")
                parent.color = "black"
            }
        }
    }
}
