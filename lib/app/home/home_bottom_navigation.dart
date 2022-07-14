// package imports
import 'package:flutter/material.dart';

// application imports
import '../../constants/constants.dart';
import 'home_tab_item.dart';

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {

    // build the bottom navigation bar holding the navigation stacks
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(TabItem.red),
        _buildItem(TabItem.green),
        _buildItem(TabItem.blue),
        _buildItem(TabItem.colour),
      ],

      // pass the ontap to the onSelectTab function passed into the constructor
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
      selectedItemColor: activeTabColor[currentTab]!,
    );
  }

  // define the navigation item
  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(
        tabIcon[tabItem],
        color: _colorTabMatching(tabItem),
      ),
      label: tabName[tabItem],
    );
  }

  // set the color of the tab depending if it is active or not
  Color _colorTabMatching(TabItem item) {
    return currentTab == item ? activeTabColor[item]! : constNavigationColorUnselected;
  }
}