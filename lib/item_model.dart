class ItemModel {
  final String? id;
  final String? title;
  final String? description;
  final String? image;
  final double? cost;


  ItemModel({required this.id, required this.title, required this.description,required this.image,required this.cost});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'].toString(),
      title: json['title'],
      description: json['description'],
      image: json['image'],
      cost: json['price']
    );
  }
}