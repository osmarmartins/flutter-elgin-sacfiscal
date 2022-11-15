import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdvandroid_flutter/application/application_bindings.dart';
import 'package:pdvandroid_flutter/application/application_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sembast/entity/configuracoes_entity.dart';

class ApplicationWidget extends StatefulWidget {
  const ApplicationWidget({Key? key}) : super(key: key);

  @override
  _ApplicationWidgetState createState() => _ApplicationWidgetState();
}

class _ApplicationWidgetState extends State<ApplicationWidget> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SAC Fiscal - PDV Mobile Android',
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      getPages: ApplicationPages.routes,
      initialRoute:
          Get.find<ConfigruacoesEntity>().logado == false ? ApplicationPages.initialRoute : ApplicationRoutes.launcher,
      navigatorObservers: [
        Get.find<RouteObserver>(),
      ],
      enableLog: true,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      defaultTransition: Transition.fadeIn,
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialBinding: ApplicationBinding(),
      supportedLocales: [
        const Locale('pt', 'BR'),
      ],
    );
  }
}
