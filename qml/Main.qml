import Felgo 3.0
import QtQuick 2.0

App {
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    NavigationStack {

        Page {
            id: page
            title: qsTr("RallyMatte")

            Tabell {
                id: multiplikationsTabell

                property int slumptal
                property int tabell

                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10

                onTabellPressed: {
                    slumptal = Math.floor(Math.random()*8+1)
                    tabell = valdTabell

                    tabelltext.text = qsTr("tabell: ") + tabell
                    question.text = slumptal + ("*") + tabell + ("=")
                }

                onBlandatPressed: {
                    slumptal = Math.floor(Math.random()*8+1)
                    tabell = kaffeLatte

                    tabelltext.text = qsTr("tabell: blandat")
                    question.text = slumptal + ("*") + tabell + ("=")
                }
            }


            Rectangle {
                id: svarsruta

                gradient: Gradient {
                    GradientStop {
                        position: 0.00;
                        color: "#0b0a3a";
                    }
                    GradientStop {
                        position: 0.51;
                        color: "#ffffff";
                    }
                    GradientStop {
                        position: 0.99;
                        color: "#ca1414";
                    }
                }
                border.color: "black"
                width: column.width
                height: column.height

                anchors.left: multiplikationsTabell.right
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10

                Column {
                    id: column

                    spacing: 10

                    AppText {
                        id: tabelltext
                        text: qsTr("tabell: ")

                    }

                    AppText {
                        id: question
                        text: qsTr("fråga")

                    }

                    AppText {
                        id: svarText
                        text: qsTr("svar")

                    }

                    AppText {
                        id: yesnoText
                        text: ("välj tabell! ")
                        color: ("black")
                    }
                }
            }

            Knappsats {
                id: knappsats

                anchors.left: multiplikationsTabell.right
                anchors.leftMargin: 10
                anchors.bottom: reklamruta.top
                anchors.bottomMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10

                property variant lista: [0,0]
                index: 2

                onKnappPressed: {
                    if( index > 0) {
                        lista[1] = lista[0]
                        lista[0] = knapp
                        svar = lista[1]*10 + lista[0]
                        index = index - 1
                        yesnoText.text = ("...")
                        yesnoText.color = "green"
                    }

                    //svarText.text = svar + " (T:" + lista[1] + ") (E:" + lista[0] +") (I:" + index +")"
                    svarText.text = svar
                }


                onBackPressed: {
                    svar = 0
                    svarText.text = "svar"


                    lista[0] = 0
                    lista[1] = 0
                    index = 2
                }

                onOkPressed: {
                    if( svar == multiplikationsTabell.slumptal*multiplikationsTabell.tabell){
                        yesnoText.text = ("du har rätt")
                        yesnoText.color = "green"
                        multiplikationsTabell.tabellPressed(multiplikationsTabell.tabell)
                        backPressed()


                    }else{
                        yesnoText.text = ("fel")
                        yesnoText.color = "red"
                        backPressed()

                    }

                }

            }

            Rectangle {

                id: reklamruta

                gradient: Gradient {
                    GradientStop {
                        position: 0.00;
                        color: "#0b0a3a";
                    }
                    GradientStop {
                        position: 0.51;
                        color: "#ffffff";
                    }
                    GradientStop {
                        position: 0.99;
                        color: "#ca1414";
                    }
                }
                border.color: "black"
                width: 100
                height: 100

                anchors.left: multiplikationsTabell.right
                anchors.leftMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10

                Image {
                    id: reklambild
                    source: "../assets/rallymatte_logo.png"
                    anchors.centerIn: parent
                    scale: 0.05
                }
            }
        }
    }
}
