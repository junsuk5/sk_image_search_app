class MainViewModel {
  List<String> items = [];
  bool isLoading = false;

  Future<void> fetchImages(String query) async {
    await Future.delayed(Duration(seconds: 2));

    items = [
      'https://img.gqkorea.co.kr/gq/2022/08/style_63073140eea70.jpg',
      'https://img.gqkorea.co.kr/gq/2022/08/style_63073140eea70.jpg',
    ];
  }
}
