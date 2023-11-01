import 'package:appariteurs/page/home/homeScreen.dart';
import 'package:appariteurs/page/mission/missionScreen.dart';
import 'package:appariteurs/page/planning/planningScreen.dart';
import 'package:appariteurs/page/proces_verbale/pvScreen.dart';
import 'package:appariteurs/page/profile/profileScreen.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  PlanningScreen.routeName: (context) => PlanningScreen(),
  MissionScreen.routeName: (context) => MissionScreen(),
  PvScreen.routeName: (context) => PvScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),

};
