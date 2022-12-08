import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_colors.dart';
import '../../config/helper.dart';
import '../../config/styles.dart';
import '../../controller/auth_controller.dart';
import '../../widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final size = Get.size;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              const SizedBox(height: 30),
              Container(
                color: kBackgroundColor,
                height: size.height * 0.22,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return _ItemContainer(size: size, index: index);
                    }),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shocking Sale',
                    style: interStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'View All',
                      style: interStyle.copyWith(color: kPrimaryColor),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 32),
              Container(
                color: kBackgroundColor,
                height: size.height * 0.21,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return ItemSale(size: size);
                    }),
              ),
              const SizedBox(height: 32),
              Container(
                width: size.width,
                height: size.height * 0.162,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      kPrimaryColor,
                      kSecondPrimaryColor,
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Get RM10.00 OFF',
                              style: interStyle.copyWith(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Spen min RM100.00 to get free delivery and promo voucher for your next purchase. ',
                              style: interStyle.copyWith(fontSize: 10),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 100),
                              child: CustomButton(
                                  text: 'Buy Now',
                                  paddingHori: 22,
                                  paddingVeri: 7,
                                  onpressed: () {
                                    Helper.showSnackBar();
                                  },
                                  textColor: Colors.black,
                                  color: Colors.white),
                            )
                          ],
                        )),
                    Flexible(
                        flex: 1,
                        child: Image.asset(
                          'assets/images/image_sale.png',
                          fit: BoxFit.cover,
                        )),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class ItemSale extends StatelessWidget {
  const ItemSale({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.42,
      height: size.height * 0.21,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/phone_test.png'),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.4),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              width: double.infinity,
              height: 40,
              child: Center(
                child: Text(
                  '15k Sold Out',
                  style: interStyle.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
              right: 12,
              child: Container(
                width: 30,
                height: 30,
                color: kSecondPrimaryColor,
                child: Text(
                  '50% \nOFF',
                  textAlign: TextAlign.center,
                  style: interStyle.copyWith(fontSize: 10),
                ),
              ))
        ],
      ),
    );
  }
}

class _ItemContainer extends StatelessWidget {
  const _ItemContainer({
    Key? key,
    required this.size,
    required this.index,
  }) : super(key: key);

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.75,
      height: size.height * 0.1,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(6, 3),
                blurRadius: 10,
                color: Colors.black.withOpacity(.4))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                'Trade-in and save ',
                style: interStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Text(
                'Enjoy Great unfront saving Enjoy Great unfront saving',
                style: interStyle.copyWith(fontSize: 10),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomButton(
                  paddingHori: 10,
                  paddingVeri: 5,
                  fontSize: 12,
                  text: 'Learn More',
                  onpressed: () {
                    Helper.showSnackBar();
                  },
                  textColor: Colors.black,
                  color: kSecondPrimaryColor,
                  isBorderRadius: true,
                ),
              )
            ],
          )),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset('assets/images/image_test.png'),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: interStyle.copyWith(fontSize: 10),
            ),
            const SizedBox(height: 5),
            Text(
              Helper.getNameOfEmail(Get.find<AuthController>()
                  .emailUser
                  .toString()
                  .toUpperCase()),
              style: interStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: kPrimaryColor, width: 2),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      AssetImage('assets/images/wonder-woman-colored.jpeg'))),
        )
      ],
    );
  }
}
