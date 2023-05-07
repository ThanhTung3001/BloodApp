import 'package:app/src/presentation/app_auth/controller/app_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

import 'controller/app_authentication_service.dart';

class AuthScreen extends GetWidget<AppAuthenController> {
  AuthScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xffee4c83), Color(0xffe2e5f5)],
          stops: [0, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        padding: const EdgeInsets.all(16),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 120,
            ),
            Container(
              margin: const EdgeInsets.only(left: 4),
              child: const Text(
                'Welcome to BankBlood',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 32.0),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(0.8),
                filled: true,
                hintText: 'Email',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(0.8),
                filled: true,
                hintText: 'Password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(
              height: 36,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  InkWell(
                    child: Text(
                      "Forgot password ?",
                    ),
                  )
                ],
              ),
            ),
            // const SizedBox(height: 32.0),
            Obx(
              () => GFButton(
                type: GFButtonType.solid,
                onPressed: controller.loading.isFalse
                    ? () {
                        controller.Login(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim());
                      }
                    : null,

                fullWidthButton: true,
                size: GFSize.LARGE,

                child: controller.loading.isTrue
                    ? const CircularProgressIndicator()
                    : const Text('Login'),

                // borderShape:ShapeBorder. ,
              ),
            ),
            const SizedBox(height: 24.0),
            Container(
              child: SignInButton(
                Buttons.Google,
                onPressed: () {
                  Authentication().signInWithGoogle(context: context);
                  // TODO: Implement Google sign-in functionality
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
