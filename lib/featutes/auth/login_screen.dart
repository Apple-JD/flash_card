import 'package:flutter/material.dart';
import '../../widgets/app_input.dart';
import '../../widgets/app_button.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420), // Web friendly
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// EMAIL INPUT
                  AppInput(
                    label: 'Email',
                    hint: 'example@mail.com',
                    icon: IconData(LucideIcons.mail.codePoint,
                        fontFamily: LucideIcons.mail.fontFamily,
                        fontPackage: LucideIcons.mail.fontPackage),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email required';
                      }
                      if (!value.contains('@')) {
                        return 'Invalid email';
                      }
                      return null;
                    },
                  ),

                  /// PASSWORD INPUT
                  AppInput(
                    label: 'Password',
                    icon: IconData(LucideIcons.lockKeyhole.codePoint,
                        fontFamily: LucideIcons.lockKeyhole.fontFamily,
                        fontPackage: LucideIcons.lockKeyhole.fontPackage),
                    controller: passwordController,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Minimum 6 characters';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  /// SUBMIT BUTTON
                  AppButton(
                    label: 'Login',
                    icon: IconData(LucideIcons.scanBarcode.codePoint,
                        fontFamily: LucideIcons.scanBarcode.fontFamily,
                        fontPackage: LucideIcons.scanBarcode.fontPackage),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        debugPrint(emailController.text);
                        debugPrint(passwordController.text);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
