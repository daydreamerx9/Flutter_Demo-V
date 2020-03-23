import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'rotued.dart';
import 'dart:io';

void main() {
  runZoned(() {
    runApp(MyApp());
  }, onError: (dynamic error, dynamic stack) {
    print(error);
    print(stack);
  });
  // if (Platform.isAndroid) {
  //   SystemUiOverlayStyle systemUiOverlayStyle =
  //       const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  // }
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      //home: HomePage(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
