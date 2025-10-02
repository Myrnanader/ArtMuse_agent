
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchIdea(String mood, String style) async {
  final url = Uri.parse('http://10.0.2.2:8000/generate-idea');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'mood': mood, 'style': style}),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['idea'];
  } else {
    throw Exception('Failed to fetch idea');
  }
}