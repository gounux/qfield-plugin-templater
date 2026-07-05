// NOTE: uncomment the following line to enable translation for this plugin.
// pragma Translator: {{ cookiecutter.plugin_name_slug }}

import QtQuick
import QtQuick.Layouts
import QtCore

import org.qfield
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

    // This dialog is used to show a list of famous places and allow the user to select one to navigate to.
    // The code lives in the `FamousPlacesDialog.qml` file.
    FamousPlacesDialog {
        id: famousPlacesDialog
        mainWindow: plugin.mainWindow
        mapCanvas: plugin.mapCanvas
    }

    // This dialog is used to show multimedia content.
    // The code lives in the `MultimediaDialog.qml` file.
    MultimediaDialog {
        id: multimediaDialog
        mainWindow: plugin.mainWindow
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
