import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:visionvent_in/constants/utils.dart';
import 'package:visionvent_in/models/investment.dart';
import 'package:visionvent_in/providers/userProvider.dart';

import '../../../constants/globalvariables.dart';

class InvestmentServices {
  static void invest(
      {required WidgetRef ref,
      required BuildContext context,
      required String researchCenterId,
      required String researchCenterName,
      required int investment}) async {
    final user = ref.read(currentUserProvider).user;
    print(investment.runtimeType);
    final res = await http.post(Uri.parse('$uri/api/mobile/addInvestment'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          "code": "q!w@e#rt%y^u&",
          "investorId": user!.id,
          "researchCenterId": researchCenterId,
          "researchCenterName": researchCenterName,
          "investedAmount": investment,
          "returns": investment,
        }));
    httpHandler(
        res: res,
        context: context,
        onSuccess: () {
          final data = jsonDecode(res.body);
          print(data);

          final List<dynamic> investments = data['investorInvestments'];
          print(investments);
          final List<String> inv =
              investments.map((i) => i['investmentId'] as String).toList();
          print(inv);
          final walletBalance = data['walletBalance'];
          ref.read(currentUserProvider).rechargeWallet(walletBalance);
          ref.read(currentUserProvider).setInvestments(inv);
          Navigator.pop(context);
        });
  }

  static Future<List<Investment>?> getInvestments({
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    try {
      final investmentId = ref.read(currentUserProvider).user!.id;
      final res = await http.post(Uri.parse("$uri/api/mobile/getInvestments"),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode(
              {"code": "q!w@e#rt%y^u&", "investorId": investmentId}));
      httpHandler(res: res, context: context, onSuccess: () {});
      final data = jsonDecode(res.body);
      print(data);
      final List<dynamic> investments = data['investments'];
      List<Investment> inv = investments.map((i) {
        return Investment.fromMap(i);
      }).toList();
      print("------------------$inv");
      return inv;
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
