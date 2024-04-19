import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      "http://localhost:8080"; // Replace with your server address and port

  Future<List<dynamic>> getAllAddresses() async {
    final response = await http.get(Uri.parse('$baseUrl/get-all-adresses'));

    if (response.statusCode == 200) {
      print(
          'Received addresses: ${jsonDecode(response.body)}'); // Add this line
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load addresses');
    }
  }

  Future<Map<String, dynamic>> getSingleAddress(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/get-address/$id'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load address');
    }
  }

  Future<bool> deleteAddress(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/remove/$id'));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete address');
    }
  }

  Future<Map<String, dynamic>> updateAddress(
      int id, Map<String, String> body) async {
    final response = await http.put(
      Uri.parse('$baseUrl/update/$id'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update address');
    }
  }

  Future<Map<String, dynamic>> createAddress(Map<String, String> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create address');
    }
  }
}
