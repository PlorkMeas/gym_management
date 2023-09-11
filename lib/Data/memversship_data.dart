class MembershipData {
  String? membershipId;
  String? memberId;
  String? firstName;
  String? lastName;
  String? startDate;
  String? endDate;
  String? planId;
  String? name;

  MembershipData(
      {this.membershipId,
      this.memberId,
      this.firstName,
      this.lastName,
      this.startDate,
      this.endDate,
      this.planId,
      this.name});

  MembershipData.fromJson(Map<String, dynamic> json) {
    membershipId = json['membership_id'];
    memberId = json['member_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    planId = json['plan_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['membership_id'] = membershipId;
    data['member_id'] = memberId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['plan_id'] = planId;
    data['name'] = name;
    return data;
  }
}
