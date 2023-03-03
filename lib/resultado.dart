import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impresionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 32),
          ),
        ),
        TextButton(
          child: Text('Reiniciar ?'),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(fontSize: 18))),
          onPressed: quandoReiniciarQuestionario,
        ),
      ],
    );
  }
}
