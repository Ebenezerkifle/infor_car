class FeulModel {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;
  num? value;
  bool? feul;

  FeulModel({this.createdAt, this.value, this.feul, this.updatedAt, this.id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'value': value, 'feul': feul};
  }

  factory FeulModel.fromMap(Map<String, dynamic> map) {
    return FeulModel(
      id: map['_id'] != null ? map['_id'] as String : null,
      value: map['value'] != null ? map['value'] as num : null,
      feul: map['feul'] != null ? map['feul'] as bool : null,
    );
  }
}

class GraphModel {
  String? hour;
  num? maxValue;

  GraphModel({this.hour, this.maxValue});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'hour': hour, 'maxValue': maxValue};
  }

  factory GraphModel.fromMap(Map<String, dynamic> map) {
    return GraphModel(
        hour: map['hour'] != null ? map['hour'] as String : null,
        maxValue: map['maxValue'] != null ? map['maxValue'] as num : null);
  }
}
