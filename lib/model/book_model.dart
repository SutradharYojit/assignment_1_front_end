class BookData {
  String? sId;
  String? name;
  int? price;
  String? description;
  String? author;
  int? stock;

  BookData(
      {this.sId,
        this.name,
        this.price,
        this.description,
        this.author,
        this.stock});

  BookData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    author = json['author'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['author'] = this.author;
    data['stock'] = this.stock;
    return data;
  }
}
