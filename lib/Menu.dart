import 'package:flutter/material.dart';

class MenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pets top',
      home: Menu(),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool isCardPressed = false; // Flag para verificar se um card foi pressionado

  static const _menuTitles = [
    'Buscar Cães por raça',
    'Buscar Gatos por Raça',
    'Buscar sucicatu azul',
    'Baleias',
    'Consultar seu animal',
    'Voltar ao início',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return ListView.builder(
      itemCount: _menuTitles.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5.0,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text(
              _menuTitles[index],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              setState(() {
                // Quando um card é pressionado, definimos a flag como true
                isCardPressed = true;
              });
              if (_menuTitles[index] == 'Voltar ao início') {
                Navigator.pop(context);
              }
            },
          ),
        );
      },
    );
    
  }
}

