import 'package:flutter/material.dart';
import 'package:movies/core/routes/page_route_name.dart';

import '../../feature/authuntication/forget_password_screen.dart';
import '../../feature/authuntication/presentation/screens/login_view.dart';
import '../../feature/authuntication/register_page.dart';
import '../../feature/authuntication/rest_password/bottom_nav_bar_view.dart';
import '../../feature/authuntication/rest_password/reset_password_view.dart';
import '../../feature/home_screen/modules/home/presentaion/view/home_screen.dart';
import '../../feature/home_screen/modules/movie_details/presntation/details/movie_details_page.dart';
import '../../feature/update_profile/presintation/screens/update_profile_view.dart';
import '../../modules/onboarding/onboarding_intro_screen.dart';
import '../../modules/onboarding/onboarding_screen.dart';
import '../../modules/splash/splash_screen.dart';

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
      case PageRouteName.restPass:
        return MaterialPageRoute(
          builder: (_) => ResetPasswordView(),
          settings: settings,
        );
      case PageRouteName.bottomBar:
        return MaterialPageRoute(
          builder: (_) => BottomNavBarView(),
          settings: settings,
        );
      case PageRouteName.registerView:
        return MaterialPageRoute(
          builder: (_) => RegisterPage(),
          settings: settings,
        );
      case PageRouteName.homePage:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );
      case PageRouteName.browse:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: settings,
        );
      case PageRouteName.uptadeProfileView:
        return MaterialPageRoute(
          builder: (_) => UpdateProfileView(),
          settings: settings,
        );

      case PageRouteName.movieDetails:
        final movieId = settings.arguments as int; // هنا بتاخدي الـ id

        return MaterialPageRoute(
          builder: (_) => MovieDetailsPage(movieId: movieId,),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}