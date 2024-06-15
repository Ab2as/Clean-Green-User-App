import 'package:clean_and_green_app/Screens/address_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisteredScreen extends StatelessWidget {
  const RegisteredScreen({super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   leading: IconButton(
          //       onPressed: () {
          //         Get.back();
          //       },
          //       icon: const Icon(Icons.arrow_back)),
          //   title: const Text(
          //     "Choose Category",
          //     style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   centerTitle: true,
          //   elevation: 0.0,
          //   backgroundColor: const Color.fromARGB(255, 30, 151, 125),
          // ),
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
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
                      "Choose Category",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              GridView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                children: [
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 8, 12, 63),
                        image: DecorationImage(
                          image: const AssetImage(
                              'assets/Images/public_urinate2.jpg'),
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.6),
                            BlendMode.modulate,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              "Yellow Spot \n(Public Urination Spot)",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 240, 240, 239),
                                  fontFamily: 'SignikaNegative',
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddressScreen(
                                category: "Yellow Spot (Public Urination Spot)",
                              )));
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 8, 12, 63),
                        image: DecorationImage(
                          image: AssetImage('assets/Images/sewerage3.jpg'),
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.6),
                            BlendMode.modulate,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              "Overflow of Sewerage or Storm Water",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 230, 231, 229),
                                  fontFamily: 'SignikaNegative',
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddressScreen(
                                category: "Overflow of Sewerage or Storm Water",
                              )));
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 8, 12, 63),
                        image: DecorationImage(
                          image: AssetImage('assets/Images/dead_animal.jpg'),
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.6),
                            BlendMode.modulate,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 75,
                            ),
                            Text(
                              "Dead Animal(s)",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 246, 246, 241),
                                  fontFamily: 'SignikaNegative',
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddressScreen(
                                category: "Dead Animal(s)",
                              )));
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 8, 12, 63),
                        image: DecorationImage(
                          image: AssetImage('assets/Images/dustbin.jpg'),
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.6),
                            BlendMode.modulate,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              "Dustbins Not Cleaned",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 236, 236, 230),
                                  fontFamily: 'SignikaNegative',
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddressScreen(
                                category: "Dustbins Not Cleaned",
                              )));
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 8, 12, 63),
                        image: DecorationImage(
                          image: AssetImage('assets/Images/drains1.jpg'),
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.6),
                            BlendMode.modulate,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 75,
                            ),
                            Text(
                              "Open Manholes Or Drains",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 243, 243, 236),
                                  fontFamily: 'SignikaNegative',
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddressScreen(
                                category: "Open Manholes Or Drains",
                              )));
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 8, 12, 63),
                        image: DecorationImage(
                          image: AssetImage('assets/Images/sweeping.jpg'),
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.6),
                            BlendMode.modulate,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 75,
                            ),
                            Text(
                              "Sweeping not done",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 234, 234, 227),
                                  fontFamily: 'SignikaNegative',
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddressScreen(
                                category: "Sweeping not done",
                              )));
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 8, 12, 63),
                        image: DecorationImage(
                          image: AssetImage('assets/Images/electricity.jpg'),
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.6),
                            BlendMode.modulate,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              "Electricity Problem",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 235, 235, 232),
                                  fontFamily: 'SignikaNegative',
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddressScreen(
                                category: "Electricity Problem",
                              )));
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 8, 12, 63),
                        image: DecorationImage(
                          image: AssetImage('assets/Images/water.jpg'),
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.6),
                            BlendMode.modulate,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              "No water supply",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 230, 230, 225),
                                  fontFamily: 'SignikaNegative',
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddressScreen(
                                category: "No water supply",
                              )));
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 8, 12, 63),
                        image: DecorationImage(
                          image: AssetImage('assets/Images/stagnant.jpg'),
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.6),
                            BlendMode.modulate,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              "Stagnant Water On The Road",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 247, 247, 242),
                                  fontFamily: 'SignikaNegative',
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddressScreen(
                                category: "Stagnant Water On The Road",
                              )));
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 8, 12, 63),
                        image: DecorationImage(
                          image:
                              AssetImage('assets/Images/disposal_waste1.jpg'),
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.6),
                            BlendMode.modulate,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              "Improper Disposal of Fecal Waste/Septage",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 247, 247, 242),
                                  fontFamily: 'SignikaNegative',
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddressScreen(
                                category:
                                    "Improper Disposal of Fecal Waste/Septage",
                              )));
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 8, 12, 63),
                        image: DecorationImage(
                          image: AssetImage('assets/Images/burning.jpg'),
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.6),
                            BlendMode.modulate,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              "Burning of Garbage in Open Space",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 252, 252, 252),
                                  fontFamily: 'SignikaNegative',
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddressScreen(
                                category: "Burning of Garbage in Open Space",
                              )));
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 8, 12, 63),
                        image: DecorationImage(
                          image: AssetImage('assets/Images/debris.jpg'),
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.6),
                            BlendMode.modulate,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              "Debris Removal/Construction Material",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 248, 248, 244),
                                  fontFamily: 'SignikaNegative',
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddressScreen(
                                category:
                                    "Debris Removal/Construction Material",
                              )));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
