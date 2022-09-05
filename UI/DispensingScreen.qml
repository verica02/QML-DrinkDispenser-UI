import QtQuick 2.15
import Package 1.0

//26 also in the .pro file
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.12


Rectangle{

    //27 instead of hardware
    Timer{
        id:dispensingTimer
        interval:3000
        running:false//after 3s delay(when everythin else has run) run the onTriggered function
        onTriggered: stackView.push("FinishScreen.qml")
    }

    //28 when the others are finished start the timer
    Component.onCompleted:
    {
        //30
        systemController.startOrder()
        dispensingTimer.start()

    }
    id:dispensingBackground
    anchors.fill:parent
    color:{
        if(systemController.drinkTemperature === SystemController.HOT)
            return "#f59d8e"
        else if(systemController.drinkTemperature === SystemController.COLD)
            return "#8eeef5"
    }

    //26
    BusyIndicator{
        id:dispensingBusyIndicator
        anchors.centerIn: parent
        width:281
        height:281
        Material.accent:{
            if(systemController.drinkTemperature === SystemController.HOT)
                return "#ed795c"
            else if(systemController.drinkTemperature === SystemController.COLD)
                return "#3190b5"
        }
    }

    //27
    Text{
        font.pixelSize: 96
        anchors{
            horizontalCenter: parent.horizontalCenter
            top:dispensingBusyIndicator.bottom
            topMargin: 15
        }

        color:{
            if(systemController.drinkTemperature === SystemController.HOT)
                return "#ed795c"
            else if(systemController.drinkTemperature === SystemController.COLD)
                return "#3190b5"
        }
        text:"Dispensing..."
    }
}
