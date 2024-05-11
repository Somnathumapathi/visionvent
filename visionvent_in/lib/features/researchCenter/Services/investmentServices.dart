import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../constants/globalvariables.dart';

class InvestmentServices {
  static void invest(
      {required WidgetRef ref,
      required BuildContext context,
      required String researchCenterId,
      required int investmen}) async {
    final res = http.post(Uri.parse('$uri/api/mobile/addInvestment'));
  }
}
