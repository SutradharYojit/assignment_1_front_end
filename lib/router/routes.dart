import 'package:assignment_1/router/routes_name.dart';
import 'package:assignment_1/view/view.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RoutesName.homeScreen,
      builder: (context, state) {
        return const MyHomePage();
      },
    ),
    GoRoute(
      path: RoutesName.aboutScreen,
      builder: (context, state) {
        return const AboutScreen();
      },
    ),
    GoRoute(
      path: RoutesName.apiScreen,
      builder: (context, state) {
        return const ApiScreen();
      },
    ),
  ],
);
