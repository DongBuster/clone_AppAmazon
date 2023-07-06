import 'package:clone_app_amazon/provider/stateActiveIconHome.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void onTapIconFooter(BuildContext context, String nameRoute) {
  context.pushNamed(nameRoute);
}

Color colorCurrentRoute(BuildContext context, String pathRoute) {
  if (GoRouter.of(context).location == pathRoute) {
    return Colors.redAccent;
  } else {
    return Colors.black45;
  }
}
