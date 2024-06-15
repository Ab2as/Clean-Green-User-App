import 'package:clean_and_green_app/Model/RegFetch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MyModelControllerR extends GetxController {
  var fregis = <FetchRegister>[].obs;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var filteredModels = <FetchRegister>[].obs; // New list for filtered models

  Future<void> fetchAllModels() async {
    try {
      QuerySnapshot query = await _db.collection('RegisterProblem').get();
      fregis.value = query.docs.map((doc) {
        FetchRegister fetchRegis = FetchRegister.fromFirestore(doc);
        return fetchRegis;
      }).toList();
      filteredModels.value = List.from(fregis);
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  void filterModels(String query) {
    filteredModels.value = fregis.where((fetchRegis) {
      // Case-insensitive search by dealer name
      return fetchRegis.id.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
