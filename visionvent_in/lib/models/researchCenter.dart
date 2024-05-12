// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResearchCenter {
  final String id;
  final String researchCenterName;
  final String description;
  final List<dynamic> researchPapers;
  final int investmentNeeded;
  final List<dynamic> totalResources;
  final int totalInvestment;
  final List<dynamic> domains;

  ResearchCenter(
      {required this.id,
      required this.researchCenterName,
      required this.description,
      required this.researchPapers,
      required this.investmentNeeded,
      required this.totalResources,
      required this.totalInvestment,
      required this.domains});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'researchCenterName': researchCenterName,
      'description': description,
      'researchPapers': researchPapers,
      'investmentNeeded': investmentNeeded,
      'totalResources': totalResources,
      'currentInvestment': totalInvestment,
      'domains': domains,
    };
  }

  factory ResearchCenter.fromMap(Map<String, dynamic> map) {
    return ResearchCenter(
      id: map['_id'] as String,
      researchCenterName: map['researchCenterName'] as String,
      description: map['description'] as String,
      researchPapers: List<dynamic>.from(
        (map['researchPapers'] as List<dynamic>),
      ),
      investmentNeeded: map['investmentNeeded'] as int,
      totalResources:
          List<dynamic>.from((map['totalResources'] as List<dynamic>)),
      totalInvestment: map['totalInvestment'] as int,
      domains: List<dynamic>.from(
        (map['domains'] as List<dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResearchCenter.fromJson(String source) =>
      ResearchCenter.fromMap(json.decode(source) as Map<String, dynamic>);
}
