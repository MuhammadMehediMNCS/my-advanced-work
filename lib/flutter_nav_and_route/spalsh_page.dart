import 'package:flutter/material.dart';
import 'package:some_advanced/flutter_nav_and_route/routes.dart';
import 'package:some_advanced/flutter_nav_and_route/widget.dart';

import 'app_route.dart';
import 'login_arguments.dart';

class SplashPage extends StatelessWidget {
  
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) => Scaffold(
    key: scaffoldKey,
    appBar: AppBar(
      title: Text(Routes.title),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HeaderWidget(title: 'Splash Page'),
          ElevatedButton(
            child: const Text('Push: Login + Data'),
            onPressed: () {
              const args = LoginArguments(
                username: 'Mehedi Hasan',
                password: 'password'
              );
              Navigator.pushNamed(
                context,
                AppRoutes.login,
                arguments: args,
              );
            }
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            child: const Text('Push: Login + No Data'),
            onPressed: () async {
              await Navigator.pushNamed(
                context,
                AppRoutes.login
              );
            }
          )
        ],
      ),
    ),
  );
}