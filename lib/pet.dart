class Pet {
  late String name;
  late String species;
  late int price;
  late String picture;
  late  List<dynamic> foods;


  Pet({
    required this.name,
    required this.species,
    required this.price,
    required this.picture,
    required this.foods,
  });

  Pet.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    species = json['species'];
    price = json['price'];
    picture = json['picture'];
    foods = json['foods'];
  }

  
}
