// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:prac_test/app/app_constants.dart';
import 'package:prac_test/common/app_buttons.dart';
import 'package:prac_test/common/app_styling.dart';
import 'package:prac_test/common/text_field.dart';
import '../common/app_fields.dart';
import '../service/user_service.dart';
import '../common/app_colors.dart';
import '../app/router.dart' as route;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLoginButtonPressed() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final userService = UserService();
    final response = await userService.loginUser(username, password);

    if (response != null) {
      print('Login successful');
      Navigator.pushNamed(context, route.dashboardView, arguments: response);
      successToast("Login successfully");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Please check your credentials.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.only(
          left: kLeftRightMarginOnBoarding,
          right: kLeftRightMarginOnBoarding,
          bottom: kBottomMargin,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Image(
                  image: AssetImage('assets/login.png'),
                  width: 120,
                  height: 120,
                  fit: BoxFit.fill),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: kLeftRightMarginOnBoarding),
                  child: Text(
                    "Login",
                    style: AppStyling.heading700Size24,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text(
                  "User Name",
                  style: AppStyling.normal500Size20,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            TextFields(
              hight: 50,
              hintText: 'Enter User Name',
              keyboardType: TextInputType.name,
              width: 400,
              controller: _usernameController,
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Text(
                  "Password",
                  style: AppStyling.normal500Size20,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            TextFields(
              hight: 50,
              hintText: 'password',
              keyboardType: TextInputType.name,
              width: 400,
              controller: _passwordController,
            ),
            const Spacer(),
            AppButtons.button1(
              "Login",
              AppColors.whiteColor,
              AppColors.amberColor,
              MediaQuery.of(context).size.width - 32,
              _handleLoginButtonPressed,
            ),
            const SizedBox(
              height: kBottomMargin,
            ),
          ],
        ),
      ),
    );
  }
}
