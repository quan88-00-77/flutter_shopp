import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../config/data.dart';
import '../models/cart_model.dart';

class ProductController extends GetxController {
  var currentIndex = 0.obs;
  // var indexSize = 0.obs;

  List<CartModel> listCart = [
    CartModel(
        name: 'TEST', size: 1, image: 'assets/images/pro1.jpeg', price: 29.00)
  ];

  var price = 0.0.obs;

  final codeTextEditingController = TextEditingController();
  final salePrice = 0.0.obs;

  void totalPrice() {
    price(0.0);
    for (var element in listCart) {
      double temp = price() + (element.price * element.quanity);
      price(temp);
      salePrice(temp - 10 + 20);
      if (element.isChoose == false) {
        double temp2 = price() - (element.price * element.quanity);
        price(temp2);
        salePrice(temp2 - 10 + 20);
      }
    }
  }

  void addProductToCart({required CartModel product}) {
    listCart.add(product);
    totalPrice();
    update();
  }

  void changeIsChoose({required bool value, required int index}) {
    listCart[index].isChoose = value;
    update();
  }

  void changeIndexSize({required int index, required int value}) {
    listProduct[index].size = value;
    update();
  }

  void incrementQuanity({required int index, bool isCart = false}) {
    if (isCart) {
      listCart[index].quanity++;
      totalPrice();
    } else {
      listProduct[index].quanity++;
    }
    update();
  }

  void changSize({required int value, required int index}) {
    listProduct[index].size = value;
    update();
  }

  void decrementQuanity({required int index, bool isCart = false}) {
    if (isCart) {
      if (listCart[index].quanity <= 0) {
        listCart[index].quanity = 0;
        totalPrice();
      } else {
        listCart[index].quanity--;
        totalPrice();
      }
    } else {
      if (listProduct[index].quanity <= 0) {
        listProduct[index].quanity = 0;
      } else {
        listProduct[index].quanity--;
      }
    }

    update();
  }

  void changeIndex(int index) {
    currentIndex(index);
  }

  void changeIndexRightToLeft(int index) {
    int length = listProduct[index].images.length;
    if (currentIndex.value == length - 1) {
      currentIndex.value = 0;
    } else {
      currentIndex.value++;
    }
  }

  void changeIndexLeftToRight(int index) {
    int length = listProduct[index].images.length;
    if (currentIndex.value == 0) {
      currentIndex.value = length - 1;
    } else {
      currentIndex.value--;
    }
  }
}
