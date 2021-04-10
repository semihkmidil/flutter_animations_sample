import 'package:flutter/material.dart';
import 'inavigation_service.dart';

class NavigationService implements INavigationService{
  static NavigationService _instance=NavigationService._init();
  static NavigationService get instance=>_instance;
  NavigationService._init();

  GlobalKey<NavigatorState> _navigatorKey=GlobalKey();
  GlobalKey<NavigatorState> get navigatorKey=>_navigatorKey;

  void pushNamed({String routeName, Object arguments}) async{
    await _navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementNamed({String routeName, Object arguments}) async{
    await _navigatorKey.currentState.pushReplacementNamed(routeName);
  }
  void pushAndRemoveUntil({String routeName, Object arguments}) async{
    await _navigatorKey.currentState.pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false, arguments: arguments);
  }

  void pop()=>_navigatorKey.currentState.pop();
}