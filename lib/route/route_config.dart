import 'package:clone_app_amazon/animations/TransitionPage.dart';
import 'package:clone_app_amazon/constants/global_variables.dart';
import 'package:clone_app_amazon/features/auth/screens/auth_screen.dart';
import 'package:clone_app_amazon/features/auth/screens/login_screen.dart';
import 'package:clone_app_amazon/features/auth/screens/register_screen.dart';
import 'package:clone_app_amazon/features/page/screens/homeScreen/homePage.dart';
import 'package:clone_app_amazon/layout/mainlayout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorLogin =
    GlobalKey(debugLabel: 'shell');

class Routes {
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/auth',
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorLogin,
          builder: (context, state, child) => child,
          routes: [
            GoRoute(
              path: '/auth',
              name: GloblalVariable.authScreen,
              builder: (context, state) =>
                  const TransitionPage(child: AuthScreen()),
            ),
            GoRoute(
              path: '/login',
              name: GloblalVariable.loginScreen,
              builder: (context, state) =>
                  const TransitionPage(child: LoginScreen()),
            ),
            GoRoute(
              path: '/register',
              name: GloblalVariable.registerScreen,
              builder: (context, state) =>
                  const TransitionPage(child: RegisterScreen()),
            ),
            GoRoute(
              path: '/home',
              name: GloblalVariable.homeScreen,
              builder: (context, state) =>
                  const TransitionPage(child: Mainlayout(child: HomePage())),
            ),
          ]),
    ],
  );
}
