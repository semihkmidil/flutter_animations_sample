import 'package:flutter/material.dart';
import '../app_core/ui/ui_stateful.dart';
import '../app_core/constants/page_routes.dart';
import 'package:animations/animations.dart';

class ShowModalSample extends StatefulWidget {
  @override
  _ShowModalSampleState createState() => _ShowModalSampleState();
}

class _ShowModalSampleState extends UiStateful<ShowModalSample> {
  @override
  Widget build(BuildContext context) {
    uiInit(pageRoute: PageRoutes.SHOW_MODAL_SAMPLE, context: context);

    return page(
        appBar: appBar(leading: backButton),
        body: mainScreen,
        floatingActionButton: floatingActionButton,
        isLoading: false
    );
  }

  Widget get mainScreen => SizedBox(
    child: Container(
      child: pageCenteredPageElementsContainer(
          pageElements: [
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

  Widget get floatingActionButton => floatingActionIconButton(
      icon: Icons.remove_red_eye_outlined,
      onPressed: () =>
          showModal(
              context: context,
              configuration: FadeScaleTransitionConfiguration(
                  transitionDuration: Duration(seconds: 2)
              ),
              builder: (context) =>
                  AlertDialog(
                    title: Text("Alert Dialog", style: alertDialogTitleTextStyle),
                    content: Container(
                        child: Icon(Icons.report_gmailerrorred_sharp, size: 55.0, color: bodyContentColor),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.symmetric(vertical: BorderSide.none, horizontal: BorderSide(color: bodyContentColor))
                        ),
                        height: screenHeight * 0.4,
                        width: double.infinity
                    ),
                    backgroundColor: bodyBackgroundColor,
                    actions: [
                      IconButton(
                        icon: Icon(Icons.close, color: bodyContentColor),
                        onPressed: () => Navigator.pop(context),
                      ),
                      IconButton(
                        icon: Icon(Icons.done_all, color: bodyContentColor),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  )
          )
  );
}