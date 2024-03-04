class Category {
  final int id;
  final String name;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  static Category parseCategory(categoryData) {
    return Category(
      id: categoryData['id'],
      name: categoryData['name'],
      image: categoryData['image'],
    );
  }
}
