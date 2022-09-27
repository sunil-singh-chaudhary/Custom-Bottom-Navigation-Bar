import 'package:flutter/material.dart';
import 'package:navigatiobar_diy_style/tab_navigator.dart';

/////////////////////////////////////////////////////////////////////////////
/// DIY NAVIGATOR SOLUTION
////////////////////////////////////////////////////////////////////////////
class DIYBottomNavigationBar extends StatefulWidget {
  const DIYBottomNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() => DIYBottomNavigationBarState();
}

class DIYBottomNavigationBarState extends State<DIYBottomNavigationBar> {
  String _currentPage = "Page1";
  List<String> pageKeys = ["Page1", "Page2", "Page3"];
  int _selectedIndex = 0;

  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Page1") {
            _selectTab("Page1", 0);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: [
          _buildOffstageNavigator("Page1"),
          _buildOffstageNavigator("Page2"),
          _buildOffstageNavigator("Page3"),
        ]),
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 6,
                offset: const Offset(0, -10),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.blueAccent,
              onTap: (int index) {
                _selectTab(pageKeys[index], index);
              },
              currentIndex: _selectedIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.looks_one),
                  label: 'First',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.looks_two),
                  label: 'Sec',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.looks_3),
                  label: 'Third',
                ),
              ],
              type: BottomNavigationBarType.fixed,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String pageName) {
    return Offstage(
      offstage: _currentPage != pageName,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[pageName],
        tabName: pageName,
      ),
    );
  }

  void _selectTab(String tabName, int index) {
    if (tabName == _currentPage) {
      _navigatorKeys[tabName]?.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }
}
