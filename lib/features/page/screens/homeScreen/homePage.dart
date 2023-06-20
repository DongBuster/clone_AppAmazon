import 'package:clone_app_amazon/constants/global_variables.dart';
import 'package:clone_app_amazon/features/auth/services/service_loginWithAccout.dart';
import 'package:clone_app_amazon/features/auth/services/service_loginWithFacebook.dart';
import 'package:clone_app_amazon/features/auth/services/service_loginWithGoogle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[200],
    );
  }
}

// ElevatedButton(
//             onPressed: () async {
//               await LoginWithGoogle.logOut();
//               await LoginWithFacebook.logOut();
//               loginWithAccount.logOut();
//               if (context.mounted) {
//                 context.goNamed(GloblalVariable.loginScreen);
//               }
//             },
//             child: Text('logout'),
//           ),
