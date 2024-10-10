import 'package:flutter/material.dart';

import '../../components/common_button.dart';
import '../../helper/colors_helper.dart';
import '../../helper/dimensn_helper.dart';
import '../../helper/font_helper.dart';
import '../../helper/string_helper.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsHelper.primaryColor,
        title: const Text(StringHelper.logIn),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: DimensnHelper.dimensn_20,
            left: DimensnHelper.dimensn_20,
            right: DimensnHelper.dimensn_20),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration:
                  const InputDecoration(hintText: StringHelper.enterEmail),
            ),
            const SizedBox(
              height: DimensnHelper.dimensn_10,
            ),
            TextFormField(
              controller: passwordController,
              decoration:
                  const InputDecoration(hintText: StringHelper.enterPassword),
            ),
            const SizedBox(
              height: DimensnHelper.dimensn_20,
            ),
            CommonButton(
              onPress: () {},
              child: const Text(
                StringHelper.logIn,
                style: TextStyle(
                    color: ColorsHelper.whiteColor,
                    fontSize: FontHelper.dimensn_20
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
