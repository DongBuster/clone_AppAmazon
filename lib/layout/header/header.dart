import 'package:clone_app_amazon/common/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/flutter_svg.dart';

class HeaderApp extends StatefulWidget {
  final Widget child;
  const HeaderApp({super.key, required this.child});

  @override
  State<HeaderApp> createState() => _HeaderAppState();
}

class _HeaderAppState extends State<HeaderApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(child: widget.child),
          SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: badges.Badge(
                      position:
                          badges.BadgePosition.topStart(top: -15, start: 14),
                      badgeContent: const MyText(
                          text: '3',
                          fontSize: null,
                          fontWeight: null,
                          color: Colors.white),
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: badges.Badge(
                      position:
                          badges.BadgePosition.topStart(top: -15, start: 14),
                      badgeContent: const MyText(
                          text: '3',
                          fontSize: null,
                          fontWeight: null,
                          color: Colors.white),
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 28,
                        color: Colors.white,
                      ),
                      // SvgPicture.asset(
                      //   'assets/svg/comment1.svg',
                      //   width: 50,
                      //   height: 50,
                      // ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
