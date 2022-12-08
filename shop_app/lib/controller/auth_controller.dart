import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/helper.dart';
import '../config/loading.dart';
import '../views/bottom_navigator/bottom_navigator.dart';
import '../views/login/login_view.dart';
import '../views/main_login.dart';
import '../views/sign_up/sign_up.dart';

class AuthController extends GetxController {
  var indexPage = 0.obs;
  final List<Widget> listPage = [
    const Login(),
    const SignUpView(),
  ];
  final PageController pageController = PageController();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameControllerRegister = TextEditingController();
  final passwordControllerRegister = TextEditingController();

  final userNameFocus = false.obs;
  final passwordFocus = false.obs;

  final userNameFocusRegister = false.obs;
  final passwordFocusRegister = false.obs;

  final firebase = FirebaseAuth.instance;
  String errorMessageSigIn = 'Vui Lòng thử lại !';

  var emailUser = ''.obs;

  void chanegStatusFocus({required int nodeIndex, required bool value}) {
    if (nodeIndex == 0) {
      userNameFocus(value);
    } else {
      passwordFocus(value);
    }
  }

  void chanegStatusFocusRegister(
      {required int nodeIndex, required bool value}) {
    if (nodeIndex == 0) {
      userNameFocusRegister(value);
    } else {
      userNameFocusRegister(value);
    }
  }

  void changeIndexPage({required int value, bool isPositionLogin = true}) {
    indexPage(value);
    if (isPositionLogin) {
      pageController.nextPage(
          curve: Curves.easeInOutCubicEmphasized,
          duration: const Duration(seconds: 1));
    }
    update();
  }

  Future<void> signOut() async {
    try {
      showLoadingOverlay();
      await firebase.signOut();
      Get.find<AuthController>().changeIndexPage(value: 0);

      // Get.offUntil(MainPage(), (route) => false);
      Get.offAll(() => const MainPage());
      hideLoadingOverlay();
    } catch (e) {
      print(e);
    }
  }

  Future<void> registerEmailAndPassword(context,
      {required String email, required String password}) async {
    try {
      showLoadingOverlay();
      await firebase.createUserWithEmailAndPassword(
          email: email, password: password);
      hideLoadingOverlay();
      changeIndexPage(value: 0);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Helper.showDialogAlter(
            context: context, message: 'Mật khẩu được cung cấp quá yếu.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Helper.showDialogAlter(
            context: context, message: 'Tài khoản đã tồn tại cho email đó.');
        print('The account already exists for that email.');
      }
    } catch (e) {
      hideLoadingOverlay();
      print(e);
    }
  }

  Future<void> signEmailAndPassword(context,
      {required String email, required String password}) async {
    // late UserCredential userCredential;
    try {
      showLoadingOverlay();
      FocusScope.of(context).requestFocus();
      final user = await firebase.signInWithEmailAndPassword(
          email: email, password: password);
      final emailTemp = user.user!.email;
      emailUser(emailTemp);
      Get.to(() => BottomNavigator());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        hideLoadingOverlay();
        errorMessageSigIn = 'Tài khoản không tồn tại';
        Helper.showDialogAlter(context: context, message: errorMessageSigIn);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        hideLoadingOverlay();
        errorMessageSigIn = 'Mật khẩu không hợp lệ!';
        Helper.showDialogAlter(context: context, message: errorMessageSigIn);
        print('Wrong password provided for that user.');
      }
    }
    hideLoadingOverlay();

    // return userCredential;
  }
}
