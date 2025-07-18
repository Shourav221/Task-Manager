import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Ui/screens/Sign_In_Screen.dart';
import 'package:task_manager/Ui/screens/pin_verification_screen.dart';
import 'package:task_manager/Ui/widgets/screen_background.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const String name = '/forgot-password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Text(
                'Your Email Address',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'A 6 digit verification pin will send to your email address',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),

              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  controller: _emailTEController,
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter an valid email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _onTapSendPin,
                child: Icon(Icons.arrow_circle_right_outlined),
              ),
              const SizedBox(height: 50),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Have account? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w700,
                        ),
                        recognizer:
                            TapGestureRecognizer()..onTap = _goToSignInScreen,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSendPin() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, PinVerificationScreen.name);
    }
  }

  void _goToSignInScreen() {
    Navigator.pushNamed(context, SignInScreen.name);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailTEController.dispose();
  }
}
