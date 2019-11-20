import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class DetalhesPage extends StatelessWidget {
  String text;
  DetalhesPage({Key key, @required this.text}) : super(key: key);

  static const url = 'https://www.superheroapi.com/api.php/3904302519595211/';
  // Function para retornar dados da API
  Future<Map> getData() async {
    String cod = text;
    http.Response response = await http.get(DetalhesPage.url + cod);
    return json.decode(response.body);
  }

  String nome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text("Carregando...",style: TextStyle(color: Colors.amber, fontSize: 25.0),
                  textAlign: TextAlign.center,),
              );
            default:
              if (snapshot.hasError){
                return Center(
                  child: Text(
                    "Erro ao carregar Dados.",
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                nome = snapshot.data['name'];
                return SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 10.0),
                  child: Column(
                    children: <Widget>[
                      Text(nome,style: TextStyle(fontSize: 30.0),),
                      Divider(height: 20.0,),
                      Text(text),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

