import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
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
      child: ListView(
        children: [
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
          Text('asdfasdfa'),
        ],
      ),
    );
  }
}