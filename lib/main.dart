import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_pets/Menu.dart';
import 'package:my_pets/pet.dart';
import 'api.dart';

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
  int imgIndex = 0;

  void _prevImg() {
    setState(() {
      imgIndex = imgIndex > 0 ? imgIndex - 1 : 0;
    });
  }

  void _nextImg() {
    setState(() {
      imgIndex = imgIndex < pets.length - 1 ? imgIndex + 1 : 0;
    });
  }

  _getPets() {
    var pets_json = {
      "pets": [
        {
          "name": "Fluffy",
          "species": "Cat",
          "age": 3,
          "color": "Gray"
        },
        {
          "name": "Buddy",
          "species": "Dog",
          "age": 5,
          "color": "Golden Retriever"
        },
        {
          "name": "Spike",
          "species": "Hedgehog",
          "age": 2,
          "color": "Brown"
        }
      ]
    };

  }

  _BuildListViewState() {
    _getPets();
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
                accountName: Text("Zacal Blend"),
                accountEmail: Text("zacalblend@gmail.com"),
                currentAccountPicture: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQf-fbBUEbzyPziAIOnlRPsu691z6bnGvUga0ngUtVu0mNCu0eZjfDVFX_JPzrPrequw0k&usqp=CAU"),
              ),
              ListTile(
                trailing: Icon(Icons.picture_as_pdf_sharp),
                leading: Icon(Icons.home),
                title: Text("Pequeno porte"),
              ),
              ListTile(
                trailing: Icon(Icons.add_business_rounded),
                leading: Icon(Icons.flag),
                title: Text("Médio porte"),
              ),
              ListTile(
                trailing: Icon(Icons.add_business_rounded),
                leading: Icon(Icons.flag),
                title: Text("Grande porte"),
              ),
              ListTile(
                trailing: Icon(Icons.add_business_rounded),
                leading: Icon(Icons.flag),
                title: Text("Orientais"),
              ),
              Container(
                  child: Center(
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Menu()));
                          },
                          child: Text("Ir para Menu de Opcções"),
                          elevation: 5.0,
                          color: Colors.green,
                          shape: const StadiumBorder()))),
            ],
          ),
        ),
        body: listaPets());
  }

  listPetsName() {
    return ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pets[index].name),
          );
        });
  }

  listaPets() {
    if (pets.isEmpty) {
      // Lide com o caso em que a lista de pets está vazia.
      return Center(
        child: Text("Nenhum animal de estimação disponível."),
      );
    }

    // Certifique-se de que imgIndex esteja dentro dos limites da lista pets.
    if (imgIndex < 0) {
      imgIndex = 0;
    } else if (imgIndex >= pets.length) {
      imgIndex = pets.length - 1;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            pets[imgIndex].name + " | " + pets[imgIndex].foods[1].toString(),
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Center(
          child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  image: DecorationImage(
                      image: NetworkImage(pets[imgIndex].picture),
                      fit: BoxFit.cover)),
              height: 400.0,
              width: 300.0,
            )
          ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Prev'),
              onPressed: _prevImg,
              elevation: 5.0,
              color: Colors.green,
              shape: const StadiumBorder(),
            ),
            SizedBox(width: 10.0),
            RaisedButton(
              child: Text('Next'),
              onPressed: _nextImg,
              elevation: 5.0,
              color: Colors.blue,
              shape: const StadiumBorder(),
            )
          ],
        )
      ],
    );
  }
}

RaisedButton(
    {required Text child,
    required void Function() onPressed,
    required double elevation,
    required MaterialColor color,
    required StadiumBorder shape}) {}
