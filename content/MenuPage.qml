import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    width: parent ? parent.width : 800
    height: parent ? parent.height : 600

    Rectangle { anchors.fill: parent; color: "#ffffff" }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 12
        width: parent ? parent.width * 0.6 : 480

        Text { text: "Main Menu"; font.pointSize: 20; horizontalAlignment: Text.AlignHCenter; Layout.alignment: Qt.AlignHCenter }

        Button { text: "User Menu"; Layout.minimumWidth: 240; onClicked: root.parent.stack.push(Qt.resolvedUrl("qrc:/qt/qml/trial1/content/PlaceholderPage.qml"), { title: "User Menu", parentWindow: root.parent }) }
        Button { text: "Test Menu"; Layout.minimumWidth: 240; onClicked: root.parent.stack.push(Qt.resolvedUrl("qrc:/qt/qml/trial1/content/PlaceholderPage.qml"), { title: "Test Menu", parentWindow: root.parent }) }
        Button { text: "USB Menu"; Layout.minimumWidth: 240; onClicked: root.parent.stack.push(Qt.resolvedUrl("qrc:/qt/qml/trial1/content/PlaceholderPage.qml"), { title: "USB Menu", parentWindow: root.parent }) }
        Button { text: "GPS Simulation"; Layout.minimumWidth: 240; onClicked: root.parent.stack.push(Qt.resolvedUrl("qrc:/qt/qml/trial1/content/PlaceholderPage.qml"), { title: "GPS Simulation", parentWindow: root.parent }) }

    }
}
