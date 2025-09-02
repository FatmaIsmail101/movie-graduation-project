import 'package:flutter/material.dart';
import 'package:movies/core/routes/page_route_name.dart';
import 'package:movies/modules/authuntication/login_view.dart';
import 'package:movies/modules/home_screen/home_view.dart';

abstract class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.loginView:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
          settings: settings,
        );
      case PageRouteName.homeView:
        return MaterialPageRoute(
          builder: (_) => HomeView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => LoginView());
    }
  }
}
