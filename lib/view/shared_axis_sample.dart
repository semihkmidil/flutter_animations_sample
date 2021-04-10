import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../app_core/ui/ui_stateful.dart';
import '../app_core/constants/page_routes.dart';


class SharedAxisSample extends StatefulWidget {
  @override
  _SharedAxisSampleState createState() => _SharedAxisSampleState();
}

class _SharedAxisSampleState extends UiStateful<SharedAxisSample> {
  bool isFirstPage=true;

  @override
  Widget build(BuildContext context){
    uiInit(pageRoute: PageRoutes.SHARED_AXIS_SAMPLE, context: context);

    return page(
        appBar: appBar(leading: backButton),
        floatingActionButton: floatingActionButton,
        body: pageTransitionSwitcher,
        isLoading: false
    );
  }

  Widget get pageTransitionSwitcher=>PageTransitionSwitcher(
    duration: Duration(seconds: 3),
    reverse: isFirstPage,
    child: isFirstPage? firstPage : secondPage,
    transitionBuilder: (child, primaryAnimation, secondaryAnimation) => SharedAxisTransition(
        fillColor: bodyBackgroundColor,
        child: child,
        animation: primaryAnimation,
        secondaryAnimation: secondaryAnimation,
        transitionType: SharedAxisTransitionType.vertical
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
          pageCenterTitle(title: language["secondPageTitle"]),
          SizedBox(height: 5.0),
          pageCenterText(text: language["pageNote"])
        ]
    ),
      color: bodyBackgroundColor,
      width: double.infinity,
      height: double.infinity
  );

  Widget get floatingActionButton=>floatingActionIconButton(
    icon: isFirstPage?Icons.arrow_drop_down:Icons.arrow_drop_up,
    onPressed: ()=>setState((){
      isFirstPage=!isFirstPage;
    }),
  );
}
