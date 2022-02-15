import QtQuick 2.0
import Felgo 3.0

Rectangle {
    id: root
    border.width: 1
    border.color: ThemeColors.dividerColor
    property int menuWidth: 0
    Rectangle {
        width: root.menuWidth
        height: root.height
        border.width: 1
        border.color: ThemeColors.dividerColor
        Row {
            anchors.centerIn: parent
            Rectangle {
                width: 50
                height: 50
                radius: 100
                border.color: "red"
                Text {
                    anchors.centerIn: parent
                    id: label
                    text: "测试"
                }
            }
            Rectangle {
                width: root.menuWidth - 20 - 50
                height: 50
                Text {
                    anchors.centerIn: parent
                    id: labelName
                    text: "第十人1"
                }
            }
        }
    }
}
