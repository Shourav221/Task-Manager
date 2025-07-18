import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/Ui/screens/Sign_In_Screen.dart';
import 'package:task_manager/Ui/screens/set_password_screen.dart';
import 'package:task_manager/Ui/widgets/screen_background.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});
  static const String name = '/pin-verification';

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  TextEditingController _PinCodeTEController = TextEditingController();
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
                'Pin Verification',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                'A 6 digit verification pin will send your email address',
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 24),
              PinCodeTextField(
                length: 6,
                animationType: AnimationType.none,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                ),
                enableActiveFill: false,
                controller: _PinCodeTEController,
                beforeTextPaste: (text) {
                  return true;
                },
                appContext: context,
              ),
              ElevatedButton(onPressed: _verifyPin, child: Text('Verify')),
              const SizedBox(height: 24),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Have account? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w700,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = _onTapSignIn,
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
  void _verifyPin(){
    Navigator.pushNamed(context, SetPasswordScreen.name);
  }

  void _onTapSignIn(){
    Navigator.pushNamed(context, SignInScreen.name);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _PinCodeTEController.dispose();
  }
}
