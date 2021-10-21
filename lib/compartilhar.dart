import 'package:flutter/material.dart';
import 'package:projeto/barra_navegacao';

class TelaCompartilhar extends StatelessWidget {
  const TelaCompartilhar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController apelidoPlanta = TextEditingController();
    TextEditingController idUsuarioCompartilhar = TextEditingController();
  
    return Material(
      child: Scaffold(
        appBar: BarraNavegacao(
          titulo: "Compartilhar Monitoramento",
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: apelidoPlanta,
                  decoration: InputDecoration(
                    labelText: "Planta a ser compartilhada",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: idUsuarioCompartilhar,
                  decoration: InputDecoration(
                    labelText: "Compartilhar com",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => 
                      AlertDialog(
                        title: const Text('Compartilhar'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('${apelidoPlanta.text} será compartilhada com ${idUsuarioCompartilhar.text}')
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancelar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Confirmar'),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${apelidoPlanta.text} compartilhada com ${idUsuarioCompartilhar.text}!')
                                )
                              );
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      )
                    );
                  },
                  child: Text("Compartilhar"),
                )
              ],
            ),
          ),
        )
      )
    );
  }
}