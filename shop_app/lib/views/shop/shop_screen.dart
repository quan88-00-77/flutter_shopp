import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../config/app_colors.dart';
import '../../config/data.dart';
import '../../config/helper.dart';
import '../../config/styles.dart';
import '../../controller/bilding.dart';
import '../../controller/product_controller.dart';
import '../../models/category_model.dart';
import '../cart/cart_screen.dart';
import '../home/product_detail.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 6,
                        shadowColor: Colors.black,
                        child: TextFormField(
                          decoration: InputDecoration(
                              // suffixIconColor: kPrimaryColor,
                              suffixIcon: const Icon(
                                Icons.search,
                                size: 30,
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              hintText: 'Search here',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: kGreyCACACA),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: kGreyCACACA),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: kGreyCACACA),
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                    ),
                    // const SizedBox(width: 10),
                    Container(
                      alignment: Alignment.centerRight,
                      width: 60,
                      height: 60,
                      child: IconButton(
                          onPressed: () => Get.to(() => const CartScreen(),
                              binding: ProductBilding()),
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            size: 38,
                          )),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                RowTitle(
                  title: 'Shope by Category ',
                  onpressed: () {
                    Helper.showSnackBar();
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemCategory(item: listCategory[0]),
                      ItemCategory(item: listCategory[1]),
                      ItemCategory(item: listCategory[2]),
                      ItemCategory(item: listCategory[3]),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                RowTitle(
                  title: 'Recommended',
                  onpressed: () {
                    Helper.showSnackBar();
                  },
                ),
                const SizedBox(height: 30),
                Expanded(
                    child: GridView.builder(
                        itemCount: listProduct.length,
                        padding: const EdgeInsets.all(0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 183 / 258),
                        itemBuilder: (context, index) {
                          return ItemProduct(index: index);
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemProduct extends StatelessWidget {
  const ItemProduct({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        Get.to(() => ProductDetail(index: index), binding: ProductBilding());
      },
      child: Container(
        padding: const EdgeInsets.all(0),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Colors.black.withOpacity(.2),
                blurRadius: 10)
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 170,
              width: double.infinity,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.asset(
                      listProduct[index].thumb,
                      fit: BoxFit.cover,
                      height: 180,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 21,
                    left: 10,
                    child: Container(
                      height: 25,
                      width: 50,
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 18,
                          ),
                          Text(
                            listProduct[index].star,
                            style: interStyle.copyWith(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 15,
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.favorite_border,
                            size: 20,
                          )),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(listProduct[index].name),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "RM ${listProduct[index].price}",
                          style: interStyle.copyWith(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Color(0xffE4E4E4), shape: BoxShape.circle),
                          child: InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.shopping_bag_outlined,
                                size: 16,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RowTitle extends StatelessWidget {
  const RowTitle({
    Key? key,
    required this.title,
    required this.onpressed,
  }) : super(key: key);
  final String title;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: interStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: onpressed,
          child: Text(
            'View All',
            style: interStyle.copyWith(
                color: kPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Category item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 90,
      // margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: kSecondPrimaryColor),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 25,
            child: Image.asset(item.image),
          ),
          Text(
            item.name,
            style: interStyle.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
