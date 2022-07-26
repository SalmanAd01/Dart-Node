import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final Uri url = Uri.parse('http://localhost:5000/api/users/');
  void getUsers() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      print(
          "Name: ${data[0]['name']}, Email: ${data[0]['email']}, Password: ${data[0]['password']}");
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void createUser(String name, String email, String password) async {
    final response = await http.post(url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body:
            json.encode({'name': name, 'email': email, 'password': password}));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = json.decode(response.body);
      print(
          "Name: ${data['name']}, Email: ${data['email']}, Password: ${data['password']}");
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void updateUser(String id, String name, String email, String password) async {
    var url = 'http://localhost:5000/api/users/$id';

    final response = await http.put(Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body:
            json.encode({'name': name, 'email': email, 'password': password}));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = json.decode(response.body);
      print(
          "Name: ${data['name']}, Email: ${data['email']}, Password: ${data['password']}");
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void deleteUser(String id) async {
    var url = 'http://localhost:5000/api/users/$id';

    final response = await http.delete(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = json.decode(response.body);
      print(
          "Name: ${data['name']}, Email: ${data['email']}, Password: ${data['password']}");
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
