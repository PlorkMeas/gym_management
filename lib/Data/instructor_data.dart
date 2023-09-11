class InstructorData {
  String? instructorId;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? address;
  String? phone;
  String? specialties;

  InstructorData(
      {this.instructorId,
      this.firstName,
      this.lastName,
      this.gender,
      this.email,
      this.address,
      this.phone,
      this.specialties});

  InstructorData.fromJson(Map<String, dynamic> json) {
    instructorId = json['instructor_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
    specialties = json['specialties'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['instructor_id'] = instructorId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['gender'] = gender;
    data['email'] = email;
    data['address'] = address;
    data['phone'] = phone;
    data['specialties'] = specialties;
    return data;
  }
}
