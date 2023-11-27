import 'package:flutter/material.dart';
import 'package:my_pets/DatabaseHelper.dart';
import 'package:my_pets/Menu.dart';
import 'package:my_pets/PetModel.dart';

class PetListScreen extends StatefulWidget {

  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  _PetListScreenState createState() => _PetListScreenState();
}

class _PetListScreenState extends State<PetListScreen> {
  String selectedBreed = 'Selecione uma raça';
  String selectedSize = 'Pequeno porte';
  int selectedRadio = 1;
  bool switchValue = false;

  // Mapeamento de raças para caminhos de imagens correspondentes
  Map<String, String> breedImages = {
    'Selecione uma raça': 'null', // Sem imagem associada
    'Golden Retriever': 'assets/images/cat2.1.png',
    'Labrador Retriever': 'assets/images/cat2.1.png',
    'Bulldog': 'assets/images/cat2.1.png',
    'Poodle': 'assets/images/cat2.1.png',
    // Adicione mais raças e caminhos de imagens, se necessário
  };

  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Pets"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Ir para Menu: "),
                Switch(
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                      if (switchValue) {
                        // Se o switch estiver ativado, navegue para a tela Menu.dart
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Menu(),
                          ),
                        );
                      }
                    });
                  },
                ),
              ],
            ),
            _buildDropdown(),
            SizedBox(height: 16),
            _buildRadioButtons(),
            SizedBox(height: 16),
            if (selectedBreed != 'Selecione uma raça')
              ElevatedButton(
                onPressed: () {
                  _showImageDialog(context, breedImages[selectedBreed] ?? '');
                },
                child: Text("Ver Animal Selecionado"),
              ),
            SizedBox(height: 16),
            _buildPetDescriptionInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildPetDescriptionInput() {
    return TextFormField(
      controller: descriptionController,
      decoration: InputDecoration(
        labelText: 'Descrição do Pet',
        border: OutlineInputBorder(),
      ),
      maxLines: 3,
    );
  }

  Widget _buildDropdown() {
    return Row(
      children: [
        Text("Raça: "),
        DropdownButton<String>(
          value: selectedBreed,
          onChanged: (value) {
            setState(() {
              selectedBreed = value!;
              descriptionController.text = value!;
            });
          },
          items: breedImages.keys.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildRadioButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Porte: "),
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: selectedRadio,
              onChanged: (value) {
                setState(() {
                  selectedRadio = value as int;
                  _updateDescriptionText();
                });
              },
            ),
            Text("Pequeno porte"),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 2,
              groupValue: selectedRadio,
              onChanged: (value) {
                setState(() {
                  selectedRadio = value as int;
                  _updateDescriptionText();
                });
              },
            ),
            Text("Médio porte"),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 3,
              groupValue: selectedRadio,
              onChanged: (value) {
                setState(() {
                  selectedRadio = value as int;
                  _updateDescriptionText();
                });
              },
            ),
            Text("Grande porte"),
          ],
        ),
      ],
    );
  }

  void _updateDescriptionText() {
    switch (selectedRadio) {
      case 1:
        descriptionController.text = "Pequeno porte";
        break;
      case 2:
        descriptionController.text = "Médio porte";
        break;
      case 3:
        descriptionController.text = "Grande porte";
        break;
    }
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Fechar"),
              ),
            ],
          ),
        );
      },
    );
  }

   @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    await widget.dbHelper.initializeDatabase();
  }

  Future<void> _addPetToDatabase() async {
    PetModel newPet = PetModel(
      name: 'Nome do Pet',
      species: 'Espécie do Pet',
      price: 100, // Substitua pelo preço desejado
      picture: 'assets/images/placeholder.png', // Substitua pelo caminho da imagem desejada
      foods: ['Ração A', 'Ração B'], // Substitua pelos alimentos desejados
    );

    await widget.dbHelper.insertPet(newPet);
  }

  // Future<void> _loadPetsFromDatabase() async {
  //   List<PetModel> pets = await widget.dbHelper.getPets();
  //   // Faça algo com a lista de pets carregados do banco de dados
  // }
}
