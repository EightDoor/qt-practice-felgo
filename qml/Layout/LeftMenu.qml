import QtQuick 2.0
import "../Views/Header"

Column {
    id: root

    property int footerHeight: 0
    property int headerHeight: 0
    property int menuWidth: 0

    MenuTopHeader {
        id: menuTopHeader
        height: root.headerHeight
        width: root.menuWidth
    }

    Header {
        id: header
        height: root.headerHeight
        width: menuWidth
        menuWidth: root.menuWidth
    }
    ContentMenu {
        id: contentMenu
        width: menuWidth
        height: root.height - root.headerHeight
    }
}
