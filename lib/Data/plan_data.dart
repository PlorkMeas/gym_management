class PlanData {
  String? planId;
  String? name;
  int? durationDays;
  int? monthlyFee;
  String? description;

  PlanData(
      {this.planId,
      this.name,
      this.durationDays,
      this.monthlyFee,
      this.description});

  PlanData.fromJson(Map<String, dynamic> json) {
    planId = json['plan_id'];
    name = json['name'];
    durationDays = json['duration_days'];
    monthlyFee = json['monthly_fee'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plan_id'] = planId;
    data['name'] = name;
    data['duration_days'] = durationDays;
    data['monthly_fee'] = monthlyFee;
    data['description'] = description;
    return data;
  }
}
