import 'package:flutter/material.dart';
import 'package:projeto/barra_navegacao';
import 'package:projeto/sobre.dart';
import 'package:projeto/adicionar.dart';
import 'package:projeto/listar.dart';
import 'package:projeto/compartilhar.dart';

class TelaMenu extends StatefulWidget {
  const TelaMenu({ Key? key }) : super(key: key);

  @override
  _TelaMenuState createState() => _TelaMenuState();
}

class _TelaMenuState extends State<TelaMenu> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: BarraNavegacao(
          titulo: "Menu",
          voltar: false,
          ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/Logo.png",
                  width: 150
                ),
                SizedBox(height: 15),
                Flexible(
                  child: GridView.count(
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    crossAxisCount:2,
                    children:[
                      ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TelaAdicionar()));
                          },
                          icon: Icon(Icons.add_circle),
                          label: Text("Adicionar Planta"),
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TelaListar()));
                          },
                          icon: Icon(Icons.spa),
                          label: Text("Minhas Plantas"),
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCompartilhar()));
                          },
                          icon: Icon(Icons.share),
                          label: Text("Compartilhar\nmonitoramento"),
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TelaSobre()));
                          },
                          icon: Icon(Icons.info),
                          label: Text("Sobre"),
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            Navigator.popUntil(context, ModalRoute.withName('/'));
                          },
                          icon: Icon(Icons.logout),
                          label: Text("Sair"),
                      )
                    ]
                  )
                )
              ]
            )
          )
        ),
      )
    );
  }
}

