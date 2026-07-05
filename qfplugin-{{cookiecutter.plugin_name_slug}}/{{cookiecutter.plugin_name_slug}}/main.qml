// NOTE: uncomment the following line to enable translation for this plugin.
// pragma Translator: {{ cookiecutter.plugin_name_slug }}

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import QtCore

import org.qfield
import org.qgis
import Theme

import "qrc:/qml" as QFieldItems

Item {
    id: plugin
    objectName: "plugin"

    property var mainWindow: iface.mainWindow()
    property var mapCanvas: iface.mapCanvas()

    Component.onCompleted: {
        iface.addItemToPluginsToolbar(pluginButtons);
    }

    FamousPlacesDialog {
        id: famousPlacesDialog
        mainWindow: plugin.mainWindow
        mapCanvas: plugin.mapCanvas
    }

    readonly property var audioSounds: [
        {
            name: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Sound 1"),
            source: Qt.resolvedUrl("resources/sounds/sound_1.mp3")
        },
        {
            name: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Sound 2"),
            source: Qt.resolvedUrl("resources/sounds/sound_2.mp3")
        },
        {
            name: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Sound 3"),
            source: Qt.resolvedUrl("resources/sounds/sound_3.mp3")
        },
        {
            name: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Sound 4"),
            source: Qt.resolvedUrl("resources/sounds/sound_4.mp3")
        }
    ]

    Dialog {
        id: multimediaDialog
        objectName: "multimediaDialog"
        title: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "{{ cookiecutter.plugin_name }} - multimedia")
        focus: true
        font: Theme.defaultFont
        parent: mainWindow.contentItem

        x: (mainWindow.width - width) / 2
        y: (mainWindow.height - height - 80) / 2

        enter: Transition {
            NumberAnimation {
                property: "opacity"
                from: 0.0
                to: 1.0
                duration: 720
                easing.type: Easing.OutCubic
            }
        }
        exit: Transition {
            NumberAnimation {
                property: "opacity"
                from: 1.0
                to: 0.0
                duration: 360
                easing.type: Easing.InCubic
            }
        }

        Column {
            width: multimediaDialog.availableWidth
            height: childrenRect.height
            spacing: 10

            Label {
                font: Theme.defaultFont
                color: Theme.mainTextColor
                text: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Play a sound by picking it in the list:")
            }

            MediaPlayer {
                id: soundMediaPlayer
                source: audioSounds[0].source
                audioOutput: AudioOutput {}
            }

            ComboBox {
                id: audioSoundsComboBox
                width: parent.width
                font: Theme.defaultFont
                model: audioSounds.map(sound => sound.name)

                // when a sound is selected, update the audio player with the corresponding sound.
                onActivated: index => {
                    soundMediaPlayer.source = audioSounds[index].source;
                    soundMediaPlayer.play();
                }
            }

            QfButton {
                id: vibrateButton
                width: parent.width
                font: Theme.defaultFont
                text: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Make the device vibrate")

                onClicked: {
                    // make the device vibrate for 2 seconds.
                    platformUtilities.vibrate(2000);
                }
            }
        }

        standardButtons: Dialog.Cancel

        Component.onCompleted: {
            standardButton(Dialog.Cancel).text = qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Close");
        }
    }

    QfToolButtonDrawer {
        id: pluginButtons
        objectName: "pluginButtons"
        iconSource: Qt.resolvedUrl("resources/images/icon.png")
        bgcolor: Theme.darkGray
        round: true

        QfToolButton {
            objectName: "famousPlacesButton"
            iconSource: Qt.resolvedUrl("resources/images/lucide/map-pin-search.svg")
            iconColor: "white"
            bgcolor: Theme.darkGray
            width: 40
            height: 40
            padding: 0
            round: true

            onClicked: {
                famousPlacesDialog.open();
            }
        }

        QfToolButton {
            objectName: "multimediaButton"
            iconSource: Qt.resolvedUrl("resources/images/lucide/audio-lines.svg")
            iconColor: "white"
            bgcolor: Theme.darkGray
            width: 40
            height: 40
            padding: 0
            round: true

            onClicked: {
                multimediaDialog.open();
            }
        }
    }
}
