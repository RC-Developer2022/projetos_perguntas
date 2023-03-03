import 'package:flutter/material.dart';
import 'questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita ?',
      'respostas': [
        {'texto': 'Preto', 'pontuação': 10},
        {'texto': 'Vermelho', 'pontuação': 5},
        {'texto': 'Verde', 'pontuação': 3},
        {'texto': 'Branco', 'pontuação': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito ?',
      'respostas': [
        {'texto': 'Coelho', 'pontuação': 10},
        {'texto': 'Cobra', 'pontuação': 5},
        {'texto': 'Elefante', 'pontuação': 3},
        {'texto': 'Leão', 'pontuação': 1}
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito ?',
      'respostas': [
        {'texto': 'Maria', 'pontuação': 10},
        {'texto': 'João', 'pontuação': 5},
        {'texto': 'Leo', 'pontuação': 3},
        {'texto': 'Pedro', 'pontuação': 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPergutnasSelecionadas) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  bool get temPergutnasSelecionadas {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPergutnasSelecionadas
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
            as List<Map<String, Object>>
        : [];

    // ignore: prefer_const_constructors
    return MaterialApp(
      // ignore: prefer_const_constructors
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPergutnasSelecionadas
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quantResponder: _responder,
              )
            : Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
