import QtQuick 2.0
import Felgo 3.0

Rectangle {
    id: root
    property int menuWidth: 0
    Rectangle {
        width: root.menuWidth
        height: root.height
        Row {
            anchors.centerIn: parent
            Rectangle {
                width: 50
                height: 50
                radius: 100
                AppImage {
                    id: avatar
                    defaultSource: "https://apk.start6.cn/home-barrage.png"
                    width: parent.width
                    height: parent.height
                    fillMode: Image.PreserveAspectFit
                    clip: true
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
