import 'package:flutter/material.dart';
import '../../app_core/ui/ui_stateless.dart';
import '../../app_core/constants/page_routes.dart';

// ignore: must_be_immutable
class ContainerTransformSecondaryPage extends UiStateless {
  @override
  Widget build(BuildContext context) {
    uiInit(pageRoute: PageRoutes.CONTAINER_TRANSFORM_SECONDARY_PAGE, context: context);

    return page(
        appBar: appBar(leading: backButton),
        body: pageCenteredPageElementsContainer(
            pageElements: [
              pageCenterTitle(title: language["mainText"]),
              pageCenterText(text: language["subText"])
            ]
        ),
        isLoading: false
    );
  }
}
