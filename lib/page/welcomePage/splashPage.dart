import 'package:appariteurs/components/size_config.dart';
import 'package:appariteurs/page/welcomePage/componentsS/bodySplash.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BodySplashSc(),
    );
  }
}
