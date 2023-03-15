class Category {
  final int id;
  final String name;

  Category(this.id, this.name);

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name};
  }
}
