import 'package:flutter/material.dart';
import 'package:projeto/barra_navegacao';

class TelaListar extends StatelessWidget {
  const TelaListar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: BarraNavegacao(
          titulo: "Minhas Plantas",
        ),
        body: ListView.builder(
          itemBuilder: (context, index){
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.local_florist),
                    title: Text('Planta Exemplo'),
                    subtitle: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: 'Nível de umidade: 2\n'),
                          TextSpan(text: 'Nível de luz: 5\n'),
                          TextSpan(text: 'Última adição de nutrientes: 10/10/2021\n'),
                          TextSpan(text: 'Alerta! Baixo nível de umidade', style: TextStyle(color: Colors.red))
                        ]
                      )  
                    )
                  )
                ]
              ),
            );
          }
        )
      )
    );
  }
}