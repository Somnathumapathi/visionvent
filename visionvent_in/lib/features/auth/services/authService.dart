import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visionvent_in/constants/globalvariables.dart';
import 'package:visionvent_in/constants/utils.dart';
import 'package:visionvent_in/features/home/homePage.dart';
import 'package:visionvent_in/models/investor.dart';
import 'package:visionvent_in/providers/userProvider.dart';

class AuthService {
  static void signUp(
      {required WidgetRef ref,
      required BuildContext context,
      required String name,
      required String email,
      required String password,
      required List<String> domains}) async {
    try {
      if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        final UserCredential userCred = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        final uid = userCred.user!.uid;
        if (uid != null) {
          final res = await http.post(Uri.parse('$uri/api/mobile/signup'),
              headers: {'Content-Type': 'application/json; charset=UTF-8'},
              body: jsonEncode({
                "code": "q!w@e#rt%y^u&",
                "uid": '$uid',
                "name": name,
                "email": email,
                "password": password,
                "investments": [],
                "domains": domains
              }));
          print(jsonEncode({
            "code": "q!w@e#rt%y^u&",
            "name": name,
            "email": email,
            "password": password,
            "domains": domains
          }));
          print(res.body);
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
      } else {
        showSnackBar(context, 'Enter all feilds');
      }
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
  }

  static void signin({
    required WidgetRef ref,
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      final UserCredential userCred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final uid = userCred.user!.uid;
      if (uid != null) {
        final res = await http.post(Uri.parse('$uri/api/mobile/signin'),
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode({
              "code": "q!w@e#rt%y^u&",
              "email": email,
            }));
        print(res.body);
        httpHandler(
            res: res,
            context: context,
            onSuccess: () async {
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
              final SharedPreferences pref =
                  await SharedPreferences.getInstance();
              await pref.setString('uid', uid);
              ref.read(currentUserProvider).setUser(investor);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            });
      }
    }
  }

  static void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
