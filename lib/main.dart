import 'package:flutter/material.dart';
import 'app_core/constants/page_routes.dart';
import 'app_core/services/navigation_service/navigation_service.dart';
import 'app_core/services/shared_preferences_service/shared_preferences_service.dart';
import 'view/container_transform_sample.dart';
import 'view/fade_scale_transition_sample.dart';
import 'view/show_modal_sample.dart';
import 'view/fade_through_sample.dart';
import 'view/home_page.dart';
import 'view/shared_axis_sample.dart';
//import 'package:animations/animations.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context)=>MaterialApp(
    title: 'Flutter Demo',
    initialRoute: PageRoutes.HOME_PAGE,
    navigatorKey: NavigationService.instance.navigatorKey,
    routes: routes,
   theme: Theme.of(context).copyWith(
     primaryColor: Colors.grey[300]
   )

   /*
    theme: Theme.of(context).copyWith(
      pageTransitionsTheme: /*
      const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: FadeThroughPageTransitionsBuilder()
        },
      ),
      */

        /*
        const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.horizontal
          ),
        },
         */
      ),
    ),
    */
  );

  Map<String, WidgetBuilder> get routes=>{
    PageRoutes.HOME_PAGE:(context)=>HomePage(),
    PageRoutes.CONTAINER_TRANSFORM_SAMPLE:(context)=>ContainerTransformSample(),
    PageRoutes.SHARED_AXIS_SAMPLE:(context)=>SharedAxisSample(),
    PageRoutes.FADE_THROUGH_SAMPLE:(context)=>FadeThroughSample(),
    PageRoutes.SHOW_MODAL_SAMPLE:(context)=>ShowModalSample(),
    PageRoutes.FADE_SCALE_TRANSITION_SAMPLE:(context)=>FadeScaleTransitionSample()
  };
}
