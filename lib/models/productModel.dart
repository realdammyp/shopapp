class ProductModel {
  String id;
  String name;
  String flavor;
  String description;
  int price;
  String imageurl;

  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.imageurl,
      this.description,
      this.flavor});

  ProductModel.fromJson(
    Map<String, dynamic> prod,
    String id,
  ) {
    this.id = id ?? 'example id';
    description = prod['description'] ?? 'Classic macaron';
    flavor = prod['flavor'] ?? 'Choclate';
    name = prod["name"] ?? 'empty';
    price = prod["price"] ?? 5;
    imageurl = prod["imageurl"] ?? 'www.google.com';
  }

  Map<String, dynamic> toJson() => {
        'description': description,
        'imageurl': imageurl ?? 'ww.google',
        'name': name,
        'price': price,
      };
}
