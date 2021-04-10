import 'package:flutter/material.dart';
import '../app_core/ui/ui_stateful.dart';
import 'package:animations/animations.dart';
import 'package:flutter_animations_sample/app_core/constants/page_routes.dart';

class FadeThroughSample extends StatefulWidget {
  @override
  _FadeThroughSampleState createState() => _FadeThroughSampleState();
}

class _FadeThroughSampleState extends UiStateful<FadeThroughSample>{
  bool isFirstPage=true;

  @override
  Widget build(BuildContext context){
    uiInit(pageRoute: PageRoutes.FADE_THROUGH_SAMPLE, context: context);

    return page(
      appBar: appBar(leading: backButton),
      body: pageTransitionSwitcher,
      floatingActionButton: floatingActionButton,
      isLoading: false,
    );
  }

  Widget get pageTransitionSwitcher=>PageTransitionSwitcher(
    duration: Duration(seconds: 5),
    reverse: isFirstPage,
    child: isFirstPage? firstPage : secondPage,
    transitionBuilder: (child, primaryAnimation, secondaryAnimation) => FadeThroughTransition(
      child: child,
      fillColor: bodyBackgroundColor,
      animation: primaryAnimation,
      secondaryAnimation: secondaryAnimation
    ),
  );

  Widget get firstPage=>SizedBox(
    child: Container(
      child: pageCenteredPageElementsContainer(
          pageElements: [
            pageNumbContainer(pageNumber: 1),
            SizedBox(height: 10.0),
            pageCenterTitle(title: language["firstPageTitle"]),
            SizedBox(height: 5.0),
            pageCenterText(text: language["pageNote"])
          ]
      ),
      color: bodyBackgroundColor,
      width: double.infinity,
      height: double.infinity,
    ),
  );

  Widget get secondPage=>Container(
      child:  pageCenteredPageElementsContainer(
          pageElements: [
            pageNumbContainer(pageNumber: 2),
            SizedBox(height: 10.0),
            pageCenterTitle(title: language["firstPageTitle"]),
            SizedBox(height: 5.0),
            pageCenterText(text: language["pageNote"])
          ]
      ),
      color: bodyBackgroundColor,
      width: double.infinity,
      height: double.infinity
  );


  Widget get floatingActionButton=>floatingActionIconButton(
    icon: Icons.refresh,
    onPressed: ()=>setState((){
      isFirstPage=!isFirstPage;
    }),
  );
}
