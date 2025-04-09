import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  final String baseUrl = 'https://192.168.1.73:8080/api';

  Future<dynamic> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    print('GET Request => URL: $url');

    final response = await http.get(url);

    return _handleResponse(response);
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final headers = {'Content-Type': 'application/json'};
    final encodedBody = jsonEncode(body);

    print('POST Request => URL: $url');
    print('Headers: $headers');
    print('Body: $encodedBody');

    final response = await http.post(
      url,
      headers: headers,
      body: encodedBody,
    );

    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    try {
      final responseJson = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return responseJson;
      } else {
        throw Exception(
            "API Error: ${responseJson['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      throw Exception("Invalid response format or error: $e");
    }
  }
}
