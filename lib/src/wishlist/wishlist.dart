import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Wishlist {
  ///create a new booking collection instance
  static CollectionReference wishlist =
      FirebaseFirestore.instance.collection('wishlist');

  static Future<void> addToWishlist(
    String itemID,
    String name,
    String userID,
    String service,
    String price,
    String image, [
    String? color,
    String? accommodationDistance,
    String? tourDuration,
    String? rating,
    String? review,
    String? roomType,
    String? securityAvailableFor,
    String? houseCondition,
    String? houseLocation,
    String? numberOfBathrooms,
    String? numberOfBedrooms,
    bool? isFavorite,
  ]) {
    return wishlist
        .doc(itemID)
        .set({
          'item_id': itemID,
          'user_id': userID,
          'service': service,
          'name': name,
          'price': price,
          'image': image,
          'color': color,
          'accommodation_distance': accommodationDistance,
          'tour_duration': tourDuration,
          'room_type': roomType,
          'rating': rating,
          'review': review,
          'securityAvailableFor': securityAvailableFor,
          'house_condition': houseCondition,
          'house_location': houseLocation,
          'number_of_bathrooms': numberOfBathrooms,
          'number_of_bedrooms': numberOfBedrooms,
          'is_favorite': true
        })
        .then((value) => print('Wishlist success'))
        .catchError((error) => print("Failed to Wishlist: $error"));
  }

  static Future<void> removeFromWishlist(String wishlistItemID) {
    return wishlist
        .doc(wishlistItemID)
        .delete()
        .then((value) => print('Removed from Wishlist'))
        .catchError((error) => print("Failed to remove from Wishlist: $error"));
  }
}
