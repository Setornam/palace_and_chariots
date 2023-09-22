import 'package:cloud_firestore/cloud_firestore.dart';

class Orders {
  ///create a new booking collection instance
  static CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  static Future<void> addOrder(String orderID, String name, String userID,
      String service, String price, String image, String orderDate,
      [String? color,
      String? seats,
      String? transmission,
      String? speed,
      String? flightDepartureDate,
      String? flightReturnDate,
      String? flightDeparture,
      String? flightReturn,
      String? accommodationDistance,
      String? tourDuration,
      String? checkIn,
      String? checkOut,
      String? rating,
      String? review,
      String? roomsAndGuests,
      String? roomType]) {
    return orders
        .add({
          'order_id': orderID,
          'user_id': userID,
          'service': service,
          'name': name,
          'price': price,
          'image': image,
          'order_date': orderDate,
          'color': color,
          'seats': seats,
          'transmission': transmission,
          'speed': speed,
          'accommodation_distance': accommodationDistance,
          'tour_duration': tourDuration,
          'roomType': roomType,
          'flight_departure': flightDeparture,
          'flight_return': flightReturn,
          'flight_departure_date': flightDepartureDate,
          'flight_return_date': flightReturnDate,
          'check_in': checkIn,
          'check_out': checkOut,
          'rooms_and_guests': roomsAndGuests,
          'room_type': roomType,
          'rating': rating,
          'review': review,
        })
        .then((value) => print('order success'))
        .catchError((error) => print("Failed to order: $error"));
  }
}
