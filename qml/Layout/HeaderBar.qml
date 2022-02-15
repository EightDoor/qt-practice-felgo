import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.0 as QuickControls2
import "./"
import "../Views/Header"


Item {
    id: root
    width: root.width
    height: root.height

    property int leftMenu: 0;
    property int footerHeight: 0
    property int contentHeight: 0
    property int headerHeight: 0

    property int barWidth: root.width

    Rectangle {
        id: swiperCurrent
        width: root.barWidth
        height: root.height

        property int currentIndex: 0

        Column {
            HeaderBarItem {
                titles: ["个性推荐", "歌单", "排行榜"]
                headerHeight: root.headerHeight
                width: root.barWidth
                height: root.headerHeight
                currentIndex: swiperCurrent.currentIndex
                onClicked: {
                    swiperCurrent.currentIndex = 1;
                }
            }

            // tab contents
            QuickControls2.SwipeView {
                id: swipeView
                width: root.width
                height: root.height
                clip: true
                interactive: false
                currentIndex: swiperCurrent.currentIndex
                ContentBody {
                    id: red
                    width: root.width
                    height: root.headerHeight
                    AppText {
                        text: "测试"
                    }
                }
                Rectangle {
                    color: "Green"
                }
            }
        }
    }
}
