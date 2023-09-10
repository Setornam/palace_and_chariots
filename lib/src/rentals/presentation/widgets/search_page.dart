import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/vehicle_details_page.dart';
import '../../../../injection_container.dart';
import '../../vehicle/domain/entities/vehicle.dart';
import '../../vehicle/presentation/bloc/vehicle_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final bloc = sl<VehicleBloc>();
  final searchController = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 90,
      elevation: 0,
      backgroundColor: Colors.white,
      title: Padding(
          padding: EdgeInsets.only(top: 20),
          child: StreamBuilder<List<Vehicle>>(
              stream: bloc.vehicles(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Vehicle> vehicleList = List.from(snapshot.requireData);

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 50,
                      child: TypeAheadField<Vehicle>(
                        textFieldConfiguration: const TextFieldConfiguration(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 35),
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: 'What are you searching for?',
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.lightBlue),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffe7e9f4)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            fillColor: Color(0xffe7e9f4),
                          ),
                        ),
                        suggestionsCallback: (pattern) async {
                          // Return suggestions based on the pattern entered by the user.
                          return vehicleList
                              .where((suggestion) =>
                                  suggestion.name
                                      .toLowerCase()
                                      .contains(pattern.toLowerCase()) &&
                                  pattern != '')
                              .toList();
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(title: Text(suggestion.name));
                        },
                        onSuggestionSelected: (suggestion) {
                          // Handle the selected suggestion.
                          print('Selected: ${suggestion.name}');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      suggestion.category != 'private jet'
                                          ? VehicleDetailsPage(
                                              color: suggestion.color,
                                              name: suggestion.name,
                                              luggage: suggestion.luggage,
                                              numberOfSeats: suggestion.seats,
                                              price: suggestion.price,
                                              rating: suggestion.rating,
                                              images: suggestion.images,
                                              otherFeatures:
                                                  suggestion.otherFeatures!,
                                              transmission:
                                                  suggestion.transmission,
                                              category: suggestion.category,
                                            )
                                          : VehicleDetailsPage(
                                              color: suggestion.color,
                                              name: suggestion.name,
                                              luggage: suggestion.luggage,
                                              numberOfSeats: suggestion.seats,
                                              price: suggestion.price,
                                              rating: suggestion.rating,
                                              images: suggestion.images,
                                              otherFeatures: [],
                                              transmission: '',
                                              category: suggestion.category,
                                              height: suggestion.height,
                                              length: suggestion.length,
                                              // speed: widget
                                              //     .privateJets![index].speed,
                                              range: suggestion.range,
                                            )));
                        },
                      ),
                    ),
                  );
                } else {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                }

                return CircularProgressIndicator();

                
              })),
    ));
  }
}
