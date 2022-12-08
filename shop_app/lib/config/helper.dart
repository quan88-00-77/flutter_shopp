import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';
import 'styles.dart';

class Helper {
  static var getSizeProduct = ['X', 'M', 'L', 'XL'];

  static String? valiEmail(String email) {
    bool isEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (email.isEmpty) {
      return 'Username không được để trống!';
    } else if (!isEmail) {
      return 'Email không hợp lệ!';
    }
    return null;
  }

  static String getNameOfEmail(String email) {
    int index = email.indexOf('@');
    String name = email.substring(0, index);
    return name;
  }

  static String? valiPassword(String password) {
    if (password.isEmpty) {
      return 'Mật khẩu không được để trống!';
    }
    return null;
  }

  static void showSnackBar() {
    // Get.showSnackbar(const GetSnackBar(
    //   backgroundColor: Colors.redAccent,
    //   shouldIconPulse: false,
    //   icon: Icon(
    //     Icons.notifications,
    //     color: Colors.white,
    //   ),
    //   snackPosition: SnackPosition.TOP,
    //   title: 'Thông báo',
    //   message: 'Chức năng đang được phát triển. Vui lòng thử lại sau!',
    //   duration: Duration(seconds: 1),
    // ));
  }

  static showDialogAlter(
      {required BuildContext context, required String message}) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              height: 130,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    message,
                    style: interStyle.copyWith(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 100,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kPrimaryColor),
                      child: Text(
                        'Xác nhận',
                        style: interStyle.copyWith(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
