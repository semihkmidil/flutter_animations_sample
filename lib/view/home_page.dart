import 'package:flutter/material.dart';
import '../app_core/ui/ui_stateful.dart';
import '../app_core/constants/page_routes.dart';
import '../app_core/services/navigation_service/navigation_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends UiStateful<HomePage>{
  @override
  Widget build(BuildContext context){
    uiInit(pageRoute: PageRoutes.HOME_PAGE, context: context);
    return page(
        appBar: appBar(actionButtons: actionButtons),
        body: getPageCenteredPageElementsContainer,
        isLoading: false
    );
  }

  Widget get getPageCenteredPageElementsContainer=>pageCenteredPageElementsContainer(
    pageElements: pageElements
  );

  List<Widget> get pageElements=>[
    textButton(buttonText: "Container Transform", onPressed: ()=>NavigationService.instance.pushNamed(routeName: PageRoutes.CONTAINER_TRANSFORM_SAMPLE)),
    textButton(buttonText: "Shared Axis", onPressed: ()=>NavigationService.instance.pushNamed(routeName: PageRoutes.SHARED_AXIS_SAMPLE)),
    textButton(buttonText: "Fade Through", onPressed: ()=>NavigationService.instance.pushNamed(routeName: PageRoutes.FADE_THROUGH_SAMPLE)),
    textButton(buttonText: "Show Modal", onPressed: ()=>NavigationService.instance.pushNamed(routeName: PageRoutes.SHOW_MODAL_SAMPLE)),
    textButton(buttonText: "Fade Scale Transition", onPressed: ()=>NavigationService.instance.pushNamed(routeName: PageRoutes.FADE_SCALE_TRANSITION_SAMPLE)),
  ];

  List<Widget> get actionButtons=>[
    appBarIconButton(
        icon: Icons.brightness_4,
        onPressed: ()async{
          await setUiTheme(uiThemeName: uiThemeName=="light"?"dark":"light");
          setState((){});
        }
    ),
    appBarIconButton(
        icon: Icons.translate,
        onPressed: ()async{
          await setUiLanguage(uiLanguage: uiLanguage=="tr"?"en":"tr");
          setState((){});
        }
    )
  ];
}

