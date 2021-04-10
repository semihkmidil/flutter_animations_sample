import 'package:flutter/material.dart';
import '../../enums/text_style_location.dart';

mixin UiTextStyles{
  Map<TextStyleLocation, TextStyle> getUiTextStyleMap({Color appBarContentColor, Color bodyContentColor, Color buttonTextColor})=>textStyleMap(appBarContentColor: appBarContentColor, buttonTextColor: buttonTextColor, bodyContentColor: bodyContentColor);

  Map<TextStyleLocation, TextStyle> textStyleMap({Color appBarContentColor, Color bodyContentColor, Color buttonTextColor})=>{
    TextStyleLocation.appBarTitleTextStyle:TextStyle(color: appBarContentColor),
    TextStyleLocation.alertDialogTitleTextStyle:TextStyle(color: bodyContentColor),
    TextStyleLocation.pageCenterTitleTextStyle:TextStyle(color: bodyContentColor, fontSize: 22.0),
    TextStyleLocation.pageCenterTextTextStyle:TextStyle(color: bodyContentColor, fontSize: 15.0),
    TextStyleLocation.pageNumbContainerTextStyle:TextStyle(fontSize:20.0, fontWeight:FontWeight.w600, color: buttonTextColor),
    TextStyleLocation.textButtonTextStyle:TextStyle(fontSize: 17.0, color: buttonTextColor)
  };
}