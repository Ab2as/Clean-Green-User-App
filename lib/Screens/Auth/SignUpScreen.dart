import 'dart:io';

import 'package:clean_and_green_app/Controller/AuthController.dart';
import 'package:clean_and_green_app/Screens/HomeScreen.dart';
import 'package:clean_and_green_app/Screens/SplashScreen.dart';
import 'package:clean_and_green_app/Widgets/ElevatedButtonModel.dart';
import 'package:clean_and_green_app/Widgets/ImagePicker.dart';
import 'package:clean_and_green_app/Widgets/TextFieldModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // string for displaying the error Message
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final userNameEditingController = new TextEditingController();
  final shopAddressEditingController = new TextEditingController();
  final cityEditingController = new TextEditingController();
  final stateEditingController = new TextEditingController();
  final pincodeEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final mobileEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  AuthController authController = Get.put(AuthController());
  File? image;

  pickImage(ImageSource source) {
    AppImagePicker(source: source).pick(onPick: (File? img) {
      setState(() {
        this.image = img;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 232, 241, 250), Colors.grey],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors.black,
                            )),
                        // const SizedBox(
                        //   width: 70,
                        // ),
                        const Expanded(
                          child: Text(
                            'SignUp',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Text(
                        //   "SignUp",
                        //   style: TextStyle(
                        //       fontSize: 30,
                        //       fontFamily: 'Roboto',
                        //       fontWeight: FontWeight.bold),
                        // )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        image != null
                            ? CircleAvatar(
                                radius: 65, backgroundImage: FileImage(image!))
                            : const CircleAvatar(
                                radius: 65,
                                backgroundImage: NetworkImage(
                                    'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'),
                              ),
                        Positioned(
                          bottom: -10,
                          left: 80,
                          child: IconButton(
                            onPressed: () {
                              pickImage(ImageSource.camera);
                            },
                            icon: const Icon(Icons.add_a_photo),
                          ),
                        ),
                      ],
                    ),
                    // firstNameField,
                    const SizedBox(height: 20),
                    MyTextFormField(
                      myController: userNameEditingController,
                      fieldName: "Name",
                      myIcon: Icons.person_2_rounded,
                      iconColor: Colors.black,
                      keyboard: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the Name";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userNameEditingController.text = value!;
                      },
                      errorMessage: "Enter the Name",
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      myController: shopAddressEditingController,
                      fieldName: "Shop Address",
                      myIcon: Icons.business,
                      iconColor: Colors.black,
                      keyboard: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the Address";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        shopAddressEditingController.text = value!;
                      },
                      errorMessage: "Enter the Address",
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      myController: cityEditingController,
                      fieldName: "City",
                      myIcon: Icons.place,
                      iconColor: Colors.black,
                      keyboard: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the City";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        cityEditingController.text = value!;
                      },
                      errorMessage: "Enter the City",
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      myController: stateEditingController,
                      fieldName: "State",
                      myIcon: Icons.place,
                      iconColor: Colors.black,
                      keyboard: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the State";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        stateEditingController.text = value!;
                      },
                      errorMessage: "Enter the State",
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      myController: pincodeEditingController,
                      fieldName: "Pincode",
                      myIcon: Icons.pin,
                      iconColor: Colors.black,
                      keyboard: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the Pincode";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        pincodeEditingController.text = value!;
                      },
                      errorMessage: "Enter the Pincode",
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      myController: mobileEditingController,
                      fieldName: "Mobile Number",
                      myIcon: Icons.pin,
                      iconColor: Colors.black,
                      keyboard: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the Mobile Number";
                        }
                        if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                            .hasMatch(value)) {
                          return ("Enter the Valid Mobile Number)");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        pincodeEditingController.text = value!;
                      },
                      errorMessage: "Enter the Mobile Number",
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      myController: emailEditingController,
                      fieldName: "Email",
                      myIcon: Icons.email_rounded,
                      iconColor: Colors.black,
                      keyboard: TextInputType.emailAddress,
                      errorMessage: "Please enter a correct Email",
                      obscureText: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the Email";
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please Enter a valid email");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        emailEditingController.text = value!;
                      },
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      myController: passwordEditingController,
                      fieldName: "Password",
                      myIcon: Icons.key_rounded,
                      iconColor: Colors.black,
                      keyboard: TextInputType.emailAddress,
                      errorMessage: "Password is required for login",
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return (errorMessage);
                        }
                        if (!RegExp(r'^.{6,}$').hasMatch(value)) {
                          return ("Enter Valid Password(Min. 6 Character)");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        passwordEditingController.text = value!;
                      },
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                        myController: confirmPasswordEditingController,
                        fieldName: "Confirm Password",
                        myIcon: Icons.key_rounded,
                        iconColor: Colors.black,
                        keyboard: TextInputType.visiblePassword,
                        validator: (value) {
                          if (confirmPasswordEditingController.text !=
                              passwordEditingController.text) {
                            return "Password don't match";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          confirmPasswordEditingController.text = value!;
                        },
                        errorMessage: "Enter the Password",
                        obscureText: true),
                    const SizedBox(height: 20),
                    MyButton(
                        col3: Colors.grey,
                        col4: Colors.grey,
                        family: 'Roboto',
                        size: 20.0,
                        message: "SignUp",
                        col1: Colors.black,
                        col2: Colors.white,
                        onPressed: () async {
                          bool isregistered = await authController.registerUser(
                              userNameEditingController.text,
                              emailEditingController.text,
                              passwordEditingController.text,
                              image,
                              stateEditingController.text,
                              cityEditingController.text,
                              shopAddressEditingController.text,
                              pincodeEditingController.text,
                              mobileEditingController.text);
                          if (isregistered) {
                            var sharedPref =
                                await SharedPreferences.getInstance();
                            sharedPref.setBool(
                                SplashScreenState.KEYLOGIN, false);
                            Get.to(() => HomeScreen());
                          } else {
                            Get.snackbar("Error", "Failed to Upload Profile",
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        }),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
