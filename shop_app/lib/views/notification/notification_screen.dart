import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../config/styles.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        // leading: InkWell(
        //   onTap: () => Get.back(),
        //   child: const Icon(
        //     Icons.arrow_back_ios_outlined,
        //     color: Colors.black,
        //   ),
        // ),
        centerTitle: true,
        title: Text(
          'Notification',
          style: interStyle.copyWith(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 30),
              ItemNoti(
                content:
                    'Đây là thông báo từ app của chúng tôi, Thông báo test đang được chúng tôi phát triển !',
              ),
              ItemNoti(
                content: 'Đây là thông báo từ app của chúng tôi',
              ),
              ItemNoti(
                content:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemNoti extends StatelessWidget {
  const ItemNoti({
    Key? key,
    required this.content,
  }) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 30),
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topCenter,
            colors: [
              kSecondPrimaryColor.withOpacity(.5),
              // kGreyCACACA,
              kPrimaryColor.withOpacity(.9),
              // Color(0xffeacda3),
              // Color(0xffd6ae7b),
            ]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            // color: Colors.red,
            width: 60,
            height: 60,
            child: FlutterLogo(),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thông báo',
                  style: interStyle.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: interStyle.copyWith(fontSize: 14, color: Colors.black),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
