import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Pagina1 extends StatefulWidget {
  @override
  _Pagina1State createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  
  String _resultado= '0';

  void atualizarBitcoin() async {
    String url = 'https://blockchain.info/ticker';
    http.Response response = await http.get(url);
    Map<String, dynamic > retorno = json.decode(response.body);
    setState(() {
      _resultado = retorno['BRL']['buy'].toString();

    });

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        margin: EdgeInsets.all(16),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('imagens/bitcoin.png'),
            Padding(padding: EdgeInsets.all(16),
            child:
              Text('R\$ ' + _resultado,
              style: TextStyle(
              fontSize: 20
              ),
              ),
              ),
            RaisedButton(
                child: Text('Atualizar',
                style: TextStyle(
                color: Colors.white,
                fontSize: 20
                ),
                ),
                color: Colors.orange,
                onPressed: (){
                  atualizarBitcoin();
                }
            )
          ],
        ),
      ),
    );
  }
}

