import 'package:flutter/material.dart';

import '../helper/colors_helper.dart';
import '../helper/dimensn_helper.dart';
import '../helper/font_helper.dart';
import '../helper/string_helper.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback onPress;
  final Widget child;
  const CommonButton({super.key, required this.onPress, required this.child});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: DimensnHelper.dimensn_50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorsHelper.blueColor),
        child: const Text(
          StringHelper.logIn,
          style: TextStyle(
              color: ColorsHelper.whiteColor,
              fontSize: FontHelper.dimensn_20),
        ),
      ),
    );
  }
}
