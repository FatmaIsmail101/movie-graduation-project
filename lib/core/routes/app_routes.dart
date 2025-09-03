import 'package:flutter/material.dart';
import 'package:movies/core/routes/page_route_name.dart';
import 'package:movies/modules/authuntication/login_view.dart';

import '../../modules/authuntication/forget_password_screen.dart';
import '../../modules/authuntication/register_page.dart';
import '../../modules/onboarding/onboarding_intro_screen.dart';
import '../../modules/onboarding/onboarding_screen.dart';
import '../../modules/splash/splash_screen.dart';
import '../../modules/update_profile/update_profile_view.dart';

abstract class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.splashView:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: settings,
        );
      case PageRouteName.intro:
        return MaterialPageRoute(
          builder: (_) => OnboardingIntroScreen(),
          settings: settings,
        );
      case PageRouteName.onboarding:
        return MaterialPageRoute(
          builder: (_) => OnboardingScreen(),
          settings: settings,
        );
      case PageRouteName.loginView:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
          settings: settings,
        );
      case PageRouteName.forgetPasswordView:
        return MaterialPageRoute(
          builder: (_) => ForgetPasswordScreen(),
          settings: settings,
        );
      case PageRouteName.registerView:
        return MaterialPageRoute(
          builder: (_) => RegisterPage(),
          settings: settings,
        );
      case PageRouteName.uptadeProfileView:
        return MaterialPageRoute(
          builder: (_) => UpdateProfileView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
