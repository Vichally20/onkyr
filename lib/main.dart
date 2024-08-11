import 'package:flutter/material.dart';
import 'package:onkyr/main_layout.dart';
import 'package:onkyr/screens/auth.dart';
import 'package:onkyr/screens/booking_page.dart';
import 'package:onkyr/screens/successpage.dart';
import 'package:onkyr/utils/config.dart';
import 'package:onkyr/nwo/stat_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorkey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorkey,
      title: 'SEKT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorder,
          floatingLabelStyle: TextStyle(color: Config.primaryColor),
          prefixIconColor: Colors.black38,
        ),
        scaffoldBackgroundColor: Color(0xFFD6E8EE),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context)=>const AuthPage(),
        'main': (context)=>const MainLayout(),
        'stat_detail': (context)=>const StatDetail(),
        'booking': (context)=>const BookingPage(),
        'successpage': (context)=>const AppointmentBooked(),
      },

    );
  }
}
