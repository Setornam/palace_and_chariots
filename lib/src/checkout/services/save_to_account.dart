import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  ///create a new booking collection instance
  static CollectionReference account =
      FirebaseFirestore.instance.collection('account');

  static Future<void> saveToAccount(
    String userID, [
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? country,
    String? fullName,
    String? address,
    String? city,
  ]) {
    return account
        .doc(userID)
        .set({
          'user_id': userID,
          'email': email,
          'first_name': firstName,
          'last_name': lastName,
          'phone_number': phoneNumber,
          'country': country,
          'address': address,
          'city': city
        })
        .then((value) => print('save to account success'))
        .catchError((error) => print("Failed to  save to account: $error"));
  }
}
