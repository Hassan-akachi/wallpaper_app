import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:wallpaper_app/screens/home_screen.dart';

Future main()async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

await Future.delayed(const Duration(seconds: 2));
// whenever your initialization is completed, remove the splash screen:
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();

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

        primarySwatch: Colors.blue,
      ),
      home:  HomeScreen()
    );
  }
}

