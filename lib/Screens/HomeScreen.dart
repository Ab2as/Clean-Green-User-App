import 'package:clean_and_green_app/Controller/AuthController.dart';
import 'package:clean_and_green_app/Controller/UserFetch.dart';
import 'package:clean_and_green_app/Model/UserFetchModel.dart';
import 'package:clean_and_green_app/Screens/ProblemData.dart';
import 'package:clean_and_green_app/Screens/profileScreen.dart';
import 'package:clean_and_green_app/Screens/registered_screen.dart';
import 'package:clean_and_green_app/Widgets/Card3D.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final AuthController auth = Get.put(AuthController());
  final MyModelController controller = Get.put(MyModelController());

  final FirebaseAuth auths = FirebaseAuth.instance;
  String reqEmail = 'abbasfg@gmail.com';

  @override
  Widget build(BuildContext context) {
    controller.fetchAllModels();

    User? currentUser = auths.currentUser;
    String dealerEmail = currentUser?.email ?? '';

    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (controller.models.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            MyModel? model = controller.models.firstWhereOrNull(
              (model) => model.email == dealerEmail,
            );

            // Check if the model was found
            if (model == null) {
              return const Center(
                  child: Text('No data available for the current user email'));
            }

            return Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.grey, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(ProfileScreen());
                            },
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage('${model.photo}'),
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              'Swachhta',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Welcome",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'PlayFair'),
                            ),
                            Text(
                              // 'name',
                              '      ${model.name}',
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'PlayFair'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "How we can help?",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'PlayFair'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    Center(
                      child: SizedBox(
                        height: 240,
                        width: 190,
                        child: ThreeDCard(
                            imageUrl:
                                'https://as1.ftcdn.net/v2/jpg/07/05/33/36/1000_F_705333642_NJWDTbflUNh3CCFSxP7ixCMsCNJj6qum.webp',
                            text: "File Report",
                            onPressed: () {
                              Get.to(() => const RegisteredScreen());
                            }),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 240,
                        width: 190,
                        child: ThreeDCard(
                            imageUrl:
                                'https://img.freepik.com/free-vector/hand-drawn-cartoon-business-planning_23-2149158459.jpg?t=st=1718383880~exp=1718387480~hmac=5f9531900839f240a0f009c0eca82f158106720d7317abd71adac06bd5431c4e&w=900',
                            text: "Report Data",
                            onPressed: () {
                              Get.to(() => ProblemData());
                            }),
                      ),
                    ),

                    // Center(
                    //   child: SizedBox(
                    //     height: 240,
                    //     width: 190,
                    //     child: ThreeDCard(
                    //         imageUrl:
                    //             'https://cdni.iconscout.com/illustration/premium/thumb/claim-approval-report-7823885-6267863.png?f=webp',
                    //         text: "Claim",
                    //         onPressed: () {
                    //           Get.to(const ClaimScreen());
                    //         }),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
