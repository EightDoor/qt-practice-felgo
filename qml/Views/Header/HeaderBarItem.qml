import QtQuick 2.0
import QtQuick.Controls 2.0 as QuickControls2
import Felgo 3.0


Rectangle {
    id: root
    height: root.height
    width: root.width
    border.color: "Red"
    border.width: 1

    property int headerHeight: 0
    property var titles
    property int currentIndex: 0
    signal clicked;

    Row {
        width: root.width
        height: root.height
        spacing: 5
        Repeater {
            id: repeater
            model: titles
            Rectangle {
                width: 80
                height: root.headerHeight
                AppText {
                    id: text
                    text: titles[index]
                    color: ThemeColors.secondaryTextColor
                    anchors.centerIn: parent
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            root.clicked(index);
                        }
                    }
                }

            }
        }
    }
}
