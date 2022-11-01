import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search_app/data/model/photo.dart';
import 'package:image_search_app/data/repository/image_repository.dart';

class MainViewModel extends ChangeNotifier {
  final ImageRepository repository;

  List<Photo> items = [];
  bool isLoading = false;

  final _eventController = StreamController<String>();

  Stream<String> get eventStream => _eventController.stream;

  MainViewModel(this.repository);

  Future<void> fetchImages(String query) async {
    try {
      isLoading = true;
      // 렌더링
      notifyListeners();

      items = await repository.fetchImages(query);
    } catch (e) {
      _eventController.add('네트워크 에러!!!');
    }
    isLoading = false;
    // 렌더링
    notifyListeners();
  }
}
