import '../../../constants/page_routes.dart';
import '../../../services/shared_preferences_service/shared_preferences_service.dart';

mixin UiLanguage{
  String get uiLanguage=>SharedPreferencesService.uiLanguage;
  setUiLanguage({String uiLanguage}) async{
    await SharedPreferencesService.setUiLanguage(uiLanguage: uiLanguage);
  }

  Map<String, dynamic> getUiLanguageMap({String pageRoute}){
    switch(pageRoute){
      case(PageRoutes.HOME_PAGE):return homePage[uiLanguage];break;
      case(PageRoutes.CONTAINER_TRANSFORM_SAMPLE):return containerTransformSample[uiLanguage];break;
      case(PageRoutes.SHARED_AXIS_SAMPLE):return sharedAxisSample[uiLanguage];break;
      case(PageRoutes.FADE_THROUGH_SAMPLE):return fadeThroughSample[uiLanguage];break;
      case(PageRoutes.SHOW_MODAL_SAMPLE):return showModalSample[uiLanguage];break;
      case(PageRoutes.CONTAINER_TRANSFORM_SECONDARY_PAGE):return containerTransformSecondaryPage[uiLanguage];break;
      case(PageRoutes.FADE_SCALE_TRANSITION_SAMPLE):return fadeScaleTransitionSample[uiLanguage];break;
      default:return homePage["en"]; //maybe error page ?
    }
  }

  Map<String, dynamic> get homePage=>{
    "tr":{
      "appBarTitle":"Anasayfa"
    },
    "en":{
      "appBarTitle":"Homepage"
    }
  };

  Map<String, dynamic> get containerTransformSample=>{
    "tr":{
      "appBarTitle":"Container Transform Örneği"
    },
    "en":{
      "appBarTitle":"Container Transform Sample"
    }
  };

  Map<String, dynamic> get containerTransformSecondaryPage=>{
    "tr":{
      "appBarTitle":"İkincil Sayfa",
      "mainText":"Animasyonu Göster!",
      "subText":"Ama zaten animasyonu\ngördün!"
    },
    "en":{
      "appBarTitle":"Container Transform Sample",
      "mainText":"Show The Animation!",
      "subText":"But you already saw\nthe animation!"
    }
  };

  Map<String, dynamic> get sharedAxisSample=>{
    "tr":{
      "appBarTitle":"Shared Axis Örneği",
      "firstPageTitle":"İlk Sayfa",
      "secondPageTitle":"İkinci Sayfa",
      "pageNote":"Animasyonu Görüntülemek İçin\nButona Tıklayın"
    },
    "en":{
      "appBarTitle":"Shared Axis Sample",
      "firstPageTitle":"First Page",
      "secondPageTitle":"Second Page",
      "pageNote":"For Animation Show\nClick The Button"
    }
  };

  Map<String, dynamic> get fadeThroughSample=>{
    "tr":{
      "appBarTitle":"Fade Through Örneği",
      "firstPageTitle":"İlk Sayfa",
      "pageNote":"Animasyonu Görüntülemek İçin\nButona Tıklayın"
    },
    "en":{
      "appBarTitle":"Fade Through Sample",
      "firstPageTitle":"First Page",
      "pageNote":"For Animation Show\nClick The Button"
    }
  };

  Map<String, dynamic> get showModalSample=>{
    "tr":{
      "appBarTitle":"Show Modal Örneği",
      "mainScreenTitle":"Ana Ekran",
      "pageNote":"Animasyonu Görüntülemek İçin\nButona Tıklayın"
    },
    "en":{
      "appBarTitle":"Show Modal Sample",
      "mainScreenTitle":"Main Screen",
      "pageNote":"For Animation Show\nClick The Button"
    }
  };

  Map<String, dynamic> get fadeScaleTransitionSample=>{
    "tr":{
      "appBarTitle":"Fade Scale Transition Örneği",
      "mainScreenTitle":"Ana Ekran",
      "pageNote":"Animasyonu Görüntülemek İçin\nButona Tıklayın",
      "fadedText":"Şimdi gizleyebilirsin!"
    },
    "en":{
      "appBarTitle":"Fade Scale Transition Sample",
      "mainScreenTitle":"Main Screen",
      "pageNote":"For Animation Show\nClick The Button",
      "fadedText":"You can reverse\nnow!"
    }
  };
}