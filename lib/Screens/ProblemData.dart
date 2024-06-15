import 'package:clean_and_green_app/Controller/AuthController.dart';
import 'package:clean_and_green_app/Controller/RegisFetch.dart';
import 'package:clean_and_green_app/Model/RegFetch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProblemData extends StatefulWidget {
  ProblemData({super.key});

//fetch by email of the user
  @override
  State<ProblemData> createState() => _ProblemDataState();
}

class _ProblemDataState extends State<ProblemData> {
  final MyModelControllerR _controller = Get.put(MyModelControllerR());
  AuthController auth = Get.put(AuthController());

  // Future<String?> getDocumentIdBySerial(String id) async {
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('RegisterProblem')
  //       .where('id', isEqualTo: id)
  //       .get();
  //   if (snapshot.docs.isNotEmpty) {
  //     return snapshot.docs.first.id;
  //   }
  //   return null;
  // }

  TextEditingController _searchController = TextEditingController();
  SharedPreferences? _prefs;
  final FirebaseAuth auths = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    _controller.fetchAllModels();

    User? currentUser = auths.currentUser;
    String dealerEmail = currentUser?.email ?? '';
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 220, 215, 215),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Data Screen',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 221, 216, 216),
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  labelText: 'Search by Id No.',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                onChanged: (value) {
                  _controller.filterModels(value);
                },
              ),
            ),
            Obx(
              () {
                if (_controller.fregis.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  FetchRegister? fetchRegister =
                      _controller.fregis.firstWhereOrNull(
                    (FetchRegister) => FetchRegister.email == dealerEmail,
                  );

                  // Check if the model was found
                  if (fetchRegister == null) {
                    return const Center(
                        child: Text(
                            'No data available for the current user email'));
                  }
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                        child: ListView.builder(
                          itemCount: _controller.filteredModels.length,
                          itemBuilder: (context, index) {
                            FetchRegister regist =
                                _controller.filteredModels[index];
                            return
                                // InkWell(
                                //   onTap: () {
                                //     _showClaimDetailsDialog(context, regist);
                                //   },
                                //   child:
                                Card(
                              color: regist.completed == 'true'
                                  ? const Color.fromARGB(255, 123, 172, 124)
                                  : const Color.fromARGB(255, 215, 154, 150),
                              elevation: 3,
                              child: ListTile(
                                leading: Text(
                                  regist.id,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                title: Text(
                                  regist.category,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text(
                                  regist.description,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Ptserif',
                                    color: Colors.black,
                                  ),
                                ),
                                trailing: regist.completed == 'true'
                                    ? const Icon(
                                        Icons.done_all_rounded,
                                        color: Colors.greenAccent,
                                      )
                                    : const Icon(
                                        Icons.pending_actions_rounded,
                                        color: Colors.redAccent,
                                      ),
                              ),
                            );
                            // );
                          },
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // void _showClaimDetailsDialog(
  //     BuildContext context, FetchRegister regist) async {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text(
  //           'Claim Details',
  //           style: TextStyle(
  //               fontFamily: 'Roboto',
  //               fontSize: 30,
  //               fontWeight: FontWeight.bold),
  //         ),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               'Id Number: ${regist.id}',
  //               style:
  //                   const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  //             ),
  //             Text(
  //               'Category: ${regist.category}',
  //               style:
  //                   const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  //             ),
  //             Text(
  //               'Description: ${regist.description}',
  //               style:
  //                   const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  //             ),
  //             Text(
  //               'Registration Date : ${regist.date}',
  //               style:
  //                   const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  //             ),
  //             Text(
  //               'Problem Address: ${regist.problemAddress}',
  //               style:
  //                   const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               TextButton(
  //                 onPressed: () async {
  //                   String? documentId = await getDocumentIdBySerial(regist.id);
  //                   if (documentId != null) {
  //                     bool isUpdated = await auth.UpdateRegisterProblem(
  //                         documentId,
  //                         regist.name,
  //                         regist.email,
  //                         regist.problemPhoto,
  //                         regist.state,
  //                         regist.city,
  //                         regist.address,
  //                         regist.pincode,
  //                         regist.mobileNumber,
  //                         regist.id,
  //                         regist.problemAddress,
  //                         regist.date,
  //                         'true',
  //                         regist.category,
  //                         regist.description);
  //                     print(documentId);
  //                     if (isUpdated) {
  //                       regist.completed = 'true';
  //                       setState(() {});
  //                       Navigator.of(context).pop();
  //                     }
  //                   }
  //                 },
  //                 child: const Text(
  //                   'Completed',
  //                   style: TextStyle(
  //                       fontFamily: 'Roboto',
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //               TextButton(
  //                 onPressed: () async {
  //                   String? documentId = await getDocumentIdBySerial(regist.id);
  //                   if (documentId != null) {
  //                     bool isUpdated = await auth.UpdateRegisterProblem(
  //                         documentId,
  //                         regist.name,
  //                         regist.email,
  //                         regist.problemPhoto,
  //                         regist.state,
  //                         regist.city,
  //                         regist.address,
  //                         regist.pincode,
  //                         regist.mobileNumber,
  //                         regist.id,
  //                         regist.problemAddress,
  //                         regist.date,
  //                         'false',
  //                         regist.category,
  //                         regist.description);
  //                     if (isUpdated) {
  //                       regist.completed = 'false';
  //                       // Trigger UI update
  //                       setState(() {});
  //                       Navigator.of(context).pop();
  //                     }
  //                   }
  //                 },
  //                 child: const Text(
  //                   'Pending',
  //                   style: TextStyle(
  //                       fontFamily: 'Roboto',
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
