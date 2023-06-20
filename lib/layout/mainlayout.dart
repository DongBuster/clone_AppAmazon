import 'package:clone_app_amazon/layout/header/header.dart';
import 'package:clone_app_amazon/layout/header/widget/search.dart';
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
          widget.child,
          const Positioned(
            top: 14,
            left: 20,
            right: 0,
            child: HeaderApp(child: Search()),
          ),
        ],
      ),
    );
  }
}
