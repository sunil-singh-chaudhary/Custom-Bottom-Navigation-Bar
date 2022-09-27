import 'package:flutter/material.dart';
import 'package:navigatiobar_diy_style/Page1.dart';
import 'package:navigatiobar_diy_style/Page2.dart';
import 'package:navigatiobar_diy_style/Page3.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator({this.navigatorKey, this.tabName});
  final GlobalKey<NavigatorState>? navigatorKey;
  final String? tabName;

  @override
  Widget build(BuildContext context) {
    Widget? child;

    if (tabName == "Page1") {
      child = const Page1();
    } else if (tabName == "Page2") {
      child = const Page2();
    } else if (tabName == "Page3") {
      child = const Page3();
    }

    return Navigator(
      key: navigatorKey!,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child!);
      },
    );
  }
}
