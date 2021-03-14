// import 'dart:convert';

// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;

// class Auth with ChangeNotifier {
//   // ignore: unused_field
//   String _token;
//   // ignore: unused_field
//   DateTime _expiryDate;
//   // ignore: unused_field
//   String _userId;

//   Future<void> _authenticate(
//       String email, String password, String urlSegment) async {
//     final url =
//         'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyB9JWUcp_XvgXPGvUBo66UBUjCrmX1w96g';
        
//     final response = await http.post(
//       url,
//       body: json.encode(
//         {
//           'email': email,
//           'password': password,
//           'returnSecureToken': true,
//         },
//       ),
//     );
//     print(json.decode(response.body));
//   }

//   Future<void> signup(String email, String password) async {
//     return _authenticate(email, password, 'signUp');
//   }

//   Future<void> login(String email, String password) async {
//     return _authenticate(email, password, 'signInWithPassword');
//   }
// }
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  // ignore: unused_field
  String _token;
  // ignore: unused_field
  DateTime _expiryDate;
  // ignore: unused_field
  String _userId;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyB9JWUcp_XvgXPGvUBo66UBUjCrmX1w96g';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
