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

            Knappsats {
                id: knappsats
                x: 100
                y: 250

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


            AppText {
                id: tabelltext
                x: 250
                text: qsTr("tabell: ")

            }

            AppText {
                id: question
                x: 250
                y: 100
                text: qsTr("fråga")

            }

            AppText {
                id: svarText
                x: 250
                y: 200
                text: qsTr("svar")

            }

            AppText {
                id: yesnoText
                x: 200
                y: 550
                text: ("...")
            }

            /*Image {
                source: "../assets/felgo-logo.png"
                anchors.centerIn: parent
            }*/
        }

    }


}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
