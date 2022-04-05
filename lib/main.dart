// @dart=2.9

import 'package:flutter/material.dart';
import 'package:budgetapp/widgets/bottom_navigation_bar_widget.dart';

/* referenced from https://github.com/Kalpesh209/flutter_budget_tracking_app */

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Userdashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BottomNavigationBarWidget(),
    );
  }
}
