import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchNews({
  required String q,
  required String fromDate,
  String? toDate,
  String? sortBy,
  required String apiKey,
}) async {
  final Uri uri = Uri.parse('https://newsapi.org/v2/everything').replace(
    queryParameters: {
      'q': q,
      'from': fromDate,
      if (toDate != null) 'to': toDate,
      if (sortBy != null) 'sortBy': sortBy,
      'apiKey': apiKey,
    },
  );

  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('News Data: $data');
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception: $e');
  }
}
