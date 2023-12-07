import QtQuick 2.15
import QtQuick.Window 2.15
Item {

    property alias action
    Rectangle{
        width: 50
        height: 50

        MouseArea{
            anchors.fill: parent
        }
    }
}
