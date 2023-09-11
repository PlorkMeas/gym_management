class EnrollData {
  String? memberId;
  String? firstName;
  String? lastName;
  String? classId;
  String? className;
  String? enrollmentDate;

  EnrollData(
      {this.memberId,
      this.firstName,
      this.lastName,
      this.classId,
      this.className,
      this.enrollmentDate});

  EnrollData.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    classId = json['class_id'];
    className = json['class_name'];
    enrollmentDate = json['enrollment_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['member_id'] = memberId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['class_id'] = classId;
    data['class_name'] = className;
    data['enrollment_date'] = enrollmentDate;
    return data;
  }
}
