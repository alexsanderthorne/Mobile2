import 'package:flutter/material.dart';
import 'package:my_pets/AddPetScreen.dart';
import 'package:my_pets/Menu.dart';
import 'package:my_pets/PetListScreen.dart';
import 'package:my_pets/pet.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pets && Adote',
      home: BuildListView(),
    );
  }
}

class BuildListView extends StatefulWidget {
  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  var pets = <Pet>[];
  bool isLoading = true; // Flag para controlar o carregamento

  @override
  void initState() {
    super.initState();
    // Simule o carregamento de dados (substitua por sua lógica real)
    Future.delayed(Duration(seconds: 2), () {
      // Quando os dados forem carregados, altere o estado para não estar mais em carregamento
      setState(() {
        isLoading = false;
        // Aqui você pode carregar os dados reais dos pets, se desejar
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Pets"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Alexsander Araujo"),
              accountEmail: Text("ala@gmail.com"),
              currentAccountPicture: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQf-fbBUEbzyPziAIOnlRPsu691z6bnGvUga0ngUtVu0mNCu0eZjfDVFX_JPzrPrequw0k&usqp=CAU"),
            ),
            ListTile(
              trailing: Icon(Icons.add_business_rounded),
              leading: Icon(Icons.flag),
              title: Text("Visualizar Animais Para Adoção"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PetListScreen(),
                  ),
                );
              },
            ),
            ListTile(
              trailing: Icon(Icons.add_business_rounded),
              leading: Icon(Icons.flag),
              title: Text("Adicionar Animais"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddPetScreen(),
                  ),
                );
              },
            ),
            // Adicionar navegação
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Menu(),
                  ),
                );
              },
              child: Text('Ir para menu de opções'),
            ),
          ],
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return isLoading
        ? Center(
            // Se estiver em carregamento, exibir um CircularProgressIndicator no centro
            child: CircularProgressIndicator(),
          )
        : _buildWelcomeScreen();
  }

  Widget _buildWelcomeScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/cat2.1.png', // Caminho para a imagem de boas-vindas
            width: 300,
            height: 300,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 20),
          Text(
            'Bem-vindo ao Pets Stop!',
            style: TextStyle(fontSize: 24),
          ),
          // Adicione outros elementos de boas-vindas, se desejar
        ],
      ),
    );
  }
}
