import 'package:flutter/material.dart';
import 'package:some_advanced/flutter_nav_and_route/routes.dart';
import 'package:some_advanced/flutter_nav_and_route/widget.dart';
import 'app_route.dart';
import 'home_argument.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(Routes.title),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HeaderWidget(title: 'Login Page'),
          ElevatedButton(
            child: const Text('Replace: Home (Login)'),
            onPressed: () {
              const args = HomeArguments(userToken: 'MyUserToken');
              
              Navigator.pushNamedAndRemoveUntil(
                context, 
                AppRoutes.home,
                ModalRoute.withName('/'),
                arguments: args,
              );
            }
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            child: const Text('Pop: Splash'),
            onPressed: () => Navigator.pop(context)
          )
        ],
      ),
    ),
  );
}