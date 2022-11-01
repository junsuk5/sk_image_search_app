import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String url;

  const DetailScreen({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(url),
          Text('부가 정보'),
        ],
      ),
    );
  }
}
