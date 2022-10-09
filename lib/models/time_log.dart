class TimeLog {
  String description = "";
  String hour = "";

  TimeLog(this.description, this.hour);

  setHour(String hour) {
    this.hour = hour;
  }
  setDescription(String description) {
    this.description = description;
  }

  Map toJson() => {
    'description': description,
    'hour': hour,
  };

  factory TimeLog.fromJson(Map<String, dynamic> json) {
    return TimeLog(
      json['description'] as String,
      json['hour'] as String
    );
  }
}