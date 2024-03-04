class ProductCreateDto {
  final String title;
  final int price;
  final String description;
  final List<String> images;

  ProductCreateDto(
      {required this.title,
      required this.price,
      required this.description,
      required this.images});
}
