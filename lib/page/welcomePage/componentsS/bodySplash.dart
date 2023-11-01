import 'package:appariteurs/components/size_config.dart';
import 'package:appariteurs/loginPage/default_button.dart';
import 'package:appariteurs/loginPage/sign_in/sign_in_screen.dart';
import 'package:appariteurs/page/welcomePage/componentsS/splashCompo.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class BodySplashSc extends StatefulWidget {
  @override
  _BodySplashScState createState() => _BodySplashScState();
}

class _BodySplashScState extends State<BodySplashSc> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Bienvenue Chez Appariteur!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
      "Surveillance de vos examens et concours En ligne et \n en présentielle partout en France",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Vous souhaitez surveiller des épreuvesde concours \nou d'examens en Ile-de-France",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                            (index) => AnimatedContainer(
                          duration: kAnimationDuration,
                          margin: const EdgeInsets.only(right: 5),
                          height: 6,
                          width: currentPage == index ? 20 : 6,
                          decoration: BoxDecoration(
                            color: currentPage == index
                                ? kPrimaryColor
                                : const Color(0xFFD8D8D8),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => SignInScreen()), );
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
