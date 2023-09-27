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

class Menu extends StatelessWidget {
  static const _menuTitles = [
    'Buscar Cães por raça',
    'Buscar Gatos por Raça',
    'Buscar suricatu azul',
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
              // Implemente a ação desejada quando um card for pressionado.
              // Você pode usar Navigator para navegar para uma página específica.
            },
          ),
        );
      },
    );
  }
}
