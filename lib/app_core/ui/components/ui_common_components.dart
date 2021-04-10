import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../enums/text_style_location.dart';
import '../enums/theme_location.dart';

mixin UiCommonComponents{
  BuildContext uiContext;
  Map<String, dynamic> language;
  Map<ThemeLocation, Color> colors;
  Map<TextStyleLocation, TextStyle> textStyles;

  String get appBarTitle=>language["appBarTitle"];

  Color get appBarBackgroundColor=>colors[ThemeLocation.appBarBackgroundColor];
  Color get appBarContentColor=>colors[ThemeLocation.appBarContentColor];
  Color get bodyBackgroundColor=>colors[ThemeLocation.bodyBackgroundColor];
  Color get bodyContentColor=>colors[ThemeLocation.bodyContentColor];
  Color get buttonColor=>colors[ThemeLocation.buttonColor];
  Color get buttonTextColor=>colors[ThemeLocation.buttonTextColor];

  TextStyle get appBarTitleTextStyle=>textStyles[TextStyleLocation.appBarTitleTextStyle];
  TextStyle get alertDialogTitleTextStyle=>textStyles[TextStyleLocation.alertDialogTitleTextStyle];
  TextStyle get pageCenterTitleTextStyle=>textStyles[TextStyleLocation.pageCenterTitleTextStyle];
  TextStyle get pageCenterTextTextStyle=>textStyles[TextStyleLocation.pageCenterTextTextStyle];
  TextStyle get pageNumbContainerTextStyle=>textStyles[TextStyleLocation.pageNumbContainerTextStyle];
  TextStyle get textButtonTextStyle=>textStyles[TextStyleLocation.textButtonTextStyle];


  Scaffold page({@required Widget body, Widget appBar, Widget floatingActionButton, @required bool isLoading})=>isLoading?loadingPage:Scaffold(
      appBar: appBar,
      body: body,
      backgroundColor: bodyBackgroundColor,
      floatingActionButton: floatingActionButton
  );

  AppBar appBar({Widget leading, List<Widget> actionButtons})=>AppBar(
      title: Text(appBarTitle, style: appBarTitleTextStyle),
      leading: leading,
      backgroundColor: appBarBackgroundColor,
      actions: actionButtons,
      centerTitle: true
  );

  BackButton get backButton=>BackButton(color: appBarContentColor, onPressed: ()=>Navigator.pop(uiContext));

  Container pageCenteredPageElementsContainer({@required List<Widget> pageElements})=>Container(
      child: Column(
        children: pageElements,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
      ),
      width: double.infinity,
      height: double.infinity
  );


  Container pageElementsContainer({@required List<Widget> pageElements})=>Container(
      child: SingleChildScrollView(
        child: Column(
            children: pageElements,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center
        ),
      ),
      color: bodyBackgroundColor,
      width: double.infinity,
      height: double.infinity
  );

  Scaffold get loadingPage=>Scaffold(
      body: Container(
          child: TweenAnimationBuilder(
              tween: Tween<double>(
                  begin: 0.0,
                  end: 100.0
              ),
              duration: Duration(seconds: 1),
              builder: (context, value, child) => Container(
                  decoration: BoxDecoration(
                      color: bodyContentColor.withOpacity(value/100),
                      shape: BoxShape.circle
                  ),
                  width: value,
                  height: value
              )
          ),
          alignment: Alignment.center,
          color: bodyBackgroundColor,
          width:double.infinity,
          height: double.infinity
      )
  );

  Widget pageCenterTitle({@required String title})=>Container(
      child: Text(title, style: pageCenterTitleTextStyle)
  );

  Widget pageCenterText({@required String text})=>Container(
      child: Text(text, style: pageCenterTextTextStyle, textAlign: TextAlign.center)
  );

  Widget pageNumbContainer({@required int pageNumber})=>Container(
      child: Text(pageNumber.toString(), style: pageNumbContainerTextStyle),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: buttonColor
      ),
      width: 40.0,
      height: 40.0
  );

  TextButton textButton({@required String buttonText, @required Function onPressed})=>TextButton(
    child: Text(buttonText, style: textButtonTextStyle),
    onPressed: onPressed,
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) => buttonColor),
        overlayColor: MaterialStateProperty.resolveWith((states) => Colors.transparent)
    ),
  );


  Widget floatingActionIconButton({@required IconData icon, @required Function onPressed})=>FloatingActionButton(
    child: Icon(icon, color: buttonTextColor),
    onPressed: onPressed,
    backgroundColor: buttonColor,
  );

  IconButton appBarIconButton({@required IconData icon, @required Function onPressed})=>IconButton(
      icon: Icon(icon, color: appBarContentColor),
      onPressed: onPressed
  );

  IconButton bodyIconButton({@required IconData icon, @required Function onPressed})=>IconButton(
      icon: Icon(icon, color: buttonTextColor),
      color: buttonColor,
      onPressed: onPressed
  );
}