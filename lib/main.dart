import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/routes/app_routes.dart';
import 'package:movies/core/routes/page_route_name.dart';
import 'package:movies/core/theme/theme_manager.dart';

import 'core/di/di.dart';
import 'feature/home_screen/modules/home/bloc/bloc.dart';
import 'feature/home_screen/modules/home/repository/movies_repository.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  runApp(
    RepositoryProvider(
      create: (_) => MoviesRepository(),
      child: BlocProvider(
        create: (context) => MoviesBloc(context.read<MoviesRepository>()),
        child: const MyApp(),
      ),
    ),
  );
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

          initialRoute: PageRouteName.homePage,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },

    );
  }
}


