import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_colors.dart';
import '../../config/helper.dart';
import '../../config/styles.dart';
import '../../controller/auth_controller.dart';
import '../../widgets/custom_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = Get.find<AuthController>();
  final List<FocusNode> nodes = [FocusNode(), FocusNode()];
  @override
  void initState() {
    for (var index = 0; index < nodes.length; index++) {
      nodes[index].addListener(() {
        controller.chanegStatusFocus(
            nodeIndex: index, value: nodes[index].hasFocus);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: InkWell(
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                'Sign In',
                style: interStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Welcome back! Don’t have an account?',
                style: interStyle.copyWith(),
              ),
              const SizedBox(height: 10),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => controller.changeIndexPage(value: 1),
                child: Text(
                  'Sign up',
                  style: interStyle.copyWith(
                    color: kPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              FormBody(controller: controller, nodes: nodes),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(
                      child: Divider(thickness: 2, color: kGreyCACACA)),
                  const SizedBox(width: 5),
                  Text('OR',
                      style: interStyle.copyWith(
                          color: kPrimaryColor, fontSize: 14)),
                  const SizedBox(width: 5),
                  const Expanded(
                      child: Divider(thickness: 2, color: kGreyCACACA)),
                ],
              ),
              const SizedBox(height: 40),
              ButtonOptions(
                text: 'Log In with Google',
                imageUrl: 'assets/images/icon_google.png',
                onpressed: () {
                  // Get.to(() => BottomNavigator());
                  Helper.showSnackBar();
                },
              ),
              const SizedBox(height: 18),
              ButtonOptions(
                text: 'Log In with Apple',
                imageUrl: 'assets/images/icon_apple.png',
                onpressed: () {
                  print('asdasdas');
                  Helper.showSnackBar();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FormBody extends StatelessWidget {
  FormBody({
    Key? key,
    required this.controller,
    required this.nodes,
  }) : super(key: key);

  final AuthController controller;
  final List<FocusNode> nodes;
  final formKeyLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyLogin,
      child: Column(
        children: [
          TextFormField(
            focusNode: nodes[0],
            controller: controller.userNameController,
            validator: (value) {
              return Helper.valiEmail(value ?? '');
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'User name',
              hintMaxLines: 1,
              hintStyle: interStyle.copyWith(color: kGreyCACACA, fontSize: 14),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: kPrimaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: kGreyCACACA),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.red),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: kPrimaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.passwordController,
            obscureText: true,
            focusNode: nodes[1],
            validator: ((value) {
              return Helper.valiPassword(value ?? '');
            }),
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Password',
                hintMaxLines: 1,
                hintStyle:
                    interStyle.copyWith(color: kGreyCACACA, fontSize: 14),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: kGreyCACACA),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusColor: kPrimaryColor),
          ),
          const SizedBox(height: 30),
          CustomButton(
            text: 'Login',
            onpressed: () {
              if (formKeyLogin.currentState!.validate()) {
                controller.signEmailAndPassword(context,
                    email: controller.userNameController.text,
                    password: controller.passwordController.text);
              }
            },
            textColor: Colors.white,
            color: kPrimaryColor,
            paddingVeri: 14,
          ),
          const SizedBox(height: 17),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: true,
                      onChanged: (value) {},
                      activeColor: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Remember Me',
                    textAlign: TextAlign.left,
                    style: interStyle.copyWith(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                width: 120,
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Helper.showSnackBar();
                  },
                  child: Text(
                    'Forgot password?',
                    style:
                        interStyle.copyWith(color: kPrimaryColor, fontSize: 14),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ButtonOptions extends StatelessWidget {
  const ButtonOptions({
    Key? key,
    required this.onpressed,
    required this.text,
    required this.imageUrl,
  }) : super(key: key);
  final VoidCallback onpressed;
  final String text;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: kGreyCACACA),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 5),
            Text(
              // 'Log In with Google',
              text,
              style: interStyle.copyWith(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
