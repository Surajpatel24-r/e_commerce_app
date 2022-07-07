import 'package:e_commerce_app/screens/app_base.dart';
import 'package:e_commerce_app/screens/homescreen.dart';
import 'package:e_commerce_app/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: ((context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Flutter Demo",
            theme: ThemeData(primaryColor: Colors.white),
            home: SplashScreen(),
          )),
    );
  }
}
