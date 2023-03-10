import 'package:flutter/material.dart';

class BottomAppBarHome extends StatelessWidget {
  const BottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      child: TabBar(
        labelColor: Colors.black,
        tabs: [
          Tab(
            text: "Home",
            icon: Icon(Icons.home_outlined),
          ),
          Tab(
            text: "Weather",
            icon: Icon(Icons.add_location),
          ),
        ],
      ),
    );
  }
}
