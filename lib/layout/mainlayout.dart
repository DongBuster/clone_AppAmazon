import 'package:clone_app_amazon/animations/TransitionPage.dart';
import 'package:clone_app_amazon/layout/footer/footer.dart';
import 'package:clone_app_amazon/layout/header/header.dart';
import 'package:clone_app_amazon/layout/header/widget/headerWithSearch.dart';
import 'package:flutter/material.dart';

class Mainlayout extends StatefulWidget {
  final Widget child;
  const Mainlayout({super.key, required this.child});

  @override
  State<Mainlayout> createState() => _MainlayoutState();
}

class _MainlayoutState extends State<Mainlayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          TransitionPage(child: widget.child),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FooterApp(),
          ),
        ],
      ),
    );
  }
}
