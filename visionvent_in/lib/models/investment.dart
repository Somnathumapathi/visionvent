// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Investment {
  final String id;
  final int amount;
  final String researchCenterId;
  final int returns;
  final String researchCenterName;

  Investment(
      {required this.id,
      required this.amount,
      required this.researchCenterId,
      required this.returns,
      required this.researchCenterName});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'researchCenterId': researchCenterId,
      'returns': returns,
      'researchCenterName': researchCenterName
    };
  }

  factory Investment.fromMap(Map<String, dynamic> map) {
    return Investment(
        id: map['_id'] as String,
        amount: map['investedAmount'] as int,
        researchCenterId: map['researchCenterId'] as String,
        returns: map['returns'] as int,
        researchCenterName: map['researchCenterName'] as String);
  }

  String toJson() => json.encode(toMap());

  factory Investment.fromJson(String source) =>
      Investment.fromMap(json.decode(source) as Map<String, dynamic>);
}
