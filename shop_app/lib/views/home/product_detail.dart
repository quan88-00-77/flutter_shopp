import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/config/app_colors.dart';
import 'package:shop_app/config/data.dart';
import 'package:shop_app/config/helper.dart';
import 'package:shop_app/config/styles.dart';
import 'package:shop_app/controller/product_controller.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/views/cart/cart_screen.dart';
import 'package:shop_app/widgets/custom_button.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();
    final size = Get.size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.45,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GetX<ProductController>(builder: (builder) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: Image.asset(
                          key: ValueKey(controller.currentIndex()),
                          listProduct[index].images[controller.currentIndex()],
                          fit: BoxFit.cover,
                          height: size.height * 0.45,
                          width: double.infinity,
                        ),
                      );
                    }),
                    GetX<ProductController>(builder: (builder) {
                      return Positioned(
                        bottom: 10,
                        height: 20,
                        child: Row(
                          children: List.generate(
                              listProduct[index].images.length,
                              (index) => Container(
                                    width: 15,
                                    height: 15,
                                    margin: const EdgeInsets.only(right: 15),
                                    decoration: BoxDecoration(
                                        color:
                                            controller.currentIndex() == index
                                                ? kPrimaryColor
                                                : kGreyCACACA,
                                        shape: BoxShape.circle),
                                  )),
                        ),
                      );
                    }),
                    Draggable(
                      onDragEnd: (details) {
                        if (details.velocity.pixelsPerSecond.dx < 0) {
                          controller.changeIndexRightToLeft(index);
                        } else {
                          controller.changeIndexLeftToRight(index);
                        }
                      },
                      feedback: Container(
                          // height: size.height * 0.45,
                          // width: double.infinity,
                          // color: Colors.transparent,
                          ),
                      child: Container(
                        height: size.height * 0.45,
                        width: double.infinity,
                        color: Colors.transparent,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
              //
              const SizedBox(height: 20),

              ///
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetX<ProductController>(builder: (builder) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              listProduct[index].images.length,
                              (i) => InkWell(
                                    onTap: (() => controller.changeIndex(i)),
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      margin: const EdgeInsets.only(right: 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                listProduct[index].images[i])),
                                        border: Border.all(
                                            width: 2,
                                            color:
                                                controller.currentIndex() == i
                                                    ? kSecondPrimaryColor
                                                    : kGreyCACACA),
                                      ),
                                    ),
                                  )),
                        ),
                      );
                    }),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 28,
                        ),
                        const SizedBox(width: 7),
                        Text(
                          listProduct[index].star,
                          style: interStyle.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          '(${listProduct[index].quanityReview})',
                          style: interStyle.copyWith(
                              fontSize: 18, color: kGreyCACACA),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          'Reviews',
                          style: interStyle.copyWith(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      listProduct[index].name,
                      style: interStyle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'RM ${listProduct[index].price}',
                      style: interStyle.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Select Size',
                      style: interStyle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: List.generate(
                          4,
                          (i) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  controller.changeIndexSize(
                                      index: index, value: i);
                                },
                                child: GetBuilder<ProductController>(
                                    builder: (context) {
                                  return Container(
                                    width: 40,
                                    height: 40,
                                    margin: const EdgeInsets.only(right: 20),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: listProduct[index].size == i
                                            ? kSecondPrimaryColor
                                            : null,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1,
                                            color: listProduct[index].size == i
                                                ? kSecondPrimaryColor
                                                : kGreyCACACA)),
                                    child: Text(
                                      Helper.getSizeProduct[i],
                                      style: interStyle.copyWith(fontSize: 16),
                                    ),
                                  );
                                }),
                              )),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 122,
                          height: 45,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 7),
                          decoration: BoxDecoration(
                              color: kGreyCACACA,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      controller.decrementQuanity(index: index);
                                    },
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 1, color: kGreyCACACA)),
                                      child: Text(
                                        '-',
                                        style:
                                            interStyle.copyWith(fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                                // const SizedBox(width: 20),
                                Expanded(
                                  // width: 35,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: GetBuilder<ProductController>(
                                        builder: (builder) {
                                      return Text(
                                        listProduct[index].quanity.toString(),
                                        style: interStyle,
                                      );
                                    }),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      controller.incrementQuanity(index: index);
                                    },
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 1, color: kGreyCACACA)),
                                      child: Text(
                                        '+',
                                        style:
                                            interStyle.copyWith(fontSize: 18),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        CustomButton(
                            paddingVeri: 14,
                            paddingHori: 56,
                            text: 'Add to cart',
                            onpressed: () {
                              controller.addProductToCart(
                                  product: CartModel(
                                      name: listProduct[index].name,
                                      size: listProduct[index].size,
                                      image: listProduct[index].thumb,
                                      price: listProduct[index].price,
                                      quanity: listProduct[index].quanity));
                              Get.to(() => const CartScreen());
                            },
                            textColor: Colors.white,
                            color: kPrimaryColor)
                      ],
                    )
                  ],
                ),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}
