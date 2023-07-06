import 'package:clone_app_amazon/constants/global_variables.dart';
import 'package:clone_app_amazon/features/page/notificationsScreen/notificationsScreen.dart';
import 'package:clone_app_amazon/layout/header/header.dart';
import 'package:clone_app_amazon/layout/header/widget/headerWithSearch.dart';
import 'package:clone_app_amazon/provider/stateActiveColorIconHeader.dart';
import 'package:clone_app_amazon/provider/stateActiveIconHome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imagePathsBanner = [
    'assets/banner/1.jpg',
    'assets/banner/2.jpg',
    'assets/banner/3.jpg',
    'assets/banner/4.jpg',
    'assets/banner/5.jpg',
  ];
  Map<String, String> listItemsCategory = {
    'Thời trang nam': 'assets/img/category/fashion_nam.png',
    'Thời trang nữ': 'assets/img/category/fashion_nu.png',
    'Điện thoại & phụ kiện': 'assets/img/category/phone.png',
    'Thiết bị điện tử': 'assets/img/category/manhinh.png',
    'Mẹ và bé': 'assets/img/category/me_va_be.png',
    'Sắc đẹp': 'assets/img/category/sacdep.png',
    'Máy tính laptop': 'assets/img/category/laptop.png',
    'Nhà cửa & đời sống': 'assets/img/category/doisong.png',
    'Giày dép nam': 'assets/img/category/giay_nam.png',
    'Giày dép nữ': 'assets/img/category/giay_nu.png',
  };

  bool isScrollListItemsCategory = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black12,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels > 20 &&
                  notification.metrics.axis == Axis.vertical) {
                Provider.of<StateActiveIconHome>(context, listen: false)
                    .setActiveIconHome();
                Provider.of<StateActiveColorIconHeader>(context, listen: false)
                    .setActiveColorIconHeader();
              }
              setState(() {
                if (notification.metrics.pixels == 0 &&
                    notification.metrics.axis == Axis.vertical) {
                  Provider.of<StateActiveIconHome>(context, listen: false)
                      .setNotActiveIconHome();
                  Provider.of<StateActiveColorIconHeader>(context,
                          listen: false)
                      .setNotActiveColorIconHeader();
                }
              });
              return false;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: Stack(
                      children: [
                        // ---- banner -----
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 220.0,
                            autoPlay: true,
                            viewportFraction: 1,
                          ),
                          items: imagePathsBanner.map(
                            (image) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(image),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ).toList(),
                        ),
                        //----- list items category ------
                        Positioned(
                          top: 220,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.only(top: 60),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.pink, Colors.white],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 220,
                                  child:
                                      NotificationListener<ScrollNotification>(
                                    onNotification: (notification) {
                                      if (notification.metrics.pixels > 20) {
                                        isScrollListItemsCategory = true;
                                      } else {
                                        isScrollListItemsCategory = false;
                                      }
                                      return false;
                                    },
                                    child: GridView.builder(
                                      scrollDirection: Axis.horizontal,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.2,
                                        mainAxisSpacing: 10,
                                        // crossAxisSpacing: 1,
                                      ),
                                      itemCount: listItemsCategory.keys.length,
                                      itemBuilder: (context, index) {
                                        List<String> description =
                                            listItemsCategory.keys.toList();
                                        List<String> imagePaths =
                                            listItemsCategory.values.toList();

                                        return itemsCategory(imagePaths[index],
                                            description[index]);
                                      },
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        width: 40,
                                        height: 6,
                                      ),
                                      AnimatedPositioned(
                                        top: 0,
                                        left:
                                            isScrollListItemsCategory ? 20 : 0,
                                        duration:
                                            const Duration(milliseconds: 200),
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: isScrollListItemsCategory
                                                  ? const Radius.circular(0)
                                                  : const Radius.circular(5),
                                              bottomLeft:
                                                  isScrollListItemsCategory
                                                      ? const Radius.circular(0)
                                                      : const Radius.circular(
                                                          5),
                                              topRight:
                                                  isScrollListItemsCategory
                                                      ? const Radius.circular(5)
                                                      : const Radius.circular(
                                                          0),
                                              bottomRight:
                                                  isScrollListItemsCategory
                                                      ? const Radius.circular(5)
                                                      : const Radius.circular(
                                                          0),
                                            ),
                                            color: Colors.redAccent,
                                          ),
                                          width: 20,
                                          height: 6,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 10,
                                        child: Container(
                                          width: 115,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/banner/banner_specialOffer1.png'),
                                                fit: BoxFit.fill),
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            border:
                                                Border.all(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 135,
                                        right: 135,
                                        child: Container(
                                          // width: 115,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/banner/banner_specialOffer2.png'),
                                                fit: BoxFit.fill),
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            border:
                                                Border.all(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 10,
                                        child: Container(
                                          width: 115,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/banner/banner_specialOffer3.png'),
                                                fit: BoxFit.fill),
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            border:
                                                Border.all(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //---- electronic wallet ----
                        Positioned(
                          top: 210,
                          left: 20,
                          right: 20,
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 10),
                                const Icon(Icons.qr_code_scanner_outlined,
                                    color: Colors.black54),
                                const SizedBox(width: 10),
                                Container(
                                  height: 20,
                                  width: 1,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 5),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.shopify_outlined,
                                          color: Colors.redAccent,
                                        ),
                                        Text(
                                          'Ví ShopeePay',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Voucher giảm đến 40.000Đ',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff757575),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  height: 20,
                                  width: 1,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 5),
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.attach_money,
                                          color: Colors.orange,
                                        ),
                                        Text(
                                          '0',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Đổi xu lấy mã giảm giá',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff757575),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // ------------
                  Container(
                    height: 500,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [],
                        ),
                        Row(),
                      ],
                    ),
                  ),
                  Container(
                    height: 500,
                    color: Colors.pink,
                  ),
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: HeaderApp(child: Search()),
        ),
      ],
    );
  }
}

Widget itemsCategory(String imagePaths, String description) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagePaths),
          ),
        ),
      ),
      SizedBox(
        width: 70,
        child: Text(
          textAlign: TextAlign.center,
          description,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
      )
    ],
  );
}
