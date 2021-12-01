import 'package:flutter/material.dart';
import 'package:projeto/tela_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TelaRegistro extends StatefulWidget {
  const TelaRegistro({ Key? key }) : super(key: key);

  @override
  _TelaRegistroState createState() => _TelaRegistroState();
}

class _TelaRegistroState extends State<TelaRegistro> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController senha = TextEditingController();

    return Material(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                "images/Ilustracao.png",
                width: 150),
                SizedBox(height: 15),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: senha,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    registrar(email.text, senha.text, context);
                  },
                  child: Text("Registrar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void registrar(email, senha, context){
  FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email, password: senha).then((resultado){
      Navigator.push(context, MaterialPageRoute(builder: (context) => TelaLogin()));
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Conta registrada com sucesso!')
      )
    );
  }).catchError((erro){
    print(erro);
    var mensagem = '';
    mensagem = 'ERRO: ${erro.message}';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem)
      )
    );
  });
}
