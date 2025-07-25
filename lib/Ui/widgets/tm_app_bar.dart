import 'package:flutter/material.dart';
import 'package:task_manager/Ui/controllers/auth_controller.dart';
import 'package:task_manager/Ui/screens/sign_In_Screen.dart';
import 'package:task_manager/Ui/screens/update_profile_screen.dart';


class TMAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TMAppBar({super.key});

  @override
  State<TMAppBar> createState() => _TMAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _TMAppBarState extends State<TMAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(onTap: _onTapUpdateProfile, child: CircleAvatar()),
          SizedBox(width: 15),
          GestureDetector(
            onTap: _onTapUpdateProfile,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AuthController.userModel!.fullName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  AuthController.userModel!.email,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(onPressed: _onTapLogOut, icon: Icon(Icons.logout)),
        ],
      ),
      backgroundColor: Colors.green,
    );
  }

  Future<void> _onTapLogOut() async {
    await AuthController.clearUserData();
    Navigator.pushNamedAndRemoveUntil(
      context,
      SignInScreen.name,
      (predicate) => false,
    );
  }

  void _onTapUpdateProfile() {
    if (ModalRoute.of(context)!.settings.name != UpdateProfileScreen.name) {
      Navigator.pushNamed(context, UpdateProfileScreen.name);
    }
  }
}
