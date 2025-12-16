import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    width: parent ? parent.width : 800
    height: parent ? parent.height : 600

    property string title: "Placeholder"
    property var parentWindow: null

    Rectangle { anchors.fill: parent; color: "#ffffff" }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 16
        width: parent ? parent.width * 0.8 : 640

        Text { text: title; font.pointSize: 22; horizontalAlignment: Text.AlignHCenter; Layout.alignment: Qt.AlignHCenter }

        Text { text: "This is a placeholder page for " + title; wrapMode: Text.WordWrap }

        RowLayout { Layout.alignment: Qt.AlignHCenter; spacing: 12;
            Button { text: "Back"; onClicked: if (parentWindow) parentWindow.stack.pop() }
        }
    }
}
