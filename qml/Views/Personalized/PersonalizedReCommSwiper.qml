import QtQuick 2.0
import QtQuick.Controls 2.0
import Felgo 3.0

import "../../Comm"

Rectangle {
    id: root
    property var jsonData: []
    radius: 10
    width: root.width
    height: root.height

    SwipeView {
        id: view
        currentIndex: 1
        height: root.height
        width: root.width

        Repeater {
            model: jsonMode
            Loader {
                active: SwipeView.isCurrentItem || SwipeView.isNextItem || SwipeView.isPreviousItem
                sourceComponent: Image {
                    width: root.width
                    height: root.height
                    id: image
                    source: jsonData[index].imageUrl
                }
            }
        }
    }


    PageIndicator {
        id: indicator
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }


    JsonListModel {
        id: jsonMode
        source: root.jsonData
        keyField: "id"
    }

    Req {
        id: req
    }

    Component.onCompleted: {
        req.sendData("get", "banner").then(function (res) {
            console.log(res.banners, "res");
            jsonData = res.banners;
        }).catch(function(msg) {
            console.log(msg);
        })
    }
    Timer {
       interval: 3000
       running: true
       repeat: true
       onTriggered: {
           if(view.currentIndex < jsonData.length) {
               view.currentIndex +=1;
           }else {
               view.currentIndex = 1;
           }
       }
    }
}
