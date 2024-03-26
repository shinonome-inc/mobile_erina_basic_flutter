import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

void main() async {
  final url = Uri.parse('https://qiita.com/api/v2/items');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      for (var item in data) {
        stdout.writeln(item);
      }
    } else {
      stderr.writeln(
          'Failed to fetch data from the API. Status code: ${response.statusCode}');
    }
  } catch (e) {
    stderr.writeln('Failed to fetch data: $e');
  }
}
