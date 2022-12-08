import 'package:uuid/uuid.dart';

class CartModel {
  final String id = const Uuid().v4();
  final String name;
  final String image;
  final int size;
  int quanity;
  final double price;
  bool isChoose;

  CartModel(
      {required this.name,
      required this.size,
      required this.image,
      this.quanity = 1,
      required this.price,
      this.isChoose = true});
}
