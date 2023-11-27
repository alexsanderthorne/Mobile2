import 'package:path/path.dart';


class PetModel {
  int? id;
  late String name;
  late String species;
  late int price;
  late String picture;
  late List<dynamic> foods;

  PetModel({
    this.id,
    required this.name,
    required this.species,
    required this.price,
    required this.picture,
    required this.foods,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'species': species,
      'price': price,
      'picture': picture,
      'foods': foods,
    };
  }

  static PetModel fromMap(Map<String, dynamic> map) {
    return PetModel(
      id: map['id'],
      name: map['name'],
      species: map['species'],
      price: map['price'],
      picture: map['picture'],
      foods: map['foods'],
    );
  }
}
