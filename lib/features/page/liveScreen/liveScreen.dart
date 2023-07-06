import 'package:clone_app_amazon/layout/header/header.dart';
import 'package:clone_app_amazon/layout/header/widget/headerWithSearch.dart';
import 'package:clone_app_amazon/layout/header/widget/headerWithTitleText.dart';
import 'package:flutter/material.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 70),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black12)),
            color: Colors.white,
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: HeaderApp(
            child: TitleText(text: 'Shoppe Live'),
          ),
        ),
      ],
    );
  }
}
