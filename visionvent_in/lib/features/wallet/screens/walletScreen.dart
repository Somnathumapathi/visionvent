import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:visionvent_in/features/wallet/services/walletServices.dart';
import 'package:visionvent_in/providers/userProvider.dart';
import 'package:visionvent_in/widgets/textField.dart';

class WalletScreen extends ConsumerStatefulWidget {
  const WalletScreen({super.key});

  @override
  ConsumerState<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> {
  final _walletController = TextEditingController();
  bool _isAuthenticated = false;
  final LocalAuthentication _auth = LocalAuthentication();

  void _authenticate() async {
    final bool canAuthBio = await _auth.canCheckBiometrics;
    if (canAuthBio) {
      final didAuth = await _auth.authenticate(
          localizedReason: 'For payment',
          options: AuthenticationOptions(biometricOnly: false));
      setState(() {
        _isAuthenticated = didAuth;
      });
    }
  }

  @override
  void dispose() {
    _walletController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider).user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Wallet Balance:'),
              SizedBox(
                height: 20,
              ),
              Text(
                "₹${user!.walletAmt.toString()}",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              CustomTextField(
                  controller: _walletController,
                  hint: 'Ex-100',
                  label: 'Recharge Amount'),
              Spacer(),
              _isAuthenticated
                  ? ElevatedButton(
                      onPressed: () {
                        WalletServices.rechargeWallet(
                            ref: ref,
                            context: context,
                            rechargeAmt: int.parse(_walletController.text),
                            id: user.id);
                      },
                      child: Text('Recharge'))
                  : ElevatedButton.icon(
                      onPressed: _authenticate,
                      icon: Icon(Icons.lock),
                      label: Text("Authenticate"),
                    ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
