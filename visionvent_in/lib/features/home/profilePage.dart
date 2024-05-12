import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionvent_in/features/auth/screens/signinPage.dart';
import 'package:visionvent_in/features/auth/services/authService.dart';
import 'package:visionvent_in/features/wallet/screens/walletScreen.dart';
import 'package:visionvent_in/providers/userProvider.dart';
import 'dart:math' as math;

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider).user;
    final List<Color> allowedColors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.yellow,
    ];
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
          const SizedBox(
            height: 10,
          ),
          Text("Name: ${user!.name}"),
          const SizedBox(
            height: 10,
          ),
          Text("Wallet Balance: ₹${user!.walletAmt}"),
          const SizedBox(
            height: 10,
          ),
          Text("email: ${user!.email}"),
          const SizedBox(
            height: 10,
          ),
          const Text("Domains:"),
          GridView.builder(
              shrinkWrap: true,
              itemCount: user.domains.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, mainAxisSpacing: 0),
              itemBuilder: (context, index) {
                final data = user.domains[index];
                final randomColor = allowedColors[index % allowedColors.length];

                return Chip(
                  padding: const EdgeInsets.all(1),
                  label: Text(
                    data,
                    style: const TextStyle(fontSize: 10, color: Colors.white),
                  ),
                  backgroundColor: randomColor,
                  side: BorderSide.none,
                );
              }),
          const SizedBox(
            height: 10,
          ),
          // Text(user.investments.toString()),
          ElevatedButton(
              onPressed: () {
                AuthService.signOut();

                Navigator.popUntil(context, (route) => false);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SigninPage()));
              },
              child: const Text('Sign out'))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WalletScreen()));
        },
        child: Icon(Icons.wallet),
      ),
    );
  }
}
