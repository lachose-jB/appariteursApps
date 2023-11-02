import 'package:appariteurs/page/welcomePage/splashPage.dart';
import 'package:flutter/material.dart';
import 'components/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Appariteur',
      home: SplashScreen(), // Créez une instance de SplashScreen
    );
  }
}
