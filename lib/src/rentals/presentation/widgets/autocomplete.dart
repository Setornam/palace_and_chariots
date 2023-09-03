import 'dart:convert';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class AirportAutocomplete extends StatefulWidget {
  @override
  _AirportAutocompleteState createState() => _AirportAutocompleteState();
}

class _AirportAutocompleteState extends State<AirportAutocomplete> {
  final TextEditingController _textController = TextEditingController();
  List<String> _suggestions = [];

  @override
  void initState() {
    super.initState();
    _textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<List<String>> fetchAirports(String query) async {
    final apiKey =
        'e3a17b478e7d817e65eee51bdd1ce3a5'; // Replace with your API key
    final apiUrl =
        'http://api.aviationstack.com/v1/airports?access_key=e3a17b478e7d817e65eee51bdd1ce3a5&search=$query';

    final response = await http.get(Uri.parse(apiUrl));

    print(response.statusCode);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> airports = data['data'];
      return airports
          .map((airport) => '${airport['airport_name']} - ${airport['city']}')
          .toList();
    } else {
      throw Exception('Failed to load airports');
    }
  }

  void _onTextChanged() {
    final query = _textController.text.trim();

    // Debounce by waiting for a short delay before making the request
    Future.delayed(Duration(milliseconds: 300), () {
      if (query.isNotEmpty) {
        fetchAirports(query).then((suggestions) {
          setState(() {
            _suggestions = suggestions;
          });
        });
      } else {
        setState(() {
          _suggestions = [];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
          controller: _textController,
          decoration: InputDecoration(
            labelText: 'Search for an airport',
          ),
        ),
        suggestionsCallback: (pattern) async {
          return _suggestions;
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion),
          );
        },
        onSuggestionSelected: (suggestion) {
          // Handle what to do when a suggestion is selected (e.g., save the selected airport)
          print('Selected: $suggestion');
        },
      ),
    );
  }
}
