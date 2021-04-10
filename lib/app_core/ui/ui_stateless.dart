import 'package:flutter/material.dart';
import 'components/ui_common_components.dart';
import 'components/sub_components/ui_language.dart';
import 'components/sub_components/ui_text_styles.dart';
import 'components/sub_components/ui_theme.dart';

// ignore: must_be_immutable
abstract class UiStateless extends StatelessWidget with UiCommonComponents, UiLanguage, UiTheme, UiTextStyles{
  uiInit({BuildContext context, String pageRoute}){
    uiContext=context;
    colors=getUiThemeMap();
    language=getUiLanguageMap(pageRoute: pageRoute);
    textStyles=getUiTextStyleMap(appBarContentColor: appBarContentColor, bodyContentColor: bodyContentColor, buttonTextColor: buttonTextColor);
  }
}