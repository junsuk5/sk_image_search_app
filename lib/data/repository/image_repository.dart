import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_app/data/dto/Hits.dart';
import 'package:image_search_app/data/dto/ImageResult.dart';
import 'package:image_search_app/data/model/photo.dart';

class ImageRepository {
  Future<List<Photo>> fetchImages(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo&pretty=true'));

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    final imageResult = ImageResult.fromJson(json);

    if (imageResult.hits == null) {
      return [];
    }

    return imageResult.hits!
        .where((e) => e.webformatURL != null)
        .map((e) => Photo(
              e.webformatURL!,
              e.tags ?? '정보 없음',
            ))
        .toList();
  }
}
