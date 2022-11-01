import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_search_app/data/repository/image_repository.dart';
import 'package:image_search_app/ui/main/components/image_item.dart';
import 'package:image_search_app/ui/main/main_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final viewModel = MainViewModel(ImageRepository());
  final queryTextController = TextEditingController();

  @override
  void dispose() {
    queryTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      setState(() {
                        viewModel.isLoading = true;
                      });

                      await viewModel.fetchImages(queryTextController.text);

                      setState(() {
                        viewModel.isLoading = false;
                      });
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
          _buildList(),
        ],
      ),
    );
  }

  Widget _buildList() {
    return Expanded(
      child: viewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.count(
              crossAxisCount: 2,
              children: viewModel.items
                  .map((e) => ImageItem(url: e)).toList(),
            ),
    );
  }
}
