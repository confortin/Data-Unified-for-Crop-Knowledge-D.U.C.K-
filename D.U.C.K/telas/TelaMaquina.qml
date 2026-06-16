import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    anchors.fill: parent
    color: "#0c1117"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 12

        // ==========================================
        // PAINEL PRINCIPAL
        // ==========================================

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredWidth: 7
            Layout.fillHeight: true

            radius: 12
            color: "#111827"
            border.color: "#1f2937"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 12

                Label {
                    text: "MÁQUINA"
                    color: "#84cc16"
                    font.pixelSize: 24
                    font.bold: true
                }

                GridLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    columns: 2
                    rowSpacing: 10
                    columnSpacing: 10

                    MachineCard {
                        icon: "🌡"
                        title: "Temperatura Motor"
                        value: "87°C"
                        progress: 0.65
                    }

                    MachineCard {
                        icon: "🛢"
                        title: "Pressão Óleo"
                        value: "4.2 bar"
                        progress: 0.70
                    }

                    MachineCard {
                        icon: "⏳"
                        title: "Horas de Uso"
                        value: "1247 h"
                        progress: 0.85
                    }

                    MachineCard {
                        icon: "🔋"
                        title: "Bateria"
                        value: "12.8 V"
                        progress: 0.90
                    }

                    MachineCard {
                        icon: "⚙"
                        title: "Carga do Eixo"
                        value: "78%"
                        progress: 0.78
                    }

                    MachineCard {
                        icon: "🔄"
                        title: "RPM Motor"
                        value: "1850"
                        progress: 0.55
                    }
                }

                // Linha inferior
                RowLayout {

                    Layout.fillWidth: true
                    Layout.preferredHeight: 90

                    BottomCard {
                        title: "Próxima Manutenção"
                        value: "50 h"
                    }

                    BottomCard {
                        title: "AdBlue"
                        value: "34%"
                    }

                    BottomCard {
                        title: "Pressão Pneus"
                        value: "2.8 bar"
                    }
                }
            }
        }

        // ==========================================
        // SIDEBAR
        // ==========================================

        Rectangle {

            Layout.preferredWidth: 260
            Layout.fillHeight: true

            radius: 12
            color: "#111827"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 10

                InfoCard {
                    titulo: "Velocidade"
                    valor: "12 km/h"
                    icone: "🚜"
                }

                InfoCard {
                    titulo: "Combustível"
                    valor: "65%"
                    icone: "⛽"
                }

                InfoCard {
                    titulo: "Colheita"
                    valor: "8.2 t/ha"
                    icone: "🌾"
                }

                InfoCard {
                    titulo: "Clima"
                    valor: "28°C"
                    icone: "☀"
                }

                InfoCard {
                    titulo: "GPS"
                    valor: "Talhão Norte"
                    icone: "📍"
                }

                Item {
                    Layout.fillHeight: true
                }
            }
        }
    }

    // ==========================================
    // COMPONENTES
    // ==========================================

    component MachineCard : Rectangle {

        property string icon
        property string title
        property string value
        property real progress

        Layout.fillWidth: true
        Layout.fillHeight: true

        radius: 10
        color: "#161f2b"

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 15

            RowLayout {

                Label {
                    text: icon
                    font.pixelSize: 28
                }

                ColumnLayout {

                    Label {
                        text: title
                        color: "#9ca3af"
                        font.pixelSize: 13
                    }

                    Label {
                        text: value
                        color: "white"
                        font.pixelSize: 28
                        font.bold: true
                    }
                }
            }

            Item {
                Layout.fillHeight: true
            }

            Rectangle {

                Layout.fillWidth: true
                Layout.preferredHeight: 4

                radius: 2
                color: "#0f172a"

                Rectangle {
                    width: parent.width * progress
                    height: parent.height
                    radius: 2
                    color: "#84cc16"
                }
            }
        }
    }

    component BottomCard : Rectangle {

        property string title
        property string value

        Layout.fillWidth: true
        Layout.fillHeight: true

        radius: 8
        color: "#161f2b"

        Column {
            anchors.centerIn: parent
            spacing: 4

            Label {
                text: title
                color: "#9ca3af"
            }

            Label {
                text: value
                color: "white"
                font.bold: true
                font.pixelSize: 24
            }
        }
    }

    component InfoCard : Rectangle {

        property string titulo
        property string valor
        property string icone

        Layout.fillWidth: true
        Layout.preferredHeight: 90

        radius: 8
        color: "#161f2b"

        RowLayout {
            anchors.fill: parent
            anchors.margins: 12

            Label {
                text: icone
                font.pixelSize: 24
            }

            Column {

                Label {
                    text: titulo
                    color: "#9ca3af"
                }

                Label {
                    text: valor
                    color: "white"
                    font.bold: true
                    font.pixelSize: 18
                }
            }
        }
    }
}