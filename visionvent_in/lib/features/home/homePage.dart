import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionvent_in/features/home/myPortfolio.dart';
import 'package:visionvent_in/features/home/profilePage.dart';
import 'package:visionvent_in/features/home/services/fetchInDetails.dart';
import 'package:visionvent_in/features/researchCenter/screens/researchCenterDetails.dart';
import 'package:visionvent_in/features/researchCenter/services/researchCenter.dart';
import 'package:visionvent_in/models/researchCenter.dart';
import 'package:visionvent_in/providers/userProvider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  getBody(double screenWidth, double screenHeight) {
    if (_screenIdx == 0) {
      return const ProfilePage();
    }
    if (_screenIdx == 1) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                items: [
                  Image.network(
                      'https://www.talk-business.co.uk/wp-content/uploads/2020/06/AdobeStock_302181503.jpg',
                      fit: BoxFit.cover),
                  Image.network(
                      'https://altum.com/wp-content/uploads/2022/10/Altum_Article2_Assets.jpg',
                      fit: BoxFit.cover),
                  Image.network(
                      'https://imgix.bustle.com/uploads/image/2020/4/20/4f0e4ffe-434d-421c-8221-f00ac8213df2-ee1a587a-34a4-4d4d-b4d4-61a7d4faadab-shutterstock-1470652997.jpg?w=1200&h=630&fit=crop&crop=faces&fm=jpg',
                      fit: BoxFit.cover),
                ],
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enableInfiniteScroll: true,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('My suggestions'),
                    TextButton(onPressed: () {}, child: Text('See all'))
                  ],
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: rC!.length,
                    itemBuilder: (context, index) {
                      final _rC = rC![index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ResearchCenterDetailsScreen(
                                        researchCenter: _rC,
                                      )));
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 228, 223, 223),
                              // border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          height: 300,
                          width: 200,
                          child: Column(
                            children: [
                              Image.network(
                                'https://mir-s3-cdn-cf.behance.net/projects/404/ea6e31148808649.Y3JvcCw0OTAxLDM4MzQsOTEwLDA.jpg',
                                fit: BoxFit.cover,
                                height: 150,
                              ),
                              Text(_rC.researchCenterName),
                              // ListView.builder(
                              //     itemCount: ref
                              //         .read(currentUserProvider)
                              //         .user!
                              //         .domains
                              //         .length,
                              //     itemBuilder: ((context, index) {}))
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Top research Centers'),
                    TextButton(
                        onPressed: () {
                          ResearchCenterServices.fetchResearchCenters(
                              ref: ref, context: context);
                        },
                        child: Text('See all'))
                  ],
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: rC!.length,
                    itemBuilder: (context, index) {
                      final _rC = rC![index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ResearchCenterDetailsScreen(
                                        researchCenter: _rC,
                                      )));
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 228, 223, 223),
                              // border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          height: 300,
                          width: 200,
                          child: Column(
                            children: [
                              Image.network(
                                'https://mir-s3-cdn-cf.behance.net/projects/404/ea6e31148808649.Y3JvcCw0OTAxLDM4MzQsOTEwLDA.jpg',
                                fit: BoxFit.cover,
                                height: 150,
                              ),
                              Text(_rC.researchCenterName),
                              Text("Domains")
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    }
    if (_screenIdx == 2) {
      return const MyPortfolioPage();
    }
  }

  var _screenIdx = 1;
  List<ResearchCenter>? rC;

  fetchInvestor() async {
    HomeServices.fetchInvestorDetails(ref: ref, context: context);
  }

  fetchRc() async {
    rC = await ResearchCenterServices.fetchResearchCenters(
        ref: ref, context: context);
    setState(() {});
  }

  @override
  void initState() {
    fetchInvestor();
    fetchRc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('VisionVent'),
      ),
      body: rC != null
          ? getBody(screenWidth, screenHeight)
          : Center(child: CircularProgressIndicator()),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                // color: Colors.white,
              ),
              label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                // color: Colors.white,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.folder_shared_rounded,
                // color: Colors.white,
              ),
              label: 'My Portfolio')
        ],
        currentIndex: _screenIdx,
        onTap: (value) {
          setState(() {
            _screenIdx = value;
          });
        },
      ),
    );
  }
}
