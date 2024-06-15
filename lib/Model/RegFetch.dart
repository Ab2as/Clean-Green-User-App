import 'package:cloud_firestore/cloud_firestore.dart';

class FetchRegister {
  String id;
  String problemAddress;
  String date;
  String completed;
  String category;
  String description;
  String name;
  String problemPhoto;
  String email;
  String address;
  String state;
  String city;
  String pincode;
  String mobileNumber;

  FetchRegister({
    required this.id,
    required this.problemAddress,
    required this.date,
    required this.completed,
    required this.category,
    required this.description,
    required this.name,
    required this.email,
    required this.problemPhoto,
    required this.address,
    required this.state,
    required this.city,
    required this.pincode,
    required this.mobileNumber,
  });

  factory FetchRegister.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return FetchRegister(
      name: data['name'] ?? '',
      id: data['id'] ?? '',
      problemAddress: data['problemAddress'] ?? '',
      date: data['date'] ?? '',
      category: data['category'] ?? '',
      description: data['description'] ?? '',
      completed: data['completed'] ?? 'false',
      email: data['email'] ?? '',
      problemPhoto: data['problemPhoto'] ?? '',
      address: data['address'] ?? '',
      pincode: data['pincode'] ?? '',
      mobileNumber: data['mobileNumber'] ?? '',
      state: data['state'] ?? '',
      city: data['city'] ?? '',
    );
  }
}
