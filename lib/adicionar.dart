import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto/barra_navegacao';

class TelaAdicionar extends StatefulWidget {
  const TelaAdicionar({ Key? key }) : super(key: key);

  @override
  _TelaAdicionarState createState() => _TelaAdicionarState();
}

class _TelaAdicionarState extends State<TelaAdicionar> {
  var nomePlanta = TextEditingController();
  var especiePlanta = TextEditingController();
  var pessoas;
  var ultimaAdicaoNutrientes;
  DateTime dataPlantio = DateTime.now();

  getDocumentById(id) async{
      await FirebaseFirestore.instance.collection('plantas').doc(id).get().then((doc){
        nomePlanta.text = doc.get('nomePlanta');
        especiePlanta.text = doc.get('especiePlanta');
        dataPlantio = doc.get('dataPlantio').toDate();
        pessoas = doc.get('pessoas');
        ultimaAdicaoNutrientes = doc.get('ultimaAdicaoNutrientes');
      });
    }

  @override
  Widget build(BuildContext context) {
    
    
    var id = ModalRoute.of(context)?.settings.arguments;

    

    if(id != null){
      if(nomePlanta.text.isEmpty && especiePlanta.text.isEmpty){
        getDocumentById(id);
      }
    }

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
                  controller: nomePlanta,
                  decoration: InputDecoration(
                    labelText: "Apelido da Planta",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: especiePlanta,
                  decoration: InputDecoration(
                    labelText: "Especie",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15),
                InputDatePickerFormField(
                  onDateSubmitted: (dataCampo){
                    dataPlantio = dataCampo;
                  },
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

                    if (id == null){
                      FirebaseFirestore.instance.collection('plantas').add(
                        {
                          'nomePlanta' : nomePlanta.text,
                          'especiePlanta' : especiePlanta.text,
                          'dataPlantio' : dataPlantio,
                          'nivelLuz' : 5,
                          'nivelUmidade' : 2,
                          'ultimaAdicaoNutrientes': DateTime.now()
                        }
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Planta ${nomePlanta.text} adicionada!')
                        )
                      );
                    }
                    else{
                      FirebaseFirestore.instance.collection('plantas').doc(id.toString()).set(
                        {
                          'nomePlanta' : nomePlanta.text,
                          'especiePlanta' : especiePlanta.text,
                          'dataPlantio' : dataPlantio,
                          'nivelLuz' : 5,
                          'nivelUmidade' : 2,
                          'ultimaAdicaoNutrientes': DateTime.now(),
                          'pessoas': pessoas
                        }
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Planta ${nomePlanta.text} editada!')
                        )
                      );
                    }
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

