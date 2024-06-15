import 'dart:io';
import 'dart:math';

import 'package:clean_and_green_app/Controller/AuthController.dart';
import 'package:clean_and_green_app/Controller/UserFetch.dart';
import 'package:clean_and_green_app/Model/UserFetchModel.dart';
import 'package:clean_and_green_app/Screens/reported_page.dart';
import 'package:clean_and_green_app/Widgets/ElevatedButtonModel.dart';
import 'package:clean_and_green_app/Widgets/ImagePicker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddressScreen extends StatefulWidget {
  var category = "";

  AddressScreen({required this.category, super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final AuthController auth = Get.put(AuthController());
  final MyModelController controller = Get.put(MyModelController());
  String reqEmail = 'abbasfg@gmail.com';

  final GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _address = TextEditingController();
  TextEditingController _description = TextEditingController();

  FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseAuth auths = FirebaseAuth.instance;

  File? image;

  pickImage(ImageSource source) {
    AppImagePicker(source: source).pick(onPick: (File? img) {
      setState(() {
        this.image = img;
      });
    });
  }

  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  int _randomNumber = 0;
  String name = '';
  String address = '';
  String state = '';
  String city = '';
  String pincode = '';
  String mobileNumber = '';
  String completed = "false";

  @override
  void initState() {
    super.initState();
    _generateRandomNumber();
  }

  void _generateRandomNumber() {
    final random = Random();
    setState(() {
      _randomNumber =
          random.nextInt(100); // Generates a random number between 0 and 99
    });
  }

  @override
  Widget build(BuildContext context) {
    controller.fetchAllModels();

    User? currentUser = auths.currentUser;
    String dealerEmail = currentUser?.email ?? '';
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 33, 202, 165),
                Color.fromARGB(255, 21, 84, 35)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Obx(
            () {
              if (controller.models.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              } else {
                MyModel? model = controller.models.firstWhereOrNull(
                  (model) => model.email == dealerEmail,
                );

                if (model == null) {
                  return const Center(
                    child: Text('No data available for the current user email'),
                  );
                }
                name = model.name;
                address = model.address;
                state = model.state;
                city = model.city;
                pincode = model.pincode;
                mobileNumber = model.mobileNumber;
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: const Text(
                            textAlign: TextAlign.center,
                            "Address Screen",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: TextFormField(
                              initialValue: widget.category,
                              readOnly: true,
                              cursorColor: Colors.white,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9)),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person_outline,
                                  color: Colors.white70,
                                ),
                                labelText: "Enter Problem Area Address",
                                labelStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.9)),
                                filled: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                fillColor: Colors.white.withOpacity(0.3),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                      width: 0, style: BorderStyle.none),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: TextFormField(
                              controller: _address,
                              cursorColor: Colors.white,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9)),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person_outline,
                                  color: Colors.white70,
                                ),
                                labelText: "Enter Problem Area Address",
                                labelStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.9)),
                                filled: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                fillColor: Colors.white.withOpacity(0.3),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                      width: 0, style: BorderStyle.none),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: TextFormField(
                              controller: _description,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person_outline,
                                  color: Colors.white70,
                                ),
                                labelText: "Describe The Problem",
                                labelStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.9)),
                                filled: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                fillColor: Colors.white.withOpacity(0.3),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                      width: 0, style: BorderStyle.none),
                                ),
                              ),
                              maxLines: 3,
                              textInputAction: TextInputAction.done,
                              validator: (String? text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Describe The Problem';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          image != null
                              ? SizedBox(
                                  height: 200,
                                  width: double.infinity,
                                  child: Image.file(image!),
                                )
                              : const Text("No Image Selected"),
                          const SizedBox(height: 30),
                          MyButton(
                              family: 'Roboto',
                              size: 20.0,
                              message: 'Submit',
                              onPressed: () async {
                                _generateRandomNumber();
                                if (_formKey.currentState!.validate()) {
                                  bool isRegistered =
                                      await auth.registerProblem(
                                    name,
                                    reqEmail,
                                    image,
                                    state,
                                    city,
                                    address,
                                    pincode,
                                    mobileNumber,
                                    _randomNumber.toString(),
                                    _address.text,
                                    currentDate,
                                    completed,
                                    widget.category,
                                    _description.text,
                                  );

                                  if (isRegistered) {
                                    Get.to(
                                      ReportedScreen(
                                        id: _randomNumber.toString(),
                                        address: _address.text,
                                        date: currentDate,
                                        category: widget.category,
                                        description: _description.text,
                                      ),
                                    );
                                  } else {
                                    Get.snackbar(
                                      "Error",
                                      "Failed to update profile",
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  }
                                }
                              },
                              col1: const Color.fromARGB(255, 128, 222, 131),
                              col2: Color.fromARGB(255, 35, 34, 34),
                              col3: Colors.green,
                              col4: Colors.black),
                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pickImage(ImageSource.camera);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
