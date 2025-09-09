import 'package:flutter/material.dart';
import 'package:movies/core/routes/page_route_name.dart';

import '../../feature/authuntication/presentation/screens/login_view.dart';
import '../../feature/update_profile/update_profile_view.dart';

abstract class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.loginView:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
          settings: settings,
        );
      case PageRouteName.uptadeProfileView:
        return MaterialPageRoute(
          builder: (_) => UpdateProfileView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => LoginView());
    }
  }
}
