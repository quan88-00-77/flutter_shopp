import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_colors.dart';
import '../../config/helper.dart';
import '../../config/styles.dart';
import '../../controller/auth_controller.dart';
import '../../controller/bottom_navigator_controller.dart';
import '../cart/cart_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: kPrimaryColor,
        leading: const SizedBox(),
        flexibleSpace: Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 20,
              // alignment: Alignment.bottomLeft,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: kSecondPrimaryColor,
                        ),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/images/wonder-woman-colored.jpeg'))),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Helper.getNameOfEmail(
                            Get.find<AuthController>().emailUser.toString()),
                        style: interStyle.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        Get.find<AuthController>().emailUser.toString(),
                        style: interStyle.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _SingleCategory(
                icon: Icons.notifications,
                title: 'Thông báo',
                onPressed: () {
                  Get.find<BottomNavigatorController>()
                      .changeCurrentIndex(index: 2);
                }),
            const SizedBox(height: 10),
            _SingleCategory(
                icon: Icons.person,
                title: 'Cá nhân',
                onPressed: () {
                  Helper.showSnackBar();
                }),
            const SizedBox(height: 10),
            _SingleCategory(
                icon: Icons.settings,
                title: 'Cài đặt',
                onPressed: () {
                  Helper.showSnackBar();
                }),
            const SizedBox(height: 10),
            _SingleCategory(
                icon: Icons.shopping_cart,
                title: 'Giỏ hàng',
                onPressed: () {
                  Get.to(() => const CartScreen());
                }),
            const SizedBox(height: 10),
            _SingleCategory(
                icon: Icons.logout,
                title: 'Đăng xuất',
                onPressed: () {
                  Get.find<AuthController>().signOut();
                })
          ],
        ),
      ),
    );
  }
}

class _SingleCategory extends StatelessWidget {
  const _SingleCategory(
      {Key? key,
      required this.title,
      // required this.iconURL,
      required this.icon,
      required this.onPressed,
      this.size,
      this.paddingLeft,
      this.paddingRight})
      : super(key: key);
  final String title;
  // final String iconURL;
  final Function onPressed;
  final IconData icon;
  final double? size, paddingLeft, paddingRight;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => onPressed(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 0.5, color: Colors.black))),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(
                                right: paddingRight ?? 8,
                                left: paddingLeft ?? 0),
                            height: 50,
                            width: 50,
                            child: Icon(
                              icon,
                              color: kPrimaryColor,
                            )),
                        Flexible(
                          child: Text(title,
                              style: interStyle.copyWith(
                                  color: Colors.black, fontSize: 16),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.keyboard_arrow_right),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
