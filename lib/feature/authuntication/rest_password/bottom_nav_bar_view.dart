import 'package:flutter/material.dart';
import 'package:movies/core/constants/assets.dart';
import 'package:movies/feature/update_profile/presintation/screens/update_profile_view.dart';

import '../../../browse_tab.dart';
import '../../home_screen/modules/home/presentaion/view/home_screen.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavBarView> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    Center(child: Text("🔍 Search Screen", style: TextStyle(fontSize: 22))),
    BrowseTab(),
    UpdateProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff282A28),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.browseIcn,
              height: 24,
              color: _currentIndex == 2 ? Colors.amber : Colors.white,
            ),
            label: "Browse",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
