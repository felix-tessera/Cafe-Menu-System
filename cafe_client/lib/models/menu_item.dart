class MenuItem {
  final int id;
  final String name;
  final int weight;
  final String ingredients;
  final int caloric;
  final double price;
  final bool available;
  final int categoryId;

  MenuItem(this.id, this.name, this.weight, this.ingredients, this.caloric,
      this.price, this.available, this.categoryId);
}
