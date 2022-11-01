import 'dart:convert';

import 'package:http/http.dart' as http;

class ImageRepository {
  Future<List<String>> fetchImages(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo&pretty=true'));
    
    final json = jsonDecode(response.body) as Map<String, dynamic>;

    final Iterable hits = json['hits'];

    return hits.map((e) => e['webformatURL'] as String).toList();
  }
}