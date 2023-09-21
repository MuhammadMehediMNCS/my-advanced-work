import 'package:flutter/material.dart';
import 'package:some_advanced/flutter_nav_and_route/home_page.dart';
import 'package:some_advanced/flutter_nav_and_route/spalsh_page.dart';
import 'app_route.dart';
import 'login_page.dart';

class Routes extends StatelessWidget {
  const Routes({Key? key}) : super(key: key);

  static const String title = 'Navigator 1.0';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primaryColor: Colors.blue),
      initialRoute: getInitialRoute(),
      onGenerateRoute: (route) => getRoute(route),
    );
  }
  String getInitialRoute() => AppRoutes.splash;

  Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return buildRoute(SplashPage(), settings: settings);
      case AppRoutes.login:
        return buildRoute(const LoginPage(), settings: settings);
      case AppRoutes.home:
        return buildRoute(const HomePage(), settings: settings);

      default:
        return buildRoute(const SizedBox.shrink());
    }
  }
  MaterialPageRoute buildRoute(Widget child, {settings}) {
    return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) => child,
    );
  }
}