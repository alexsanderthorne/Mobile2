import 'package:flutter/material.dart';
import 'package:my_pets/DatabaseHelper.dart';
import 'package:my_pets/PetModel.dart';

class AddPetScreen extends StatefulWidget {
  @override
  _AddPetScreenState createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController speciesController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController pictureController = TextEditingController();
  final TextEditingController foodsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbHelper.initializeDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Animais'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Adicione campos de entrada para outras propriedades do animal
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nome do Animal'),
            ),
            TextField(
              controller: speciesController,
              decoration: InputDecoration(labelText: 'Espécie'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Preço'),
            ),
            TextField(
              controller: pictureController,
              decoration: InputDecoration(labelText: 'URL da Imagem'),
            ),
            TextField(
              controller: foodsController,
              decoration: InputDecoration(labelText: 'Alimentos (separados por vírgula)'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _addPet();
              },
              child: Text('Adicionar Animal'),
            ),
          ],
        ),
      ),
    );
  }

  void _addPet() {
    PetModel newPet = PetModel(
      name: nameController.text,
      species: speciesController.text,
      price: int.parse(priceController.text),
      picture: pictureController.text,
      foods: foodsController.text.split(','),
    );

    dbHelper.insertPet(newPet);

    // Limpar os campos após adicionar o animal
    nameController.clear();
    speciesController.clear();
    priceController.clear();
    pictureController.clear();
    foodsController.clear();

    // Mostrar um feedback ao usuário (pode ser um Snackbar, por exemplo)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Animal adicionado com sucesso!'),
      ),
    );
  }
}
