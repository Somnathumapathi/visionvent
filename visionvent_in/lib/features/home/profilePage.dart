import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionvent_in/features/auth/screens/signinPage.dart';
import 'package:visionvent_in/features/auth/services/authService.dart';
import 'package:visionvent_in/providers/userProvider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider).user;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: SizedBox(
              height: 140,
              width: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  'https://static.theprint.in/wp-content/uploads/2018/04/malllllluuuuuuuuuu-696x464.jpg?compress=true&quality=80&w=376&dpr=2.6',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Name: ${user!.name}"),
          SizedBox(
            height: 10,
          ),
          Text("email: ${user!.email}"),
          SizedBox(
            height: 10,
          ),
          Text("Domains: ${user!.domains}"),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                AuthService.signOut();

                Navigator.popUntil(context, (route) => false);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SigninPage()));
              },
              child: Text('Sign out'))
        ]),
      ),
    );
  }
}
