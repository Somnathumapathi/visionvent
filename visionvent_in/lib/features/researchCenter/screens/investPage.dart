import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:visionvent_in/features/researchCenter/Services/investmentServices.dart';
import 'package:visionvent_in/models/researchCenter.dart';
import 'package:visionvent_in/widgets/textField.dart';

class InvestPage extends ConsumerStatefulWidget {
  const InvestPage({
    super.key,
    required this.researchCenter,
  });

  final ResearchCenter researchCenter;

  @override
  ConsumerState<InvestPage> createState() => _InvestPageState();
}

class _InvestPageState extends ConsumerState<InvestPage> {
  final _amountController = TextEditingController();
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
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Checkout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                  controller: _amountController,
                  hint: 'Ex - 1000',
                  label: 'Investment Amount'),
            ),
            SizedBox(
              height: 15,
            ),
            _isAuthenticated
                ? ElevatedButton(
                    onPressed: () {
                      InvestmentServices.invest(
                          ref: ref,
                          context: context,
                          researchCenterId: widget.researchCenter.id,
                          researchCenterName:
                              widget.researchCenter.researchCenterName,
                          investment: int.parse(_amountController.text));
                    },
                    child: Text('Invest'))
                : ElevatedButton.icon(
                    onPressed: _authenticate,
                    icon: Icon(Icons.lock),
                    label: Text("Authenticate"),
                  ),
          ],
        ),
      ),
    );
  }
}
