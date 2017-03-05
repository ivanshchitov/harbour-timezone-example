import QtQuick 2.0

QtObject {

    property string dateTimeStringToSet
    property date dateTime: Date.fromLocaleString(Qt.locale(),
                                 dateTimeStringToSet.substring(0, dateTimeStringToSet.length - 6),
                                 "yyyy-MM-ddTHH:mm:ss")
    property string utcOffset: dateTimeStringToSet.substring(dateTimeStringToSet.length - 6)
    property string localeDateString: Qt.formatDate(dateTime, Qt.SystemLocaleShortDate)
    property string localeTimeString: Qt.formatTime(dateTime, "HH:mm")
    property string localeDateTimeString: localeDateString.concat(" ").concat(localeTimeString)
    property string iso8601String: dateTime.toLocaleString(Qt.locale(), "yyyy-MM-ddTHH:mm:ss")
                                           .concat(utcOffset)
}
