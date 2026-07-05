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

    // list of famous places with their name and coordinates,
    // to be used in the dialog as data sample for jumping to coordinates.
    readonly property var famousPlaces: [
        {
            name: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Eiffel Tower"),
            location: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Paris, France"),
            longitude: 2.2945,
            latitude: 48.8584
        },
        {
            name: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Colosseum"),
            location: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Rome, Italy"),
            longitude: 12.4922,
            latitude: 41.8902
        },
        {
            name: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Sagrada Familia"),
            location: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Barcelona, Spain"),
            longitude: 2.1744,
            latitude: 41.4036
        },
        {
            name: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Taj Mahal"),
            location: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Agra, India"),
            longitude: 78.0421,
            latitude: 27.1751
        },
        {
            name: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Brandenburg Gate"),
            location: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Berlin, Germany"),
            longitude: 13.3777,
            latitude: 52.5163
        },
        {
            name: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Statue of Liberty"),
            location: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "New York, USA"),
            longitude: -74.0445,
            latitude: 40.6892
        }
    ]

    Dialog {
        id: famousPlacesDialog
        objectName: "famousPlacesDialog"
        title: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "{{ cookiecutter.plugin_name }} - lon/lat picker")
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
            width: famousPlacesDialog.availableWidth
            height: childrenRect.height
            spacing: 10

            Label {
                font: Theme.defaultFont
                color: Theme.mainTextColor
                text: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Pick a famous place:")
            }

            ComboBox {
                id: famousPlacesComboBox
                width: parent.width
                font: Theme.defaultFont
                model: famousPlaces.map(place => `${place.name} - ${place.location}`)

                // when a famous place is selected, update the longitude and latitude input fields with the corresponding coordinates.
                onActivated: index => {
                    longitudeInputField.text = famousPlaces[index].longitude.toString();
                    latitudeInputField.text = famousPlaces[index].latitude.toString();
                }

                // when the dialog is opened, set the input fields to the coordinates of the first famous place in the list.
                Component.onCompleted: {
                    longitudeInputField.text = famousPlaces[currentIndex].longitude.toString();
                    latitudeInputField.text = famousPlaces[currentIndex].latitude.toString();
                }
            }

            Label {
                font: Theme.defaultFont
                color: Theme.mainTextColor
                text: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Or enter directly the coordinates:")
            }

            TextField {
                id: longitudeInputField
                width: parent.width
                font: Theme.defaultFont
                placeholderText: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Longitude")

                inputMethodHints: Qt.ImhFormattedNumbersOnly
                validator: DoubleValidator {
                    bottom: -180
                    top: 180
                    notation: DoubleValidator.StandardNotation
                }
            }

            TextField {
                id: latitudeInputField
                width: parent.width
                font: Theme.defaultFont
                placeholderText: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Latitude")

                inputMethodHints: Qt.ImhFormattedNumbersOnly
                validator: DoubleValidator {
                    bottom: -90
                    top: 90
                    notation: DoubleValidator.StandardNotation
                }
            }

            QfButton {
                id: jumpToCoordinatesButton
                width: parent.width
                font: Theme.defaultFont
                text: qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Jump to coordinates")

                onClicked: {
                    const longitude = parseFloat(longitudeInputField.text);
                    const latitude = parseFloat(latitudeInputField.text);

                    // reproject the coordinates from WGS84 to the project's CRS.
                    const jumpToPoint = GeometryUtils.point(longitude, latitude);
                    const destCrs = CoordinateReferenceSystemUtils.wgs84Crs();
                    const projectedPoint = GeometryUtils.reprojectPoint(jumpToPoint, destCrs, qgisProject.crs);

                    // then jump to the point on the map canvas with a fixed scale.
                    mapCanvas.jumpTo(projectedPoint, scale = 10000);

                    mainWindow.displayToast(qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Moved to coordinates: %1, %2").arg(longitude).arg(latitude));
                    famousPlacesDialog.close();
                }
            }
        }

        standardButtons: Dialog.Cancel

        Component.onCompleted: {
            standardButton(Dialog.Cancel).text = qsTranslate("{{ cookiecutter.plugin_name_slug }}", "Close");
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
