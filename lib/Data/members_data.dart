class MemberData {
  String? memberId;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? phoneNumber;
  String? birthDate;
  String? address;
  String? joinDate;

  MemberData(
      {this.memberId = '',
      this.firstName,
      this.lastName,
      this.gender,
      this.email,
      this.phoneNumber,
      this.birthDate,
      this.address,
      this.joinDate = ''});

  MemberData.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    birthDate = json['birth_date'];
    address = json['address'];
    joinDate = json['join_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['member_id'] = memberId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['gender'] = gender;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['birth_date'] = birthDate;
    data['address'] = address;
    data['join_date'] = joinDate;
    return data;
  }
}
