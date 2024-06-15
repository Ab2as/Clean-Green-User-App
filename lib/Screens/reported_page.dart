import 'package:clean_and_green_app/Screens/HomeScreen.dart';
import 'package:clean_and_green_app/Widgets/ElevatedButtonModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportedScreen extends StatefulWidget {
  ReportedScreen(
      {required this.id,
      required this.address,
      required this.date,
      required this.category,
      required this.description,
      super.key});

  final String id;
  final String address;
  final String date;
  final String category;
  final String description;

  @override
  State<ReportedScreen> createState() => _ReportedScreenState();
}

class _ReportedScreenState extends State<ReportedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text(
        //     "Reported Screen",
        //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        //   ),
        //   centerTitle: true,
        //   elevation: 0.0,
        //   backgroundColor: const Color.fromARGB(255, 30, 151, 125),
        // ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    "Your complaint \nhas been registered.",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 320,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 81, 80, 80),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Report Details",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildDetailRow("Id", widget.id),
                      _buildDetailRow("Location", widget.address),
                      _buildDetailRow("Date", widget.date),
                      _buildDetailRow("Category", widget.category),
                      _buildDetailRow("Description", widget.description),
                    ],
                  ),
                ),
                // Container(
                //   margin: const EdgeInsets.all(10),
                //   child: const Text(
                //     "Make another complaint.",
                //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                //   ),
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     Get.to(HomeScreen());
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.green,
                //     padding:
                //         const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                //   child: const Text(
                //     "OK",
                //     style: TextStyle(
                //         fontSize: 30,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.black),
                //   ),
                // ),
                const SizedBox(
                  height: 30,
                ),
                MyButton(
                    family: 'Roboto',
                    size: 23.0,
                    message: "Okay",
                    onPressed: () {
                      Get.to(HomeScreen());
                    },
                    col1: Colors.greenAccent,
                    col2: Colors.black,
                    col3: Colors.green,
                    col4: Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
