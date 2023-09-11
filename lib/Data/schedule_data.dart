class ClassSchedule {
  String? classId;
  String? className;
  String? instructorId;
  String? firstName;
  String? lastName;
  String? specialties;
  int? maxCapacity;
  String? classDate;
  String? description;

  ClassSchedule(
      {this.classId,
      this.className,
      this.instructorId,
      this.firstName,
      this.lastName,
      this.specialties,
      this.maxCapacity,
      this.classDate,
      this.description});

  ClassSchedule.fromJson(Map<String, dynamic> json) {
    classId = json['class_id'];
    className = json['class_name'];
    instructorId = json['instructor_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    specialties = json['specialties'];
    maxCapacity = json['max_capacity'];
    classDate = json['class_date'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['class_id'] = classId;
    data['class_name'] = className;
    data['instructor_id'] = instructorId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['specialties'] = specialties;
    data['max_capacity'] = maxCapacity;
    data['class_date'] = classDate;
    data['description'] = description;
    return data;
  }
}
