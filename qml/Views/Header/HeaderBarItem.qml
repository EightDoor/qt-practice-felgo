import QtQuick 2.0
import QtQuick.Controls 2.0 as QuickControls2
import Felgo 3.0


Rectangle {
    id: root
    height: root.height
    width: root.width

    property int headerHeight: 0
    property var titles
    property int currentIndex: 0
    signal clicked(int index);

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
                    color: ThemeColors.textColor
                    anchors.centerIn: parent
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            root.clicked(index);
                        }
                    }
                }

                Rectangle {
                    id: bottomBorderIsShow
                    visible: root.currentIndex == index
                    width: 80
                    height: 2
                    color: "Black"
                    x:0
                    y: root.headerHeight - 2
                }
            }
        }
    }
}
