import QtQuick 2.0
import Felgo 3.0

Item {
    id: knappsats

    property int index
    property int svar
    property int ental
    property int tiotal

    signal knappPressed(int knapp)
    signal backPressed()
    signal okPressed()

    Grid {
        id: grid
        width: 400
        height: 400
        rows: 4
        columns: 3

        AppButton {
            id: knapp1
            text: "1"
            onClicked: knappPressed(1)
        }

        AppButton {
            id: knapp2
            text: " 2"
            onClicked: knappPressed(2)
        }

        AppButton {
            id: knapp3
            text: "3"
            onClicked: knappPressed(3)
        }

        AppButton {
            id: knapp4
            text: "4"
            onClicked: knappPressed(4)
        }

        AppButton {
            id: knapp5
            text: "5"
            onClicked: knappPressed(5)
        }

        AppButton {
            id: knapp6
            text: "6"
            onClicked: knappPressed(6)
        }

        AppButton {
            id: knapp7
            text: "7"
            onClicked: knappPressed(7)
        }

        AppButton {
            id: knapp8
            text: "8"
            onClicked: knappPressed(8)
        }

        AppButton {
            id: knapp9
            text: "9"
            onClicked: knappPressed(9)
        }

        AppButton {
            id: knapp0
            text: "0"
            onClicked: knappPressed(0)

        }

        AppButton {
            id: backknapp
            text: "back"
            onClicked: backPressed()
        }

        AppButton {
            id: okKnapp
            text: "OK"
            onClicked: okPressed()
        }
    }

}
