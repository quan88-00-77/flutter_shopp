class Product {
  final int id;
  final String name;
  final String quanityReview;
  final String star;
  final double price;
  final String thumb;
  final List<String> images;
  bool isFavorit;
  int quanity;
  int size;

  Product(
      {required this.name,
      required this.id,
      required this.quanityReview,
      required this.star,
      required this.price,
      required this.thumb,
      required this.images,
      required this.isFavorit,
      this.quanity = 1,
      required this.size});
}
