import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_colors.dart';
import '../../config/helper.dart';
import '../../config/styles.dart';
import '../../controller/product_controller.dart';
import '../../models/cart_model.dart';
import '../../widgets/custom_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    Get.find<ProductController>().totalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            ),
          ),
          title: Text(
            'My Carts',
            style:
                interStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Helper.showSnackBar();
                },
                child: Text(
                  'Delete',
                  style: interStyle.copyWith(color: Colors.red),
                )),
            const SizedBox(width: 14),
          ],
        ),
        body: Column(
          children: [
            Flexible(
              flex: 5,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: ListView.builder(
                      itemCount: controller.listCart.length,
                      itemBuilder: (context, index) {
                        return ItemCart(
                          item: controller.listCart[index],
                          index: index,
                        );
                      })),
            ),
            Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20),
                                      hintText: 'Promo Code',
                                      hintStyle: interStyle.copyWith(
                                          fontSize: 12, color: kGreyCACACA),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: kGreyCACACA),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: kGreyCACACA),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: kGreyCACACA),
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: CustomButton(
                                    paddingHori: 20,
                                    text: 'Apply',
                                    onpressed: () {
                                      Helper.showSnackBar();
                                    },
                                    textColor: Colors.white,
                                    color: kPrimaryColor),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sub-total',
                                    style: interStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Voucher',
                                    style: interStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Delivery Fee',
                                    style: interStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child:
                                  GetX<ProductController>(builder: (builder) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'RM ${controller.price.toDouble()}',
                                      style: interStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '- RM 10',
                                      style: interStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'RM 20',
                                      style: interStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            thickness: 2,
                            color: kGreyColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: interStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            GetBuilder<ProductController>(builder: (builder) {
                              return Text(
                                'RM ${controller.salePrice().toString()}',
                                style: interStyle.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              );
                            }),
                          ],
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                            text: 'Checkout',
                            onpressed: () {
                              Get.showSnackbar(const GetSnackBar(
                                backgroundColor: kPrimaryColor,
                                shouldIconPulse: false,
                                icon: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                                snackPosition: SnackPosition.TOP,
                                title: 'Thông báo',
                                message:
                                    'Chúc mừng bạn đã mua thành công sản phẩm!',
                                duration: Duration(seconds: 2),
                              ));
                            },
                            textColor: Colors.white,
                            color: kPrimaryColor)
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class ItemCart extends StatelessWidget {
  ItemCart({Key? key, required this.item, required this.index})
      : super(key: key);

  final CartModel item;
  final controller = Get.find<ProductController>();
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        shadowColor: Colors.black.withOpacity(1),
        elevation: 10,
        child: Container(
          height: 130,
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: 1,
                  child: Image.asset(
                    item.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Flexible(
                  flex: 2,
                  child: SizedBox(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  // width: ,
                                  child: Text(
                                    item.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: interStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  'Size: ${Helper.getSizeProduct[item.size]}',
                                  style: interStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'RM ${item.price}',
                                  style: interStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Flexible(
                  flex: 1,
                  child: SizedBox.expand(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<ProductController>(builder: (_) {
                          return Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              value: item.isChoose,
                              activeColor: kPrimaryColor,
                              onChanged: (value) {
                                controller.changeIsChoose(
                                    value: value ?? false, index: index);
                                controller.totalPrice();
                              },
                              shape: const CircleBorder(),
                            ),
                          );
                        }),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    controller.decrementQuanity(
                                        index: index, isCart: true);
                                  },
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 1, color: kGreyCACACA)),
                                    child: Text(
                                      '-',
                                      style: interStyle.copyWith(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              // const SizedBox(width: 20),
                              Expanded(
                                // width: 35,
                                child:
                                    GetBuilder<ProductController>(builder: (_) {
                                  return Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      controller.listCart[index].quanity
                                          .toString(),
                                      style: interStyle,
                                    ),
                                  );
                                }),
                              ),
                              Expanded(
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    controller.incrementQuanity(
                                        index: index, isCart: true);
                                  },
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 1, color: kGreyCACACA)),
                                    child: Text(
                                      '+',
                                      style: interStyle.copyWith(fontSize: 18),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
