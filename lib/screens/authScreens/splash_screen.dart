
import 'package:flutter/material.dart';

import '../../helper/assets_helper.dart';
import '../../helper/dimensn_helper.dart';
import '../welcome_page.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const WelcomePage()));
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SizedBox(
          height: DimensnHelper.dimensn_200,
          width: DimensnHelper.dimensn_200,
          child: Image.asset(AssetsHelper.weatherIcon),
        ),
      ),
    );
  }
}
