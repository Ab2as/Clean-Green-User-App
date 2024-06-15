import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String profilePhoto;
  String email;
  String uid;
  String address;
  String state;
  String city;
  String pincode;
  String mobileNumber;

  User({
    required this.name,
    required this.email,
    required this.profilePhoto,
    required this.address,
    required this.state,
    required this.city,
    required this.pincode,
    required this.uid,
    required this.mobileNumber,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePhoto": profilePhoto,
        "email": email,
        "uid": uid,
        "state": state,
        "city": city,
        "address": address,
        "pincode": pincode,
        "mobileNumber": mobileNumber,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      name: snapshot['name'],
      email: snapshot['email'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      address: snapshot['address'],
      state: snapshot['state'],
      city: snapshot['city'],
      pincode: snapshot['pincode'],
      mobileNumber: snapshot['mobileNumber'],
    );
  }
}
