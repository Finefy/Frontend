import 'package:flutter/material.dart';
import 'package:budgetapp/common/color_constants.dart';
import 'package:budgetapp/screens/budget_screen.dart';
import 'package:budgetapp/screens/create_budget_screen.dart';
import 'package:budgetapp/screens/daily_screen.dart';
import 'package:budgetapp/screens/profile_screen.dart';
import 'package:budgetapp/screens/stats_screen.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int pageIndex = 0;
  List<Widget> pages = [
    DailyScreen(),
    StatsScreen(),
    BudgetScreen(),
    CreatBudgetScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.md_calendar,
      Ionicons.ios_person,
      Ionicons.md_stats,
      Ionicons.md_wallet,
    ];

    return AnimatedBottomNavigationBar(
      icons: iconItems,
      activeIndex: pageIndex,
      notchSmoothness: NotchSmoothness.softEdge,
      gapLocation: GapLocation.center,
      inactiveColor: Colors.black.withOpacity(0.9),
      onTap: (index) {
        selectedTab(index);
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectedTab(4);
        },
        child: Icon(
          Icons.add,
          size: 20,
        ),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
