import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/routes/app_routes.dart';
import 'package:movies/core/routes/page_route_name.dart';
import 'package:movies/core/theme/theme_manager.dart';
import 'package:movies/modules/authuntication/login_view.dart';
import 'package:movies/network/api_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: ApiConstants.baseUrl, anonKey: ApiConstants.apiKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 793),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: AppThemeManager.appTheme,
          title: 'Movie',
            debugShowCheckedModeBanner: false,
          home: LoginView(),
          initialRoute: PageRouteName.loginView,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },

    );
  }
}


