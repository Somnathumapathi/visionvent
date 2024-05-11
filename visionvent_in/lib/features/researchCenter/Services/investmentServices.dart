import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:visionvent_in/constants/utils.dart';
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
          final investments = data['investorInvestments'];
          ref.read(currentUserProvider).setInvestments(investments);
        });
  }
}
