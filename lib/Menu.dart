import 'dart:js';

import 'package:flutter/material.dart';
import 'package:my_pets/main.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        ..._buildListItems(),
        const Spacer(),
        _buildGetStartedButton(),
      ],
    );
  }

  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    for (var i = 0; i < _menuTitles.length; ++i) {
      listItems.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 14),
          child: Text(
            _menuTitles[i],
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
    return listItems;
  }

  Widget _buildGetStartedButton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: RaisedButton(
          shape: const StadiumBorder(),
          onPressed: () {
            Navigator.pop(context as BuildContext);
          },
          child: Text("Voltar ao início"),
          elevation: 5.0,
          color: Colors.blue,
        ),
      ),
    );
  }
}
