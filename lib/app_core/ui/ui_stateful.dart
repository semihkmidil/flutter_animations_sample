import 'package:flutter/material.dart';
import 'components/ui_common_components.dart';
import 'components/sub_components/ui_language.dart';
import 'components/sub_components/ui_text_styles.dart';
import 'components/sub_components/ui_theme.dart';
import 'package:meta/meta.dart';

abstract class UiStateful<T extends StatefulWidget> extends State<T> with UiCommonComponents, UiLanguage, UiTheme, UiTextStyles{
  double get screenWidth=>MediaQuery.of(context).size.width;
  double get screenHeight=>MediaQuery.of(context).size.height;

  uiInit({@required BuildContext context, @required String pageRoute}){
    uiContext=context;
    colors=getUiThemeMap();
    language=getUiLanguageMap(pageRoute: pageRoute);
    textStyles=getUiTextStyleMap(appBarContentColor: appBarContentColor, bodyContentColor: bodyContentColor, buttonTextColor: buttonTextColor);
  }

}