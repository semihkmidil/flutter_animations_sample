import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../app_core/ui/ui_stateful.dart';
import '../app_core/constants/page_routes.dart';

class FadeScaleTransitionSample extends StatefulWidget {
  @override
  _FadeScaleTransitionSampleState createState() => _FadeScaleTransitionSampleState();
}

class _FadeScaleTransitionSampleState extends UiStateful<FadeScaleTransitionSample> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  bool isAnimationCanForward=true;

  @override
  void initState() {
    _animationController=AnimationController(
        value: 0.0,
        duration: Duration(seconds: 2),
        reverseDuration: Duration(seconds: 2),
        vsync: this
    );

    _animationController.addStatusListener((status) {
      isAnimationCanForward=(status==AnimationStatus.dismissed||status==AnimationStatus.reverse);
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    uiInit(pageRoute: PageRoutes.FADE_SCALE_TRANSITION_SAMPLE, context: context);
    return page(
        appBar: appBar(leading: backButton),
        body: mainScreen,
        floatingActionButton: floatingActionIconButton(
            icon: Icons.remove_red_eye_outlined,
            onPressed: ()=>isAnimationCanForward?_animationController.forward():_animationController.reverse()
        ),
        isLoading: false
    );
  }

  Widget get mainScreen=>SizedBox(
    child: Container(
      child: pageCenteredPageElementsContainer(
          pageElements: [
            Container(
              child: AnimatedBuilder(
                animation: _animationController,
                child: FadeScaleTransition(
                  child: Container(
                    child: Text(language["fadedText"], style: pageCenterTitleTextStyle, textAlign: TextAlign.center),
                    alignment: Alignment.center,
                    width: 150.0,
                    height: 150.0,
                    color: Colors.grey[600].withOpacity(0.2),
                  ),
                  animation: _animationController,
                ),
                builder: (context, child) => child,
              ),
              alignment: Alignment.center,
              width: double.infinity,
              height: screenHeight*0.4,
            ),
            pageCenterTitle(title: language["mainScreenTitle"]),
            SizedBox(height: 5.0),
            pageCenterText(text: language["pageNote"])
          ]
      ),
      color: bodyBackgroundColor,
      width: double.infinity,
      height: double.infinity,
    ),
  );
}
