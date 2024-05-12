import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:visionvent_in/models/investor.dart';

class CurrentUserNotifier extends ChangeNotifier {
  Investor? user;

  setUser(Investor investor) {
    user = investor;
    print("Investor Set => ${user?.id}");
    notifyListeners();
  }

  setInvestments(List<String> investmenst) {
    user = user!.copyWith(investments: investmenst);
    notifyListeners();
  }

  rechargeWallet(int amt) {
    user = user!.copyWith(walletAmt: amt);
    notifyListeners();
  }
}

final currentUserProvider =
    ChangeNotifierProvider<CurrentUserNotifier>((ref) => CurrentUserNotifier());

// final userProvider =
//     ChangeNotifierProvider<UserNotifier>((ref) => UserNotifier());

// class UserNotifier extends ChangeNotifier<Investor> {
//   UserNotifier()
//       : super(Investor(
//             id: '',
//             uid: '',
//             name: '',
//             email: '',
//             investments: [],
//             domains: []));

//   void setInvestor(Investor investor) {
//     state = investor;
//     print("providerset");
//   }
// }
