class ResearchCenter {
  final String id;
  final String researchCenterName;
  final String description;
  final List<dynamic> researchPapers;
  final int investmentNeeded;
  final List<dynamic> totalResources;
  final int currentInvestment;
  final List<String> domains;

  ResearchCenter(
      {required this.id,
      required this.researchCenterName,
      required this.description,
      required this.researchPapers,
      required this.investmentNeeded,
      required this.totalResources,
      required this.currentInvestment,
      required this.domains});
}
