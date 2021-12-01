import 'package:flutter/material.dart';
import 'package:projeto/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:projeto/tela_registro.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({ Key? key }) : super(key: key);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
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
                RichText(
                  text: TextSpan(
                    text: 'Não possui uma conta? ',
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Registre-se aqui',
                        style: TextStyle(color: Color.fromRGBO(6, 69, 173, 100),
                          fontWeight: FontWeight.bold
                        ),
                        recognizer: new TapGestureRecognizer()..onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context) => TelaRegistro())),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    login(email.text, senha.text, context);
                  },
                  child: Text("Entrar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void login(email, senha, context){
  FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email, password: senha).then((resultado){
      print(resultado);
      print(resultado.user!.uid);
      Navigator.push(context, MaterialPageRoute(builder: (context) => TelaMenu()));
  }).catchError((erro){
    print(erro);
    var mensagem = '';
    if (erro.code == 'user-not-found'){mensagem = 'ERRO: Usuário não encontrado.';
    }else if (erro.code == 'wrong-password'){mensagem = 'ERRO: Senha incorreta.';
    }else if (erro.code == 'invalid-email'){mensagem = 'ERRO: Email inválido.';
    }else{ mensagem = 'ERRO: ${erro.message}';}
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$mensagem'), duration: Duration(seconds: 2)
        )
      );
  });
}
