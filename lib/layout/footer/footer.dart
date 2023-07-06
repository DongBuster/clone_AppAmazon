import 'package:clone_app_amazon/constants/global_variables.dart';
import 'package:clone_app_amazon/layout/footer/handles/handleFooter.dart';
import 'package:clone_app_amazon/layout/footer/widgets/icon_button.dart';
import 'package:clone_app_amazon/provider/stateActiveIconHome.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FooterApp extends StatefulWidget {
  const FooterApp({super.key});

  @override
  State<FooterApp> createState() => _FooterAppState();
}

class _FooterAppState extends State<FooterApp> {
  Color handleRouteColor() {
    if (GoRouter.of(context).location != '/home') {
      return Colors.redAccent;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isActiveIconHome =
        Provider.of<StateActiveIconHome>(context, listen: true)
            .isActiveIconHome;
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(top: BorderSide(color: Colors.black12)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 4,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // home
          GestureDetector(
            onTap: () {
              onTapIconFooter(context, GloblalVariable.homeScreen);
            },
            child: SizedBox(
              width: 80,
              child: IconButtonFooter(
                icon: GoRouter.of(context).location == '/home' &&
                        isActiveIconHome == false
                    ? Icons.thumb_up
                    : Icons.home_filled,
                size: 28,
                text: GoRouter.of(context).location == '/home' &&
                        isActiveIconHome == false
                    ? 'Gợi ý hôm nay'
                    : 'Home',
                PathRoute: '/home',
              ),
            ),
          ),
          // mail
          GestureDetector(
            onTap: () {
              onTapIconFooter(context, GloblalVariable.mallScreen);
            },
            child: const SizedBox(
              width: 70,
              child: IconButtonFooter(
                icon: Icons.shopping_bag_outlined,
                size: 30,
                text: 'Mall',
                PathRoute: '/mallScreen',
              ),
            ),
          ),
          // live
          GestureDetector(
            onTap: () {
              onTapIconFooter(context, GloblalVariable.liveScreen);
            },
            child: const SizedBox(
              width: 70,
              child: IconButtonFooter(
                icon: Icons.videocam_outlined,
                size: 35,
                text: 'Live',
                PathRoute: '/liveScreen',
              ),
            ),
          ),
          // notification
          GestureDetector(
            onTap: () {
              onTapIconFooter(context, GloblalVariable.notificationsScreen);
            },
            child: SizedBox(
              width: 70,
              child: Stack(
                children: [
                  const IconButtonFooter(
                    icon: Icons.notifications_none_outlined,
                    size: 34,
                    text: 'Thông báo',
                    PathRoute: '/notificationsScreen',
                  ),
                  Positioned(
                    top: 0,
                    right: 17,
                    child: Container(
                      alignment: Alignment.center,
                      width: 26,
                      height: 18,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: Text(
                        '99+',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // profile
          GestureDetector(
            onTap: () {
              onTapIconFooter(context, GloblalVariable.profileScreen);
            },
            child: const SizedBox(
              width: 70,
              child: IconButtonFooter(
                icon: Icons.person_2_outlined,
                size: 30,
                text: 'Tôi',
                PathRoute: '/profileScreen',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
