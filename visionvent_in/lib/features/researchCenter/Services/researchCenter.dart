import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionvent_in/constants/globalvariables.dart';
import 'package:visionvent_in/constants/utils.dart';
import 'package:http/http.dart' as http;
import 'package:visionvent_in/models/researchCenter.dart';

class ResearchCenterServices {
  static Future<List<ResearchCenter>?> fetchResearchCenters({
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    try {
      final res = await http.get(
        Uri.parse('$uri/api/mobile/getResearchCenters'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );
      httpHandler(res: res, context: context, onSuccess: () {});

      final List<dynamic> data = jsonDecode(res.body);
      print(data);
      final List<ResearchCenter> researchCenters =
          data.map((r) => ResearchCenter.fromMap(r)).toList();

      return researchCenters;
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
