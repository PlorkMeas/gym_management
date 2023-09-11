class PaymentData {
  String? paymentId;
  String? memberId;
  String? firstName;
  String? lastName;
  int? amount;
  int? methodId;
  String? methodName;
  String? paymentDate;

  PaymentData(
      {this.paymentId,
      this.memberId,
      this.firstName,
      this.lastName,
      this.amount,
      this.methodId,
      this.methodName,
      this.paymentDate});

  PaymentData.fromJson(Map<String, dynamic> json) {
    paymentId = json['payment_id'];
    memberId = json['member_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    amount = json['amount'];
    methodId = json['method_id'];
    methodName = json['method_name'];
    paymentDate = json['payment_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_id'] = paymentId;
    data['member_id'] = memberId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['amount'] = amount;
    data['method_id'] = methodId;
    data['method_name'] = methodName;
    data['payment_date'] = paymentDate;
    return data;
  }
}
