import QtQuick 2.0
import Sailfish.Silica 1.0
import "../model"

Page {

    CustomDateTime {
        id: customDateTime
        dateTimeStringToSet: "2017-01-15T13:45:00+05:00"
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height
        Column {
            id: column
            width: parent.width
            PageHeader { title: "Page" }
            ValueButton {
                width: parent.width
                label: qsTr("Date").concat(":")
                value: customDateTime.localeDateString
                onClicked: {
                    var dialog = pageStack.push("Sailfish.Silica.DatePickerDialog",
                                                { date: customDateTime.dateTime });
                    dialog.accepted.connect(function() {
                        customDateTime.dateTime = new Date(dialog.year, dialog.month - 1, dialog.day,
                                                           customDateTime.dateTime.getHours(),
                                                           customDateTime.dateTime.getMinutes());
                    });
                }
            }
            ValueButton {
                width: parent.width
                label: qsTr("Time").concat(":")
                value: customDateTime.localeTimeString
                onClicked: {
                    var dialog = pageStack.push("Sailfish.Silica.TimePickerDialog",
                                                { hour: customDateTime.dateTime.getHours(),
                                                  minute: customDateTime.dateTime.getMinutes()});
                    dialog.accepted.connect(function() {
                        customDateTime.dateTime = new Date(customDateTime.dateTime.getFullYear(),
                                                           customDateTime.dateTime.getMonth(),
                                                           customDateTime.dateTime.getDate(),
                                                           dialog.hour, dialog.minute);
                    });
                }
            }
        }
    }
}
