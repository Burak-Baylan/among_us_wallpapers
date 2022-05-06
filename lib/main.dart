import 'package:among_us_wallpapers/pages/home/view/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Among Us Wallpaper'),
        ),
        body: buildFutureBuilder(),
      ),
    );
  }

  Widget buildFutureBuilder() {
    return FutureBuilder(
      future: initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const HomeView();
        }
        if (snapshot.hasError) {
          return buildErrorWidget();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildErrorWidget() {
    return const Center(
      child: Text(
        'Something went wrong. Please restart app.',
        style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 45,
        ),
      ),
    );
  }

  Future<void> initializeApp() async {
    await Firebase.initializeApp();
  }
}
