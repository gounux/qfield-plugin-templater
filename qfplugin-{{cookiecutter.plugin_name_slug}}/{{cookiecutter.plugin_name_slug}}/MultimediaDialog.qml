import QtQuick
import QtQuick.Controls
import QtMultimedia

import org.qfield
import Theme

Dialog {
    id: multimediaDialog
    objectName: "multimediaDialog"
    title: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "{{ cookiecutter.plugin_name }} - multimedia")
    focus: true
    font: Theme.defaultFont
    parent: mainWindow.contentItem

    required property var mainWindow

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
