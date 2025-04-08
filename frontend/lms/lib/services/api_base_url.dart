import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  final String baseUrl = 'https://yourapi.com/api';

  Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));
    return _handleResponse(response);
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    final responseJson = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseJson;
    } else {
      throw Exception(
          "API Error: ${responseJson['try again after sometimes']}");
    }
  }
}
