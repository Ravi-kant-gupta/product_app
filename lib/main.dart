import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:product_app/Home%20Screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: 'AIzaSyAJvlTpDVLxsZfCZSQFbpATMMl4hEdwveo',
    appId: '1:495043208250:android:b50df5c531b8cd1f7a4103',
    messagingSenderId: '495043208250',
    projectId: 'product-app-4a4f6',
    storageBucket: 'gs://product-app-4a4f6.appspot.com',
  )).whenComplete(() {
    print("completed");
    // setState(() {});
  });
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apna Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

getStorage() {
  final storage = FirebaseStorage.instance;
  // Get a non-default Storage bucket
// final storage = FirebaseStorage.instanceFor(bucket: "gs://my-custom-bucket");
}
