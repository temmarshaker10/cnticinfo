import 'package:cnticinfo/PL_page.dart';
import 'package:cnticinfo/cache_helper.dart';
import 'package:cnticinfo/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // to make sure that all lines complete theie execution befor runApp();
  await cachHelper.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey,
  ));
  //color under bottom nav
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: HexColor('#2e68b2'), // Change this color
      statusBarColor: HexColor('#2e68b2')));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: layout_page(),
      home: layout_page(),
    );
  }
}
