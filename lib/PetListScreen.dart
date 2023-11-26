import 'package:flutter/material.dart';

class PetListScreen extends StatefulWidget {
  @override
  _PetListScreenState createState() => _PetListScreenState();
}

class _PetListScreenState extends State<PetListScreen> {
  String selectedBreed = 'Selecione uma raça';
  String selectedSize = 'Pequeno porte';
  int selectedRadio = 1;

  // Mapeamento de raças para caminhos de imagens correspondentes
  Map<String, String> breedImages = {
    'Selecione uma raça': 'assets/images/placeholder.png',
    'Golden Retriever': 'assets/images/cat2.1.png',
    'Labrador Retriever': 'assets/images/cat2.1.png',
    'Bulldog': 'assets/images/cat2.1.png',
    'Poodle': 'assets/images/cat2.1.png',
    // Adicione mais raças e caminhos de imagens, se necessário
  };

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
            _buildDropdown(),
            SizedBox(height: 16),
            _buildRadioButtons(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showImageDialog(context, breedImages[selectedBreed] ?? '');
              },
              child: Text("Ver Animal Selecionada"),
            ),
            // Adicione aqui o conteúdo real da lista de pets
            Text("Conteúdo da Lista de Pets aqui"),
          ],
        ),
      ),
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
                });
              },
            ),
            Text("Grande porte"),
          ],
        ),
      ],
    );
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
}
