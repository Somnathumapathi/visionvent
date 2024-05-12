import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionvent_in/features/researchCenter/Services/investmentServices.dart';
import 'package:visionvent_in/models/investment.dart';

class MyPortfolioPage extends ConsumerStatefulWidget {
  const MyPortfolioPage({super.key});

  @override
  ConsumerState<MyPortfolioPage> createState() => _MyPortfolioPageState();
}

class _MyPortfolioPageState extends ConsumerState<MyPortfolioPage> {
  List<Investment>? invs;

  fetchInvestments() async {
    invs = await InvestmentServices.getInvestments(ref: ref, context: context);
    setState(() {});
  }

  @override
  void initState() {
    fetchInvestments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: invs != null
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const Text('My Portfolio'),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: invs!.length,
                        itemBuilder: ((context, index) {
                          final _inv = invs![index];
                          return Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 222, 220, 220),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_inv.researchCenterName),
                                    Text('Invested Amt: ₹${_inv.amount}'),
                                  ],
                                ),
                                Text(
                                  '₹${_inv.returns}',
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                          );
                        }))
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
