import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import dog.eden.coyote_labeler 1.0

import "../TestData"

Item
{
    SplitView
    {
        anchors.fill: parent

        ScrollView
        {
            id: fileView
            height: parent.height

            ScrollBar.horizontal.policy: ScrollBar.AlwaysOn

            Column {
                Label {
                    text: "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
                    font.pixelSize: 200
                }
            }
        }

        ColumnLayout
        {
            SplitView.minimumWidth: 200

            ComboBox
            {
                model: ["WaveFileEntry"]
                Layout.fillWidth: true
            }

            ScrollView
            {
                Layout.fillWidth: true
                Layout.fillHeight: true
                ScrollBar.vertical.policy: ScrollBar.AlwaysOn

                ListView
                {
                    id: labelList
                    width: parent.width
                    model: TestItemList {}
                    delegate: Button
                    {
                        required property string name
                        text: name
                        width: labelList.width
                    }
                }
            }
        }

    }
}
