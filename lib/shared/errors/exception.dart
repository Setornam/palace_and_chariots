// ignore_for_file: public_member_api_docs, sort_constructors_first
///Exception that is thrown for server related and device related error
///
class DeviceException implements Exception {
  final int statusCode;
  final String message;

  DeviceException(this.message,
      {this.statusCode = 404});

  factory DeviceException.fromJson(Map<String, dynamic>json, {int code = 404})=>
      DeviceException(json['detail'] as String, statusCode: code);


  ///convert message to string
  @override
  String toString()=>message;

}
