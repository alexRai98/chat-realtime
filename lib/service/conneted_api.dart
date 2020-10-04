import 'dart:async';
import 'dart:convert';
import 'package:challengeChat/models/user.dart';
import 'package:http/http.dart' as http;

String urlApi = "https://doc-doc-chat-api.herokuapp.com";

Future<User> createUser(userMap) async {
  final response = await http.post(
    "$urlApi/users",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userMap),
  );
  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create User');
  }
}

List<User> parseUsers(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<User>((json) => User.fromJson(json)).toList();
}

Future<List> fetchUsers(String userName) async {
  final response = await http.get("$urlApi/user/$userName");

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load User');
  }
}

// Future<List<User>> fetchUsers(String userName) async {
//   final response = await http.get("$urlApi/user/$userName");

//   if (response.statusCode == 200) {
//     return compute(parseUsers, response.body);
//   } else {
//     throw Exception('Failed to load User');
//   }
// }
