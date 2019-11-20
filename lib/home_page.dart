import 'package:app_flutter_herois/detalhes_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  static String textToSend;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Heros"),
      ),
      body: Column(
        children: <Widget>[
          Text("Pesquisar"),
          TextField(
            decoration: InputDecoration(
                hintText: 'Enter user name', labelText: 'User Name'),
            controller: textEditingController,
          ),
          RaisedButton(
            child: Text("Buscar"),
            onPressed: (){
              _sendDataToSecondScreen(context);
            },
          ),
        ],
      ),
    );
  }
  // envia o texto digitado para a screen
  void _sendDataToSecondScreen(BuildContext context) {

    String textToSend = textEditingController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetalhesPage(text: textToSend,),
        ));
  }
}



