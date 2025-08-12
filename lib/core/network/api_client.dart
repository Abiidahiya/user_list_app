import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient{
  final String baseUrl;
  ApiClient({required this.baseUrl});
  Future<dynamic> get(String endpoint) async{
    final uri = Uri.parse('$baseUrl$endpoint');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data with status code ${response.statusCode}');
    }
  }
}