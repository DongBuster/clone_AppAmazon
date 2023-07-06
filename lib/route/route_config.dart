import 'package:clone_app_amazon/animations/TransitionPage.dart';
import 'package:clone_app_amazon/constants/global_variables.dart';
import 'package:clone_app_amazon/features/auth/screens/auth_screen.dart';
import 'package:clone_app_amazon/features/auth/screens/login_screen.dart';
import 'package:clone_app_amazon/features/auth/screens/register_screen.dart';
import 'package:clone_app_amazon/features/page/homeScreen/homeScreen.dart';
import 'package:clone_app_amazon/features/page/liveScreen/liveScreen.dart';
import 'package:clone_app_amazon/features/page/mallScreen/mallScreen.dart';
import 'package:clone_app_amazon/features/page/notificationsScreen/notificationsScreen.dart';
import 'package:clone_app_amazon/features/page/profileScreen/profileScreen.dart';
import 'package:clone_app_amazon/layout/mainlayout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorLogin =
    GlobalKey(debugLabel: 'shell');

class Routes {
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/auth',
        name: GloblalVariable.authScreen,
        builder: (context, state) => const TransitionPage(
          child: AuthScreen(),
        ),
      ),
      GoRoute(
        path: '/login',
        name: GloblalVariable.loginScreen,
        builder: (context, state) => const TransitionPage(
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: '/register',
        name: GloblalVariable.registerScreen,
        builder: (context, state) => const TransitionPage(
          child: RegisterScreen(),
        ),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorLogin,
        builder: (context, state, child) => child,
        routes: [
          GoRoute(
            path: '/home',
            name: GloblalVariable.homeScreen,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Mainlayout(
                child: HomeScreen(),
              ),
            ),
          ),
          GoRoute(
            path: '/mallScreen',
            name: GloblalVariable.mallScreen,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Mainlayout(
                child: MallScreen(),
              ),
            ),
          ),
          GoRoute(
            path: '/liveScreen',
            name: GloblalVariable.liveScreen,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Mainlayout(
                child: LiveScreen(),
              ),
            ),
          ),
          GoRoute(
            path: '/notificationsScreen',
            name: GloblalVariable.notificationsScreen,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Mainlayout(
                child: NotificationsScreen(),
              ),
            ),
          ),
          GoRoute(
            path: '/profileScreen',
            name: GloblalVariable.profileScreen,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Mainlayout(
                child: ProfileScreen(),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
