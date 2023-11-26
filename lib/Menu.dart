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
  static const _menuItems = [
    {
      'icon': Icons.search,
      'label': 'Buscar Cães por raça',
      'action': 'searchDogs'
    },
    {
      'icon': Icons.search,
      'label': 'Buscar Gatos por Raça',
      'action': 'searchCats'
    },
    {
      'icon': Icons.search,
      'label': 'Buscar suricatu azul',
      'action': 'searchSuricatu'
    },
    {'icon': Icons.search, 'label': 'Baleias', 'action': 'searchWhales'},
    {
      'icon': Icons.search,
      'label': 'Consultar seu animal',
      'action': 'consultAnimal'
    },
    {'icon': Icons.home, 'label': 'Voltar ao início', 'action': 'backToHome'},
  ];

  late Map<String, bool> permissions;

  @override
  void initState() {
    super.initState();
    permissions = {
      'searchDogs': true,
      'searchCats': false,
      'searchSuricatu': true,
      'searchWhales': true,
      'consultAnimal': true,
      'backToHome': true,
    };
  }

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
      itemCount: _menuItems.length,
      itemBuilder: (context, index) {
        final String action = _menuItems[index]['action'] as String;

        return _buildCard(
          icon: _menuItems[index]['icon'] as IconData,
          label: _menuItems[index]['label'] as String,
          onPressed: () {
            if (permissions[action]!) {
              _handleCardPress(action);
            } else {
              _showPermissionAlert();
            }
          },
        );
      },
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Row(
          children: [
            Checkbox(
              value: permissions[label] ?? false,
              onChanged: (value) {
                setState(() {
                  permissions[label] = value ?? false;
                });
              },
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        onTap: () {
          if (permissions[label] ?? false) {
            onPressed();
          } else {
            _showPermissionAlert();
          }
        },
      ),
    );
  }

  void _handleCardPress(String action) {
    setState(() {
      // Realize ações com base na ação associada ao card
      print('Ação associada: $action');

      // Exemplo: se a ação for 'backToHome', volta à tela inicial
      if (action == 'backToHome') {
        Navigator.pop(context);
      }
    });
  }

  void _showPermissionAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Permissão Negada'),
          content: Text(
              'Você não possui permissão para acessar esta funcionalidade.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
