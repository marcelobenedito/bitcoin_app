import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _price = "R\$ 0.0";

  _getPrice() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);
    Map<String, dynamic> result = json.decode(response.body);
    setState(() {
      _price = "R\$ ${result["BRL"]["buy"].toString()}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/bitcoin.png"),
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 32),
                child: Text(
                  _price,
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                color: Colors.orange,
                textColor: Colors.white,
                child: Text(
                  "Update",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: _getPrice,
              )
            ],
          ),
        ),
      ),
    );
  }
}
