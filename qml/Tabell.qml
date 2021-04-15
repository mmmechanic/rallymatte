import QtQuick 2.0
import Felgo 3.0

Item {
    id: tabell

    // signal indicating that a level has been selected
    signal tabellPressed(int valdTabell)
    signal blandatPressed(int kaffeLatte)

    Column {
        id: column
        width: 100
        height: 400

        AppButton {
            id: tabell1
            text: "1"
            onClicked: tabellPressed(1)
        }

        AppButton {
            id: tabell2
            text: "2"
            onClicked: tabellPressed(2)

        }

        AppButton {
            id: tabell3
            text: "3"
            onClicked: tabellPressed(3)
        }

        AppButton {
            id: tabell4
            text: "4"
            onClicked: tabellPressed(4)
        }

        AppButton {
            id: tabell5
            text: "5"
            onClicked: tabellPressed(5)
        }

        AppButton {
            id: tabell6
            text: "6"
            onClicked: tabellPressed(6)
        }

        AppButton {
            id: tabell7
            text: "7"
            onClicked: tabellPressed(7)
        }

        AppButton {
            id: tabell8
            text: "8"
            onClicked: tabellPressed(8)
        }

        AppButton {
            id: tabell9
            text: "9"
            onClicked: tabellPressed(9)
        }

        AppButton {
            id:blandat
            text: "blandat"
            onClicked: blandatPressed(Math.floor(Math.random()*8+1))
        }

    }
}
