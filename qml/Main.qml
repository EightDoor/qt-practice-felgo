import Felgo 3.0
import QtQuick 2.0
import "./Layout"

App {
    id: app
    width: 640
    height: 480
    minimumHeight: 480
    minimumWidth: 640
    NavigationStack {
        Page {
            id: pageHome
            navigationBarHidden: true;
            // 底部高度
            property int footerHeight: 50
            // 顶部高度
            property int headerHeight: 50
            // 内容体高度
            property int contentHeight: app.height - headerHeight - footerHeight
            // 左侧内容宽度
            property int leftMenuWidth: 150
            Column {
                width: parent.width
                height: parent.height
                Row {
                    width: parent.width
                    height: parent.height - pageHome.footerHeight
                    LeftMenu {
                        width: pageHome.leftMenuWidth
                        height: app.height - pageHome.footerHeight
                        id: base
                        footerHeight: pageHome.footerHeight
                        headerHeight: pageHome.headerHeight
                        menuWidth: pageHome.leftMenuWidth
                    }
                    HeaderBar {
                        id: headerBar
                        height: pageHome.contentHeight
                        width: app.width - pageHome.leftMenuWidth
                        leftMenu: pageHome.leftMenuWidth
                        footerHeight: pageHome.footerHeight
                        contentHeight: pageHome.contentHeight
                        headerHeight: pageHome.headerHeight
                    }
                }
                Footer {
                    id: footer
                    height: pageHome.footerHeight
                    width: app.width
                }
            }
        }
    }
}
