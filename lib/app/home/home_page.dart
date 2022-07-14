// package imports
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// application imports
import 'home_bottom_navigation.dart';
import 'home_tab_item.dart';
import 'home_tab_navigator.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // set the state for the current tab
    var _currentTab = useState(TabItem.red);

    // set the navigator keys, one for each page so they all have their own stack
    final _navigatorKeys = {
      TabItem.red: GlobalKey<NavigatorState>(),
      TabItem.green: GlobalKey<NavigatorState>(),
      TabItem.blue: GlobalKey<NavigatorState>(),
      TabItem.colour: GlobalKey<NavigatorState>(),
    };

    // helper function to change tabs
    // if the current tab is selected then pop to the first page in the tab
    // otherwise move to the new tab
    void _selectTab(TabItem tabItem) {
      if (tabItem == _currentTab.value) {
        // pop to first route
        _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
      } else {
        _currentTab.value = tabItem;
      }
    }

    // helper function to build all the stacks
    Widget _buildOffstageNavigator(TabItem tabItem) {
      // use offstage to ensure that each stack can live off screen
      return Offstage(
        // offstage is true when the child should be hidden
        offstage: _currentTab.value != tabItem,
        // build the navigator for each tab
        child: HomeTabNavigator(
          navigatorKey: _navigatorKeys[tabItem],
          tabItem: tabItem,
        ),
      );
    }


    // use WillPopScope to manage back button presses
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab.value != TabItem.red) {
            // select 'main' tab
            _selectTab(TabItem.red);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(

        // use stacks to build all the navigators
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.red),
          _buildOffstageNavigator(TabItem.green),
          _buildOffstageNavigator(TabItem.blue),
          _buildOffstageNavigator(TabItem.colour),
        ]),

        //
        bottomNavigationBar: HomeBottomNavigation(
          currentTab: _currentTab.value,
          onSelectTab: _selectTab,
        ),
        backgroundColor: Colors.amber,
      ),
    );
  }
}




