import QtQuick
import Qt5Compat.GraphicalEffects   // <<< Use ESTE import no Qt 6/ necessário para o DropShadow

Rectangle {
    id: root

    // Propriedades personalizáveis
    property color cardColor: "white"
    property real shadowRadius: 8
    property real shadowOffsetX: 0
    property real shadowOffsetY: 4
    property color shadowColor: "#80000000"  // preto com 50% de opacidade

    // Tamanho padrão (pode ser sobrescrito ao usar o componente)
    width: 200
    height: 150

    // Torna o retângulo arredondado (opcional)
    radius: 8

    // Cor de fundo do card
    color: cardColor

    // Aplica a sombra usando um segundo retângulo em camada
    layer.enabled: true
    layer.effect: DropShadow {
        horizontalOffset: shadowOffsetX
        verticalOffset: shadowOffsetY
        radius: shadowRadius
        color: shadowColor
        samples: 16  // qualidade da sombra (quanto maior, mais suave)
    }

    // Aqui dentro você coloca o conteúdo do widget
    default property alias content: contentContainer.data

    Item {
        id: contentContainer
        anchors.fill: parent
        anchors.margins: 10  // espaço interno
    }
}