import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateProfile {
  String name;
  String profilePhoto;
  String email;
  String uid;
  String shopAddress;
  String state;
  String city;
  String pincode;
  String mobileNumber;

  UpdateProfile({
    required this.name,
    required this.email,
    required this.profilePhoto,
    required this.shopAddress,
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
        "shopAddress": shopAddress,
        "pincode": pincode,
        "mobileNumber": mobileNumber,
      };

  static UpdateProfile fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UpdateProfile(
      name: snapshot['name'],
      email: snapshot['email'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      shopAddress: snapshot['shopAddress'],
      state: snapshot['state'],
      city: snapshot['city'],
      pincode: snapshot['pincode'],
      mobileNumber: snapshot['mobileNumber'],
    );
  }
}
