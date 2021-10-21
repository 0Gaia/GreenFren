import 'package:flutter/material.dart';
import 'package:projeto/barra_navegacao';

class TelaAdicionar extends StatelessWidget {
  const TelaAdicionar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController apelidoPlanta = TextEditingController();

    return Material(
      child: Scaffold(
        appBar: BarraNavegacao(
          titulo: "Adicionar Planta",
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
                    labelText: "Apelido da Planta",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Especie",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15),
                InputDatePickerFormField(
                  fieldLabelText: "Data de plantio",
                  firstDate: DateTime(1, 1),
                  lastDate: DateTime.now().add(Duration(days:1))
                ),
                SizedBox(height: 15),
                IconButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Dispositivos encontrados'),
                        content: SimpleDialogOption(
                          onPressed: (){
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(milliseconds: 500),
                                content: const Text('Dispositivo Conectado')
                              )
                            );
                          },
                          child: const Text('Dipositivo 1')
                        )
                      )
                    );
                  },
                  icon: Icon(Icons.phonelink_setup)
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Planta ${apelidoPlanta.text} adicionada!')
                      )
                    );
                    Navigator.pop(context);
                  },
                  child: Text("Adicionar"),
                )
              ],
            ),
          ),
        )
      )
    );
  }
}