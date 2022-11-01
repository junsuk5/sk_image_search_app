import 'package:flutter/material.dart';
import 'package:image_search_app/data/repository/image_repository.dart';

class MainViewModel extends ChangeNotifier {
  final ImageRepository repository;

  List<String> items = [];
  bool isLoading = false;

  MainViewModel(this.repository);

  Future<void> fetchImages(String query) async {
    isLoading = true;
    // 렌더링
    notifyListeners();

    items = await repository.fetchImages(query);
    isLoading = false;
    // 렌더링
    notifyListeners();
  }
}
