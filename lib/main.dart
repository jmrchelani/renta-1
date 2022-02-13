import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:renta/provider/cars_data_provider.dart';
import 'package:renta/provider/login_button_provider.dart';
import 'package:renta/provider/register_button_provider.dart';

import 'pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginButtonProvider>(
            create: (_) => LoginButtonProvider()),
        ChangeNotifierProvider<RegisterButtonProvider>(
            create: (_) => RegisterButtonProvider()),
        ChangeNotifierProvider(create: (_) => CarsDataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login Design',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashPage(),
      ),
    );
  }
}
