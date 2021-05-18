import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pets_app/Menu.dart';
import 'package:pets_app/api.dart';
import 'package:pets_app/pet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pets & Adote',
      home: BuildListView(),
    );
  }
}

class BuildListView extends StatefulWidget {
  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  var pets = new List<Pet>();
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
    API.getPets().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        pets = list.map((model) => Pet.fromJson(model)).toList();
      });
    });
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
                          child: Text("Ir para Menu de Opcções")))),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            pets[imgIndex].name +
                " | " +
                pets[imgIndex].foods["likes"].toString(),
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
            ),
            SizedBox(width: 10.0),
            RaisedButton(
              child: Text('Next'),
              onPressed: _nextImg,
              elevation: 5.0,
              color: Colors.blue,
            )
          ],
        )
      ],
    );
  }
}
