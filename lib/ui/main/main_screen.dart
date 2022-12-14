import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_search_app/ui/detail/detail_screen.dart';
import 'package:image_search_app/ui/main/components/image_item.dart';
import 'package:image_search_app/ui/main/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final queryTextController = TextEditingController();
  StreamSubscription<String>? subscription;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final viewModel = context.read<MainViewModel>();
      subscription = viewModel.eventStream.listen((message) {
        final snackBar = SnackBar(
          content: Text(message),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    });
  }

  @override
  void dispose() {
    queryTextController.dispose();
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('이미지 검색'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: queryTextController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () async {
                      log('로딩시작!!!!!!!!');

                      await viewModel.fetchImages(queryTextController.text);

                      log('로딩끝!!!!!!!!');
                    },
                    icon: Icon(Icons.search),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: 'Search',
                  fillColor: Colors.white70),
            ),
          ),
          _buildList(viewModel),
        ],
      ),
    );
  }

  Widget _buildList(MainViewModel viewModel) {
    return Expanded(
      child: viewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.count(
              crossAxisCount: 2,
              children: viewModel.items.map((photo) {
                return GestureDetector(
                  onTap: () {
                    // 화면 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(photo: photo)),
                    );
                  },
                  child: Hero(
                    tag: photo.url,
                    child: ImageItem(url: photo.url),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
