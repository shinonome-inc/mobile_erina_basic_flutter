import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Album {
  final int id;
  final String name;
  final List<String> types;

  const Album({
    required this.id,
    required this.name,
    required this.types,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    List<String> typesToList(dynamic types) {
      List<String> ret = [];
      for (int i = 0; i < types.length; i++) {
        ret.add(types[i]['type']['name']);
      }
      return ret;
    }

    return Album(
      id: json['id'],
      name: json['name'],
      types: typesToList(json['types']),
    );
  }
}

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
