import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import Package 1.0

Window {
    width: 1024
    height: 680
    visible: true
    title: qsTr("Hello World")

    SystemController{
        id:systemController
    }

    StackView{
        id:stackView
        anchors.fill:parent
        initialItem: "HotColdSelectionPage.qml"//they are in the same folder
    }

    StatusBar{
        id:statusBar
        anchors{
            horizontalCenter: parent.horizontalCenter
          top:parent.top
        }
    }
}
