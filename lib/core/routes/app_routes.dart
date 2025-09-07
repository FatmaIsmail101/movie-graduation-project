import 'package:flutter/material.dart';
import 'package:movies/core/routes/page_route_name.dart';
import 'package:movies/modules/authuntication/login_view.dart';
import 'package:movies/modules/update_profile/update_profile_view.dart';

import '../../modules/update_profile/reset_password_view.dart';

abstract class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.loginView:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
          settings: settings,
        );
      case PageRouteName.updateProfileView:
        return MaterialPageRoute(
          builder: (_) => UpdateProfileView(),
          settings: settings,
        );
      case PageRouteName.resetPasswordView:
        return MaterialPageRoute(
          builder: (_) =>ResetPasswordView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => LoginView());
    }
  }
}
