import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'app/ad_manager/ad_manager.dart';
import 'components/error_text.dart';
import 'pages/home/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Among Us Wallpapers',
      home: Scaffold(
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
          return const ErrorText();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<void> initializeApp() async {
    await Firebase.initializeApp();
    await MobileAds.instance.initialize();
    await AdManager.loadAllAds();
    WidgetsFlutterBinding.ensureInitialized();
  }
}
