
import 'package:flutter/material.dart';

import '../modules/home/view/home_view.dart';
import '../modules/offline/offline/offline.view.dart';
import '../modules/sign_in/view/sign_in_view.dart';
import '../modules/splash/views/splash_view.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash:  (context) => const SplashView(),
    Routes.signIn:  (context) => const SignInView(),
    Routes.home:    (context) => const HomeView(),
    Routes.offline: (context) => const OffLineView()
  };
}
