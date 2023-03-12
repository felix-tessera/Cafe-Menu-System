class MenuItem {
  final int id;
  final String name;
  final String weight;
  final String ingredients;
  final String caloric;
  final double price;
  final bool available;
  final int categoryId;

  MenuItem(this.id, this.name, this.weight, this.ingredients, this.caloric,
      this.price, this.available, this.categoryId);
}
