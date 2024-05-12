// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:visionvent_in/models/investment.dart';

class Investor {
  final String id;
  final String uid;
  final String name;
  final String email;
  final List<String> investments;
  final List<String> domains;
  final int walletAmt;

  Investor(
      {required this.id,
      required this.uid,
      required this.name,
      required this.email,
      required this.investments,
      required this.domains,
      required this.walletAmt});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uid': uid,
      'name': name,
      'email': email,
      'investments': investments,
      'domains': domains,
    };
  }

  factory Investor.fromMap(Map<String, dynamic> map) {
    return Investor(
      id: map['id'].toString(),
      uid: map['uid'].toString(),
      name: map['name'].toString(),
      email: map['email'].toString(),
      investments: map['investments'],
      domains: map['domains'],
      walletAmt: map['walletAmt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Investor.fromJson(String source) =>
      Investor.fromMap(json.decode(source) as Map<String, dynamic>);

  Investor copyWith({
    String? id,
    String? uid,
    String? name,
    String? email,
    List<String>? investments,
    List<String>? domains,
    int? walletAmt,
  }) {
    return Investor(
        id: id ?? this.id,
        uid: uid ?? this.uid,
        name: name ?? this.name,
        email: email ?? this.email,
        investments: investments ?? this.investments,
        domains: domains ?? this.domains,
        walletAmt: walletAmt ?? this.walletAmt);
  }
}
