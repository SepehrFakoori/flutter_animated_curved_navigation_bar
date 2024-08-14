import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_curve_navigation_bar/Views/home_screen.dart';
import 'package:flutter_animated_curve_navigation_bar/Views/like_screen.dart';
import 'package:flutter_animated_curve_navigation_bar/Views/profile_screen.dart';
import 'package:flutter_animated_curve_navigation_bar/Views/search_screen.dart';
import 'package:flutter_animated_curve_navigation_bar/Views/setting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      const Icon(
        CupertinoIcons.home,
        color: Colors.white,
      ),
      const Icon(
        CupertinoIcons.search,
        color: Colors.white,
      ),
      const Icon(
        CupertinoIcons.heart_fill,
        color: Colors.white,
      ),
      const Icon(
        CupertinoIcons.settings_solid,
        color: Colors.white,
      ),
      const Icon(
        CupertinoIcons.person_alt,
        color: Colors.white,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Curved Navigation Bar",
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: getScreens(),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: _selectedIndex,
        height: 60,
        color: Colors.black,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 250),
        backgroundColor: Colors.transparent,
        onTap: (index) => setState(() {
          this._selectedIndex = index;
          print(index);
        }),
      ),
    );
  }

  List<Widget> getScreens() {
    return const <Widget>[
      HomeScreen(),
      SearchScreen(),
      LikeScreen(),
      SettingScreen(),
      ProfileScreen(),
    ];
  }
}
