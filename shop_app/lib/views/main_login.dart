import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/config/loading.dart';

import '../config/app_colors.dart';
import '../config/styles.dart';
import '../controller/auth_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: CustomLoading(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: kPrimaryColor,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              child: GetBuilder<AuthController>(builder: (builder) {
                return Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        onTap: () {
                          if (controller.indexPage() == 0) {
                          } else {
                            controller.changeIndexPage(value: 0);
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Login',
                              style: interStyle.copyWith(
                                  color: controller.indexPage() == 0
                                      ? kPrimaryColor
                                      : Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(seconds: 1),
                              child: Divider(
                                key: ValueKey(controller.indexPage()),
                                thickness: 5,
                                color: controller.indexPage() == 0
                                    ? kPrimaryColor
                                    : kGreyColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        onTap: () {
                          if (controller.indexPage() == 1) {
                          } else {
                            controller.changeIndexPage(value: 1);
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Register',
                              style: interStyle.copyWith(
                                  color: controller.indexPage() == 1
                                      ? kPrimaryColor
                                      : Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(seconds: 1),
                              child: Divider(
                                key: ValueKey(controller.indexPage()),
                                thickness: 5,
                                color: controller.indexPage() == 1
                                    ? kPrimaryColor
                                    : kGreyColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GetBuilder<AuthController>(builder: (builder) {
                  return PageView.builder(
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return controller.listPage[controller.indexPage()];
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
