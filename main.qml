import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3

ApplicationWindow {
    width: Screen.width
    height: Screen.height
    visible: true
    title: qsTr("Control Car")
    id: root
    // visibility: Window.FullScreen

    StackView {
        id: stackView
        initialItem: "LoginView.qml"
        anchors.fill: parent

        // Add transitions between pages
        pushEnter: Transition {
            PropertyAnimation { properties: "opacity"; from: 0; to: 1; duration: 500 }
        }

        popEnter: Transition {
            PropertyAnimation { properties: "opacity"; from: 0; to: 1; duration: 500 }
        }

        pushExit: Transition {
            PropertyAnimation { properties: "opacity"; from: 1; to: 0; duration: 500 }
        }

        popExit: Transition {
            PropertyAnimation { properties: "opacity"; from: 1; to: 0; duration: 500 }
        }
    }
}
