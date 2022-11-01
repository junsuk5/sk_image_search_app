class ImageRepository {

  Future<List<String>> fetchImages(String query) async {
    await Future.delayed(Duration(seconds: 2));

    return [
      'https://pixabay.com/get/gf74f25848fb1d60fd09241c381219f81cc5af147354219a0012fdd3385565057b484078122fca3695b116f8e47abaadd_640.jpg',
      'https://pixabay.com/get/gf74f25848fb1d60fd09241c381219f81cc5af147354219a0012fdd3385565057b484078122fca3695b116f8e47abaadd_640.jpg',
    ];
  }
}