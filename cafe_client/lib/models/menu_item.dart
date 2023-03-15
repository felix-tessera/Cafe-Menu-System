class MenuItem {
  final int id;
  final String name;
  final int weight;
  final String ingredients;
  final int caloric;
  final double price;
  final bool available;
  final int categoryId;
  final String? imageLink;

  MenuItem(this.id, this.name, this.weight, this.ingredients, this.caloric,
      this.price, this.available, this.categoryId, this.imageLink);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "weight": weight.toString(),
      "ingredients": ingredients,
      "caloric": caloric.toString(),
      "price": price,
      "available": available,
      "categoryId": categoryId,
      "imageLink": imageLink,
    };
  }
}
