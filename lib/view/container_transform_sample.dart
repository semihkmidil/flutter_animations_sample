import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../app_core/ui/ui_stateless.dart';
import '../app_core/constants/page_routes.dart';
import 'components/container_transform_secondary_page.dart';

// ignore: must_be_immutable
class ContainerTransformSample extends UiStateless{
  @override
  Widget build(BuildContext context){
    uiInit(pageRoute: PageRoutes.CONTAINER_TRANSFORM_SAMPLE, context: context);
    return page(
        appBar: appBar(leading: backButton),
        body: pageCenteredPageElementsContainer(
            pageElements: [
              Container(
                  child: openContainer,
                  height: 100.0,
                  width: 100.0
              )
            ]
        ),
        floatingActionButton: openContainer,
        isLoading: false
    );
  }

  OpenContainer get openContainer=>OpenContainer(
    closedBuilder: (context, action) => Container(
      child: Icon(Icons.add_to_home_screen, color: buttonTextColor),
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)
    ),
    openBuilder: (context, action) => ContainerTransformSecondaryPage(),
    transitionDuration: Duration(seconds: 2),
    closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100))
    ),
    transitionType: ContainerTransitionType.fadeThrough,
    openColor: buttonColor,
    closedColor: buttonColor,
    middleColor: buttonColor
  );
}