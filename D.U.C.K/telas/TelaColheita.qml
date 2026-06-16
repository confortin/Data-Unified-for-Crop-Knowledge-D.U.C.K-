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

        // ==================================================
        // ÁREA PRINCIPAL
        // ==================================================

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
                    text: "COLHEITA"
                    color: "#84cc16"
                    font.pixelSize: 24
                    font.bold: true
                }

                // ==========================================
                // CARDS SUPERIORES
                // ==========================================

                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 90

                    HarvestMetric {
                        title: "Produtividade"
                        value: "8.2 t/ha"
                        icon: "🌾"
                    }

                    HarvestMetric {
                        title: "Área Colhida"
                        value: "12.4 ha"
                        icon: "📏"
                    }

                    HarvestMetric {
                        title: "Umidade"
                        value: "14.5%"
                        icon: "💧"
                    }

                    HarvestMetric {
                        title: "Perdas"
                        value: "1.2%"
                        icon: "⚠"
                    }
                }

                // ==========================================
                // MAPA DE PRODUTIVIDADE
                // ==========================================

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    radius: 10
                    color: "#161f2b"

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10

                        // Escala lateral

                        Rectangle {
                            Layout.preferredWidth: 80
                            Layout.fillHeight: true

                            radius: 8
                            color: "#0f172a"

                            Column {
                                anchors.centerIn: parent
                                spacing: 10

                                Label {
                                    text: "Produtividade\n(t/ha)"
                                    color: "white"
                                    horizontalAlignment: Text.AlignHCenter
                                }

                                Rectangle {
                                    width: 25
                                    height: 140

                                    gradient: Gradient {
                                        GradientStop { position: 0.0; color: "#16a34a" }
                                        GradientStop { position: 0.5; color: "#eab308" }
                                        GradientStop { position: 1.0; color: "#dc2626" }
                                    }
                                }

                                Label {
                                    text: "12.0"
                                    color: "white"
                                }

                                Label {
                                    text: "6.0"
                                    color: "white"
                                }

                                Label {
                                    text: "0.0"
                                    color: "white"
                                }
                            }
                        }

                        // Área do mapa

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            radius: 8
                            color: "#243447"

                            Label {
                                anchors.centerIn: parent
                                text: "MAPA DE PRODUTIVIDADE\n(Farming Simulator)"
                                color: "#9ca3af"
                                horizontalAlignment: Text.AlignHCenter
                                font.pixelSize: 24
                            }
                        }

                        // Dados laterais

                        ColumnLayout {

                            Layout.preferredWidth: 180
                            Layout.fillHeight: true

                            HarvestInfo {
                                title: "Produtividade"
                                value: "8.2 t/ha"
                            }

                            HarvestInfo {
                                title: "Área"
                                value: "12.4 ha"
                            }

                            HarvestInfo {
                                title: "Umidade"
                                value: "14.5%"
                            }

                            HarvestInfo {
                                title: "Talhão"
                                value: "Norte"
                            }
                        }
                    }
                }

                // ==========================================
                // INFERIOR
                // ==========================================

                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 90

                    BottomCard {
                        title: "Produção Total"
                        value: "85.6 t"
                    }

                    BottomCard {
                        title: "Produção/Hora"
                        value: "18.9 t/h"
                    }

                    BottomCard {
                        title: "Eficiência"
                        value: "92%"
                    }
                }
            }
        }

        // ==================================================
        // SIDEBAR
        // ==================================================

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

    // ==================================================
    // COMPONENTES
    // ==================================================

    component HarvestMetric : Rectangle {

        property string title
        property string value
        property string icon

        Layout.fillWidth: true
        Layout.fillHeight: true

        radius: 8
        color: "#161f2b"

        RowLayout {
            anchors.fill: parent
            anchors.margins: 10

            Label {
                text: icon
                font.pixelSize: 28
            }

            Column {
                spacing: 4

                Label {
                    text: title
                    color: "#9ca3af"
                }

                Label {
                    text: value
                    color: "white"
                    font.pixelSize: 20
                    font.bold: true
                }
            }
        }
    }

    component HarvestInfo : Rectangle {

        property string title
        property string value

        Layout.fillWidth: true
        Layout.fillHeight: true

        radius: 8
        color: "#161f2b"

        Column {
            anchors.centerIn: parent

            Label {
                text: title
                color: "#9ca3af"
            }

            Label {
                text: value
                color: "white"
                font.pixelSize: 22
                font.bold: true
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

            Label {
                text: title
                color: "#9ca3af"
            }

            Label {
                text: value
                color: "white"
                font.pixelSize: 24
                font.bold: true
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
                    font.pixelSize: 18
                    font.bold: true
                }
            }
        }
    }
}