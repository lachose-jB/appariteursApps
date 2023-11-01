import 'package:appariteurs/components/size_config.dart';
import 'package:appariteurs/loginPage/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          " Vous n'avez pas de compte ? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => SignUpScreen()), ),
          child: Text(
            "S'inscrire",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
