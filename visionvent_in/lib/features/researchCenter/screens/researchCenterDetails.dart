import 'package:flutter/material.dart';
import 'package:visionvent_in/features/researchCenter/screens/investPage.dart';
import 'package:visionvent_in/features/researchCenter/screens/widgets/circularChart.dart';
import 'package:visionvent_in/models/researchCenter.dart';

class ResearchCenterDetailsScreen extends StatelessWidget {
  const ResearchCenterDetailsScreen({super.key, required this.researchCenter});

  final ResearchCenter researchCenter;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final per =
        ((researchCenter.totalInvestment) / (researchCenter.investmentNeeded)) *
            100;
    return Scaffold(
      appBar: AppBar(title: Text('Research center')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4U5f-wc6Esyz2vl3g9MDK8qtShMv0_tlxOW_j6zomLA&s',
                  fit: BoxFit.cover,
                  width: screenWidth - 20,
                ),
              ),
              SizedBox(height: 10),
              Text(researchCenter.researchCenterName),
              SizedBox(height: 10),
              Text('About us'),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 224, 224),
                    borderRadius: BorderRadius.circular(10)),
                // margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Text(researchCenter.description),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Investment Received'),
              Center(
                  child: CircularChart(
                      title: '',
                      value: per,
                      color: Color.fromARGB(255, 43, 113, 188))),
              SizedBox(
                height: 10,
              ),
              Text('Our Researches'),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 223, 222, 223)),
                      child: Column(children: [
                        Text('Project title'),
                        Text(
                          'Project description Research Centres are normally cross-departmental and multi-disciplinary in terms of their activities and the nature of research ms of their activities and the nature of research undertaken; however, they will be based in a single home Department for administrative and financial purposes. They may also include members or affiliated members from outside the inst',
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                        ),
                        Text('Author name')
                      ]),
                    );
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => InvestPage(
                        researchCenter: researchCenter,
                      ))));
        },
        child: Icon(Icons.money),
      ),
    );
  }
}
