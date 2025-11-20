import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    width: parent ? parent.width : 800
    height: parent ? parent.height : 600

    Rectangle {
        anchors.fill: parent
        color: "#ffffff"
    }

    ColumnLayout {
        anchors.centerIn: parent
        anchors.margins: 24
        spacing: 20
        width: parent ? parent.width * 0.9 : 720

        Text {
            id: warningText
            text: "FogPASS is only a non-fail safe aid. LP to follow extant operating procedures. Press ENTER"
            font.pointSize: 18
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        Button {
            id: enterBtn
            text: "Enter"
            Layout.alignment: Qt.AlignHCenter
            Layout.minimumWidth: 140
            onClicked: {
                if (root.parent && root.parent.stack) {
                    root.parent.stack.push(Qt.resolvedUrl("qrc:/qt/qml/trial1/content/MenuPage.qml"), { parentWindow: root.parent })
                }
            }
        }
    }
}
