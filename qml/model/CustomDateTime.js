function CustomDateTime(dateTimeString) {
    if (dateTimeString) {
        this.dateTime = Date.fromLocaleString(Qt.locale(),
                                        dateTimeString.substring(0, dateTimeString.length - 6),
                                        "yyyy-MM-ddTHH:mm:ss");
        this.utcOffset = dateTimeString.substring(dateTimeString.length - 6);
    } else {
        this.dateTime = new Date();
        var utcOffsetWithoutColon = this.dateTime.toString().substring(this.dateTime.toString().length - 5);
        this.utcOffset = utcOffsetWithoutColon.slice(0, 3) + ":" + utcOffsetWithoutColon.slice(3);
    }
}

CustomDateTime.prototype.toLocaleDateString = function() {
    return Qt.formatDate(this.dateTime, Qt.SystemLocaleShortDate);
}

CustomDateTime.prototype.toLocaleTimeString = function() {
    return Qt.formatTime(this.dateTime, "HH:mm");
}

CustomDateTime.prototype.toLocaleDateTimeString = function() {
    return this.toLocaleDateString() + " " + this.toLocaleTimeString();
}

CustomDateTime.prototype.toISO8601String = function() {
   return this.dateTime.toLocaleString(Qt.locale(), "yyyy-MM-ddTHH:mm:ss").concat(this.utcOffset);
}
