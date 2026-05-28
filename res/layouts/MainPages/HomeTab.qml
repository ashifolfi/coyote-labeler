import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.21
import QtQuick.Dialogs
import QtQuick.Layouts

import dog.eden.coyote_labeler 1.0

Item
{
    Layout.fillWidth: true
    Layout.fillHeight: true

    RowLayout
    {
        anchors.centerIn: parent
        width: 500
        height: 200

        ColumnLayout
        {
            Layout.preferredWidth: 150
            Layout.preferredHeight: 200
            Layout.alignment: Qt.AlignCenter

            Label
            {
                text: "Coyote Labeler v1.0"
                font.pixelSize: 24
            }

            Button
            {
                Layout.preferredWidth: parent.width
                text: qsTr("New Project")
            }

            Button
            {
                Layout.preferredWidth: parent.width
                text: qsTr("Open Project")
                onPressed: function()
                {
                    ApplicationWindow.window.projectOpenDialog.open()
                }
            }

            Button
            {
                Layout.preferredWidth: parent.width
                text: qsTr("Support Me")
                onPressed: function()
                {
                    Qt.openUrlExternally("https://ko-fi.com/edens_garden")
                }
            }
        }

        ColumnLayout
        {
            Layout.preferredWidth: 150
            Layout.preferredHeight: 200
            Layout.alignment: Qt.AlignCenter

            Rectangle
            {
                color: "red"
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height
            }
        }
    }
}

