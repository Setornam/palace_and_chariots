import 'package:cloud_firestore/cloud_firestore.dart';

class Orders {
  ///create a new booking collection instance
  static CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  static Future<void> addOrder(
      String orderStatus,
      String orderID,
      String name,
      String userID,
      String service,
      String price,
      String image,
      String orderDate,
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
      String? rooms,
      String? roomType,
      String? securityAvailableFor,
      String? houseCondition,
      String? houseLocation,
      String? numberOfBathrooms,
      String? numberOfBedrooms,
      String? numberOfChildren,
      String? numberOfAdults,
      String? email,
      String? firstName,
      String? lastName,
      String? phoneNumber,
      String? country,
      String? numberOfGuests]) {
    return orders
        .add({
          'order_status': orderStatus,
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
          'number_of_rooms': rooms,
          'room_type': roomType,
          'rating': rating,
          'review': review,
          'securityAvailableFor': securityAvailableFor,
          'house_condition': houseCondition,
          'house_location': houseLocation,
          'number_of_bathrooms': numberOfBathrooms,
          'number_of_bedrooms': numberOfBedrooms,
          'number_of_children': numberOfChildren,
          'number_of_adults': numberOfAdults,
          'number_of_guests': numberOfGuests,
          'personalInfo': {
            'email': email,
            'first_name': firstName,
            'last_name': lastName,
            'phone_number': phoneNumber,
            'country': country
          }
        })
        .then((value) => print('order success'))
        .catchError((error) => print("Failed to order: $error"));
  }
}
