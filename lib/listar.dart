import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto/barra_navegacao';

class TelaListar extends StatefulWidget {
  const TelaListar({ Key? key }) : super(key: key);

  @override
  _TelaListarState createState() => _TelaListarState();
}

class _TelaListarState extends State<TelaListar> {

  late Query plantas;

  @override
  void initState(){
    super.initState();
    plantas = FirebaseFirestore.instance.collection('plantas').where("pessoas." + "cbixsq5n8oUUZwsDDRAohdbcJdj1", whereIn: ["proprietario", "amigo"]);
  }

  Widget itemPlanta(item){
    String nome = item.data()['nomePlanta'];
    int nivelUmidade = item.data()['nivelUmidade'];
    int nivelLuz = item.data()['nivelLuz'];
    DateTime ultimaAdicaoNutrientes = item.data()['ultimaAdicaoNutrientes'].toDate();

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.local_florist),
            title: Text(nome),
            trailing: Wrap(
              children:[
                IconButton(
                  padding: EdgeInsets.all(0.1),
                  icon: Icon(Icons.edit),
                  onPressed: (){ Navigator.pushNamed(context, '/adicionar', arguments: item.id);}
                ),
                IconButton(
                  padding: EdgeInsets.all(0.1),
                  icon: Icon(Icons.delete),
                  onPressed: (){ FirebaseFirestore.instance.collection('plantas').doc(item.id).delete(); }
                ),
              ]
            ),
            subtitle: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Nível de umidade: $nivelUmidade\n'),
                  TextSpan(text: 'Nível de luz: $nivelLuz\n'),
                  TextSpan(text: 'Última adição de nutrientes: $ultimaAdicaoNutrientes\n'),
                  // TextSpan(text: 'Alerta! Baixo nível de umidade', style: TextStyle(color: Colors.red))
                ]
              )  
            )
          ),
        ]
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: BarraNavegacao(
          titulo: "Minhas Plantas",
        ),
        body: StreamBuilder<QuerySnapshot>(

          stream: plantas.snapshots(),

          builder: (context, snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
                return const Center(child: Text("Não foi possível conectar a base de dados"));
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                final dados = snapshot.requireData;
                return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context, index){
                    return itemPlanta(dados.docs[index]);
                  }
                );
            }
          }

        )
      )
    );
  }
}