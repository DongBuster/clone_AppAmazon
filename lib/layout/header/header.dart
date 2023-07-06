import 'package:clone_app_amazon/common/widgets/text.dart';
import 'package:clone_app_amazon/provider/stateActiveColorIconHeader.dart';
import 'package:clone_app_amazon/provider/stateActiveIconHome.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class HeaderApp extends StatefulWidget {
  final Widget child;
  const HeaderApp({super.key, required this.child});

  @override
  State<HeaderApp> createState() => _HeaderAppState();
}

class _HeaderAppState extends State<HeaderApp> {
  // handle colorIconBottomNavBar when go route
  Color colorIconBottomNavBar() {
    if (GoRouter.of(context).location != '/home' ||
        Provider.of<StateActiveColorIconHeader>(context, listen: true)
                .isActiveColorIcon ==
            true) {
      return Colors.redAccent;
    } else {
      return Colors.white;
    }
  }

  // handle background header when go route and route location == home
  Color backgroundHeader(bool isActiveColorIcon) {
    if (GoRouter.of(context).location == '/mallScreen') {
      return Colors.white;
    } else if (GoRouter.of(context).location == '/home' && isActiveColorIcon) {
      return Colors.white;
    } else {
      return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isActiveColorIcon =
        Provider.of<StateActiveColorIconHeader>(context, listen: true)
            .isActiveColorIcon;
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 30, 0, 5),
      // height: 65,
      color: backgroundHeader(isActiveColorIcon),

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
                      badgeStyle: const badges.BadgeStyle(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      position:
                          badges.BadgePosition.topStart(top: -15, start: 14),
                      badgeContent: const MyText(
                          text: '3',
                          fontSize: null,
                          fontWeight: null,
                          color: Colors.white),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 28,
                        color: colorIconBottomNavBar(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: badges.Badge(
                      badgeStyle: const badges.BadgeStyle(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      position:
                          badges.BadgePosition.topStart(top: -15, start: 14),
                      badgeContent: const MyText(
                          text: '3',
                          fontSize: null,
                          fontWeight: null,
                          color: Colors.white),
                      child: Icon(
                        Icons.message_outlined,
                        size: 28,
                        color: colorIconBottomNavBar(),
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
