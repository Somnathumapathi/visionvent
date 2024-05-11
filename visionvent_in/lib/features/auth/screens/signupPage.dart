import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionvent_in/features/auth/screens/signinPage.dart';
import 'package:visionvent_in/features/auth/services/authService.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ps = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _ps.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.black,
              //elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Enter Your Details',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: Colors.white, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Enter Username',
                        hintStyle: TextStyle(
                          color: Colors.white.withAlpha(100),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter e-mail',
                        hintStyle: TextStyle(
                          color: Colors.white.withAlpha(100),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _ps,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'password',
                        hintStyle: TextStyle(
                          color: Colors.white.withAlpha(100),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'confirm password',
                        hintStyle: TextStyle(
                          color: Colors.white.withAlpha(100),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          AuthService.signUp(
                              ref: ref,
                              context: context,
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              domains: []);
                        },
                        child: Text('Register')),
                    // NeoPopTiltedButton(
                    //   color: const Color.fromARGB(255, 10, 56, 12),
                    //   onTapUp: () => authController.registerUser(
                    //       _usernamecontroller.text,
                    //       _emailcontroller.text,
                    //       _passwordcontroller.text),
                    // child: const Padding(
                    //   padding: EdgeInsets.symmetric(
                    //     horizontal: 50.0,
                    //     vertical: 12,
                    //   ),
                    //   child: Text(
                    //     'Register',
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    // ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SigninPage()));
                      },
                      child: const Text(
                        'Already have an account? Login',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
