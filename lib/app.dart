import 'package:flutter/material.dart';
import 'package:task_manager/Ui/screens/sign_In_Screen.dart';
import 'package:task_manager/Ui/screens/add_new_task_screen.dart';
import 'package:task_manager/Ui/screens/forgot_password_screen.dart';
import 'package:task_manager/Ui/screens/main_nav_bar_holder_screen.dart';
import 'package:task_manager/Ui/screens/pin_verification_screen.dart';
import 'package:task_manager/Ui/screens/set_password_screen.dart';
import 'package:task_manager/Ui/screens/sign_up_screen.dart';
import 'package:task_manager/Ui/screens/splash_screen.dart';
import 'package:task_manager/Ui/screens/update_profile_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});
  static GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigator,
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(double.maxFinite),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          )
        )
      ),

      // home: SplashScreen(),
      initialRoute: SplashScreen.name,

      routes: {
        SplashScreen.name: (context) => SplashScreen(),
        SignInScreen.name: (context) => SignInScreen(),
        ForgotPasswordScreen.name: (context)=>ForgotPasswordScreen(),
        PinVerificationScreen.name: (context) => PinVerificationScreen(),
        SetPasswordScreen.name: (context) => SetPasswordScreen(),
        SignUpScreen.name: (context) => SignUpScreen(),
        MainNavBarHolderScreen.name: (context) => MainNavBarHolderScreen(),
        AddNewTaskScreen.name: (context) => AddNewTaskScreen(),
        UpdateProfileScreen.name: (context) => UpdateProfileScreen()
      },
    );
  }
}
