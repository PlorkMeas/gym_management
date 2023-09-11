class EquipmentData {
  String? equipmentId;
  String? equipmentName;
  int? quantity;

  EquipmentData({this.equipmentId, this.equipmentName, this.quantity});

  EquipmentData.fromJson(Map<String, dynamic> json) {
    equipmentId = json['equipment_id'];
    equipmentName = json['equipment_name'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['equipment_id'] = equipmentId;
    data['equipment_name'] = equipmentName;
    data['quantity'] = quantity;
    return data;
  }
}
