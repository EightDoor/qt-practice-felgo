import QtQuick 2.0
import QtQuick.Controls 2.12
import Felgo 3.0

Item {
    id: root
    height: root.height
    width: root.width
    // 轮播图高度
    property int h: 150
    // 字体高度
    property int fontH: 30
    Column {
        id: scrollView
        width: root.width
        height: root.height
        clip: true

        PersonalizedReCommSwiper {
            id: personalizedReCommSwiper
            width: root.width
            height: root.h
            anchors.top: parent.top
            anchors.left: parent.left
        }

        Rectangle {
            id: recommendedSongList
            width: root.width
            height: fontH
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: personalizedReCommSwiper.bottom
            anchors.topMargin: 10

            AppText {
                id: label
                text: "推荐歌单"
                color: ThemeColors.textColor
                fontSize: 20
                height: parent.height
                verticalAlignment: Text.AlignVCenter
            }
        }


        PersonalizedReCommContent {
            id: personalizedReCommContent
            width: root.width
            height: root.height - root.h - root.fontH
            anchors.top: recommendedSongList.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
        }
    }
}
