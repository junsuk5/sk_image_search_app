import 'package:image_search_app/data/repository/image_repository.dart';

class MainViewModel {
  final ImageRepository repository;

  List<String> items = [];
  bool isLoading = false;

  MainViewModel(this.repository);

  Future<void> fetchImages(String query) async {
    await repository.fetchImages(query);
  }
}
