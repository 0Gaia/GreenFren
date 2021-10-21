import 'package:flutter/material.dart';
import 'package:projeto/barra_navegacao';

class TelaSobre extends StatelessWidget {
  const TelaSobre({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: BarraNavegacao(
          titulo: "Sobre",
        ),
        body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "GreenFren",
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 35,
                  fontStyle: FontStyle.italic
                )
              ),
              SizedBox(height: 20),
              Text("O GreenFren é um produto para auxiliar no monitoramento de recursos de vasos para plantas."),
              SizedBox(height: 15),
              Text("Nesse projeto, é buscado um produto que proporcione uma experiencia mais amigável para o cuidado de plantas domésticas, com integração a esse aplicativo e com possibilidade de expansão para outras funcionalidades")
              
            ],
          ),
        ),
      )
      )
    );
  }
}