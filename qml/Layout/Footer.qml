import QtQuick 2.0

Rectangle {
    id: root

    height: root.height
    width: root.width

    border.color: "Red"
    border.width: 1
    Text {
        id: name1
        text: "底部"
        anchors.centerIn: parent
    }
}
