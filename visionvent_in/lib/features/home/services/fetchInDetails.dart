import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:visionvent_in/constants/utils.dart';
import 'package:visionvent_in/providers/userProvider.dart';
import '../../../constants/globalvariables.dart';
import '../../../models/investor.dart';

class HomeServices {
  static void fetchInvestorDetails(
      {required WidgetRef ref, required BuildContext context}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final uid = pref.getString('uid');
    final res =
        await http.post(Uri.parse('$uri/api/mobile/fetchInvestorDetails'),
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode({
              "code": "q!w@e#rt%y^u&",
              "uid": uid,
            }));
    httpHandler(
        res: res,
        context: context,
        onSuccess: () {
          final data = jsonDecode(res.body);
          print("kyufrkuhwrbf - $data");
          final investor = Investor(
            id: data['_id'],
            uid: data["uid"],
            name: data["name"],
            email: data["email"],
            investments: data["investments"]
                .map((x) => x.toString())
                .toList()
                .cast<String>()
                .toList(),
            domains: data["domains"]
                .map((x) => x.toString())
                .cast<String>()
                .toList(),
          );
          print('rrrrr');
          ref.read(currentUserProvider).setUser(investor);
        });
  }
}
