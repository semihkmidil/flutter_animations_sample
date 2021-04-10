import 'package:flutter/material.dart';
import '../../enums/theme_location.dart';
import 'package:flutter_animations_sample/app_core/services/shared_preferences_service/shared_preferences_service.dart';

mixin UiTheme{
  String get uiThemeName=>SharedPreferencesService.uiTheme;
  setUiTheme({String uiThemeName}) async {
    await SharedPreferencesService.setUiTheme(uiTheme: uiThemeName);
  }

  Map<ThemeLocation, Color> getUiThemeMap(){
    switch(uiThemeName){
      case("dark"):return darkTheme;break;
      case("light"):return lightTheme;break;
      default:return lightTheme;
    }
  }

  Map<ThemeLocation, Color> get lightTheme=>{
    ThemeLocation.appBarBackgroundColor:Colors.grey[200],
    ThemeLocation.appBarContentColor:Colors.grey[800],
    ThemeLocation.bodyBackgroundColor:Colors.grey[50],
    ThemeLocation.bodyContentColor:Colors.grey[700],
    ThemeLocation.buttonColor:Colors.grey[200],
    ThemeLocation.buttonTextColor:Colors.grey[600]
  };

  Map<ThemeLocation, Color> get darkTheme=>{
    ThemeLocation.appBarBackgroundColor:Colors.blueGrey[800],
    ThemeLocation.appBarContentColor:Colors.blueGrey[100],
    ThemeLocation.bodyBackgroundColor:Colors.blueGrey[700],
    ThemeLocation.bodyContentColor:Colors.blueGrey[200],
    ThemeLocation.buttonColor:Colors.blueGrey[500],
    ThemeLocation.buttonTextColor:Colors.blueGrey[100]
  };
}