import 'package:flutter/material.dart';
import './questao.dart';
import 'respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quantResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quantResponder,
  });

  bool get temPergutnasSelecionadas {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPergutnasSelecionadas
        ? perguntas[perguntaSelecionada].cast()['respostas']
            as List<Map<String, Object>>
        : [];

    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Respostas(
            resp['texto'] as String,
            () => quantResponder(int.parse(resp['pontuacao'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
