class Pet {
  String name;
  String species;
  int price;
  String picture;
  var foods;
  Pet({required this.name, required this.species, required this.price, required this.picture, this.foods});

  Pet.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    species = json['species'];
    price = json['price'];
    picture = json['picture'];
    foods = json['foods'];
  }
}
