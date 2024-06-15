import 'package:clean_and_green_app/Controller/AuthController.dart';
import 'package:clean_and_green_app/Screens/Auth/ForgetPassword.dart';
import 'package:clean_and_green_app/Screens/Auth/SignUpScreen.dart';
import 'package:clean_and_green_app/Screens/HomeScreen.dart';
import 'package:clean_and_green_app/Screens/SplashScreen.dart';
import 'package:clean_and_green_app/Widgets/ElevatedButtonModel.dart';
import 'package:clean_and_green_app/Widgets/TextFieldModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  String? errorMessage;
  bool loginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 232, 241, 250), Colors.grey],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 45),
                  MyTextFormField(
                    myController: emailController,
                    fieldName: "Email",
                    myIcon: Icons.email_rounded,
                    iconColor: Colors.black,
                    keyboard: TextInputType.emailAddress,
                    errorMessage: "Please enter a correct Email",
                    obscureText: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return (errorMessage);
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Please Enter a valid email");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      emailController.text = value!;
                    },
                  ),
                  const SizedBox(height: 25),
                  MyTextFormField(
                    obscureText: true,
                    myController: passwordController,
                    fieldName: "Password",
                    myIcon: Icons.password_rounded,
                    iconColor: Colors.black,
                    keyboard: TextInputType.visiblePassword,
                    errorMessage: "Please enter a Password",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return (errorMessage);
                      }
                    },
                    onSaved: (value) {
                      passwordController.text = value!;
                    },
                  ),
                  const SizedBox(height: 35),
                  MyButton(
                      col3: Colors.grey,
                      col4: Colors.grey,
                      family: 'Roboto',
                      size: 20.0,
                      message: "Login",
                      col1: Colors.black,
                      col2: Colors.white,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          bool islogin = await authController.loginUser(
                              emailController.text, passwordController.text);
                          if (islogin) {
                            var sharedPref =
                                await SharedPreferences.getInstance();
                            sharedPref.setBool(
                                SplashScreenState.KEYLOGIN, true);
                            Get.to(() => HomeScreen());
                          }
                        } else {
                          Get.snackbar(
                            "Login Error",
                            "Invalid email or password",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ForgotPasswordDialog();
                        },
                      );
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 65, 57, 57),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Roboto'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const SignUpScreen());
                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                                color: Color.fromARGB(255, 241, 243, 245),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Roboto'),
                          ),
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
