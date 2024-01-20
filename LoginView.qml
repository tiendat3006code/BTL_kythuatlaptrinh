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
        color: "transparent"
        Image {
            id: backGround
            source: "qrc:/wall.jpg"
            anchors.fill: parent
        }
        Rectangle{
            x: 10
            y: 10
            width: 250
            height: 350
            color: "transparent"
            Image {
                id: logoImg
                source: "qrc:/logo.png"
                anchors.fill: parent
            }
        }

        Label{
            anchors.horizontalCenter: parent.horizontalCenter
            y: 50
            text: "TRƯỜNG CƠ KHÍ"
            font.pointSize: 40
            font.bold: true
            color: "white"
        }

        Label{
            anchors.horizontalCenter: parent.horizontalCenter
            y: 100
            text: "ĐẠI HỌC BÁCH KHOA HÀ NỘI"
            font.pointSize: 40
            font.bold: true
            color: "white"
        }

        Label{
            anchors.horizontalCenter: parent.horizontalCenter
            y: 200
            text: "ME3213 - Kỹ thuật lập trình trong cơ điện tử"
            font.pointSize: 40
            font.bold: false
            color: "white"
        }

        Label{
            anchors.horizontalCenter: parent.horizontalCenter
            y: 300
            text: "Đề tài: Xe điều khiển bằng bluetooth và quan trắc môi trường"
            font.pointSize: 35
            font.bold: false
            color: "white"
        }


        Rectangle{
            id: rectNameID
            width: 600
            height: 200
            y: 400
            color: "transparent"
            anchors.horizontalCenter: parent.horizontalCenter
            Label{
                id: nameLabel
                text: "Nhóm sinh viên thực hiện:"
                font.pointSize: 30
                anchors.left: parent.left
                color: "white"
            }

            Text {
                id: tienDat
                text: "1) Cao Tiến Đạt     - 20194940"
                anchors.left: parent.left
                anchors.top: nameLabel.bottom
                font.pointSize: 30
                color: "white"
            }
            Text {
                id: vanLoc
                text: "2) Phạm Văn Lộc   - 20195072"
                anchors.left: parent.left
                anchors.top: tienDat.bottom
                font.pointSize: 30
                color: "white"
            }
            Text {
                id: anhDuong
                text: "3) Nguyễn Ánh Dương - 20194981"
                anchors.left: parent.left
                anchors.top: vanLoc.bottom
                font.pointSize: 30
                color: "white"
            }
        }

        Rectangle{
            anchors.horizontalCenter: parent.horizontalCenter
            y: 630
            width: 880
            height: 50
            color: "transparent"
            Text {
                id: gvText
                text: "Giảng viên hướng dẫn: TS.Nguyễn Xuân Thuận"
                font.pointSize: 30
                anchors.fill: parent
                color: "white"
            }
        }

        Rectangle{
            anchors.horizontalCenter: parent.horizontalCenter
            width: 150
            height: 150
            y: 700
            color: "transparent"
            AnimatedImage {
                anchors.fill: parent
                source: "qrc:/Frm02.gif"
                fillMode: Image.PreserveAspectCrop
                smooth: true
                // loops: Animation.Infinite
            }

            MouseArea{
                anchors.fill: parent

                Text {
                    id: buttonName
                    text: "BEGIN"
                    font.pointSize: 15
                    anchors.centerIn: parent
                    color: "white"
                }
                onClicked: {
                    Car.serialInit()
                    Car.serialRead()
                    stackView.push("ControlView.qml")
                }
            }
        }
    }
}
