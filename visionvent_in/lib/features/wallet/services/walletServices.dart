import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionvent_in/constants/globalvariables.dart';
import 'package:visionvent_in/constants/utils.dart';
import 'package:http/http.dart' as http;
import 'package:visionvent_in/providers/userProvider.dart';

class WalletServices {
  static void rechargeWallet(
      {required WidgetRef ref,
      required BuildContext context,
      required int rechargeAmt,
      required String id}) async {
    try {
      final res = await http.post(Uri.parse("$uri/api/mobile/addAmount"),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode(
              {"code": "q!w@e#rt%y^u&", "id": id, "rechargeAmt": rechargeAmt}));
      httpHandler(
          res: res,
          context: context,
          onSuccess: () {
            final data = jsonDecode(res.body);
            final amt = data['amt'];
            print(amt);
            ref.read(currentUserProvider).rechargeWallet(amt);
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
