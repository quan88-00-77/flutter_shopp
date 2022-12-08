import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_colors.dart';
import '../../config/styles.dart';
import '../../controller/auth_controller.dart';
import '../../widgets/custom_button.dart';
import '../main_login.dart';

class WellComeScreen extends StatelessWidget {
  const WellComeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Flexible(flex: 1, child: SizedBox.expand()),
                Flexible(
                  flex: 3,
                  child: Image.asset(
                    'assets/images/image_woman.png',
                    // fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'All your shopping in one App',
                  style: interStyle.copyWith(fontSize: 35),
                ),
                const SizedBox(height: 5),
                Text(
                  'Sell your devices the smarter, faster way for immediate cash and a cleaner conscience. Sell your devices the smarter, faster way for immediate cash and a cleaner conscience.',
                  style: interStyle,
                ),
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      text: 'Login',
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      onpressed: () {
                        controller.changeIndexPage(
                            value: 0, isPositionLogin: false);
                        Get.to(() => const MainPage());
                      },
                    ),
                    CustomButton(
                      text: 'Sign up',
                      color: Colors.white,
                      textColor: kPrimaryColor,
                      onpressed: () {
                        controller.changeIndexPage(
                            value: 1, isPositionLogin: false);
                        Get.to(() => const MainPage());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
