import 'package:appariteurs/MyBottomBar.dart';
import 'package:appariteurs/components/keyboard.dart';
import 'package:appariteurs/helper/userController.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/size_config.dart';
import '../../../constants.dart';
import '../../../helper/user.dart';
import '../../../storage/sqlLite.dart';
import '../../custom_surfix_icon.dart';
import '../../default_button.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../form_error.dart';
import 'package:appariteurs/helper/helper.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  String? authToken; // Global variable to store the token
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool? remember = false;
  ApiHelper apiHelper = ApiHelper();
  final List<String?> errors = [];

  @override
  void initState() {
    super.initState();
    // Retrieve email and password from storage
    retrieveEmailAndPassword();
  }
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }
  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }
 Future<void> handleLogin(email, password) async {
   final user = await UserController.login(email, password);
   if (user != null) {
     KeyboardUtil.hideKeyboard(context);
     Navigator.push(context, MaterialPageRoute(builder: (context) => MyBottomBar(email, password)));
   } else {
     // Gérer la connexion échouée ici
   }
   if (remember == true) {
     final prefs = await SharedPreferences.getInstance();
     prefs.setString('email', email);
     prefs.setString('password', password);
   }
 }
  Future<void> getUserData() async {
    UserData? userData = await UserController.login(email, password);
    if (userData != null) {
      final database = DatabaseHelper.instance;

      // Vérifiez si l'utilisateur existe déjà dans la base de données.
      final existingUser = await database.getUserById(userData.userId);

      if (existingUser == null) {
        // L'utilisateur n'existe pas encore, alors nous l'insérons.
        final userMap = {
          database.columnUserId: userData.userId,
          database.columnAppariteurId: userData.appariteurId,
          database.columnName: userData.name,
          database.columnEmail: userData.email,
          database.columnTel: userData.tel,
          database.columnSexe: userData.sexe,
          database.columnImage: userData.image,
          database.columnAdresse: userData.adresse,
          database.columnDatenais: userData.datenais,
          database.columnLieunais: userData.lieunais,
          database.columnRue: userData.rue,
          database.columnCodepostal: userData.codepostal,
          database.columnVille: userData.ville,
          database.columnPays: userData.pays,
          database.columnNiveau: userData.niveau,
          database.columnUser: userData.user,
        };
        final userId = await database.insertUser(userMap);

        print('User ID: ${userData.userId}');
        print('User Name: ${userData.name}');
        // ... other user properties
      } else {
        // L'utilisateur existe déjà dans la base de données.
        print('User already exists in the database.');
      }
    } else {
      // Handle the case where user data retrieval failed.
      print('User data retrieval failed.');
    }
  }


  Future<void> retrieveEmailAndPassword() async {
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString('email');
    final storedPassword = prefs.getString('password');

    if (storedEmail != null && storedPassword != null) {
      setState(() {
        email = storedEmail;
        password = storedPassword;
        remember = true;
      });
    }
  }

// Call the function to get the user data
  @override
  Widget build(BuildContext context) {
    getUserData();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text("Se souvenir"),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  ForgotPasswordScreen.routeName,
                ),
                child: const Text(
                  "Mot de passe oublié",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                handleLogin(email, password);
              }
            },
          ),
        ],
      ),
    );
  }


  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
      },
      decoration: const InputDecoration(
        labelText: "Mot de Passe",
        hintText: "Entrer Votre Mot de passe",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Entrer Votre Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}