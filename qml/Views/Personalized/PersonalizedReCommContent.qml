import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
import Felgo 3.0
import "../../Comm"

Item {
    id: root
    property var jsonData: [];

    property int cellH: 200;
    property int cellW: 150;

    JsonListModel {
        id: jsonModel
        source: jsonData
        keyField: "id"
    }

    Req {
        id: req
    }

    Component.onCompleted: {
        req.sendData("get", "personalized").then(function(res) {
            jsonData = res.result;
        }).catch(function (err) {
            console.log(err)
        })
    }

    GridView {
        id: gridView
        width: root.width
        height: root.height
        model: jsonModel
        anchors.fill: parent
        cellHeight: root.cellH
        cellWidth: root.cellW
        clip: true

        property int titleViewH: 50
        property int itemSpace: 10
        delegate: Item {
            Rectangle {
                id: contentItem
                width: root.cellW - gridView.itemSpace
                height: root.cellH - gridView.titleViewH
                Rectangle {
                    id: imgRect
                    radius: 5
                    anchors.fill: parent
                    visible: false
                }
                AppImage {
                    id: picUrl
                    source: model.picUrl
                    verticalAlignment: Image.AlignHCenter
                    anchors.fill: parent
                    visible: false
                }
                OpacityMask {
                    anchors.fill: parent
                    source: picUrl
                    maskSource: imgRect
                }
            }


            AppText {
                anchors.top: contentItem.bottom
                width: root.cellW - gridView.itemSpace
                height: gridView.titleViewH
                clip: true
                id: name
                text: model.name
                wrapMode: Text.WrapAnywhere
                elide: Text.ElideRight
                maximumLineCount: 3
                fontSize: 15
                verticalAlignment: Text.AlignHCenter
            }
        }
    }
}
