import 'package:auto_route/auto_route.dart';
import 'package:myblog/presentation/screens/main/main_screen.dart';

// flutter pub run build_runner watch --delete

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CustomRoute(
      initial: true,
      page: MainScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ],
)
class $AppRouter {}
