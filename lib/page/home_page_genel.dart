import 'package:flutter/material.dart';
import 'package:ne_ekersin_project/page/home_page.dart';
import 'package:ne_ekersin_project/page/weather_page.dart';
import 'package:ne_ekersin_project/widget/bottom_appbar_home.dart';

class HomePageGenel extends StatelessWidget {
  const HomePageGenel({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: const BottomAppBarHome(),
        body: TabBarView(
          children: [
            HomePage(),
            WeatherPage(),
          ],
        ),
      ),
    );
  }
}
