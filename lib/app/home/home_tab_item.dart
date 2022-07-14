// package import
import 'package:flutter/material.dart';

// application imports
import '../../constants/constants.dart';

enum TabItem { red, green, blue, colour }

const Map<TabItem, String> tabName = {
  TabItem.red: constNavigationNameRed,
  TabItem.green: constNavigationNameGreen,
  TabItem.blue: constNavigationNameBlue,
  TabItem.colour: constNavigationNameColour
};

const Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.red: constNavigationColorRed,
  TabItem.green: constNavigationColorGreen,
  TabItem.blue: constNavigationColorBlue,
  TabItem.colour: constNavigationColorColour,
};

const Map<TabItem, IconData> tabIcon = {
  TabItem.red: constNavigationIconRed,
  TabItem.green: constNavigationIconGreen,
  TabItem.blue: constNavigationIconBlue,
  TabItem.colour: constNavigationIconColour,
};
