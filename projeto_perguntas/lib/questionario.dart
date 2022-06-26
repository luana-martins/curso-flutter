import 'package:flutter/material.dart';

import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPergunta {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =
        temPergunta ? perguntas[perguntaSelecionada].cast()['respostas'] : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
        ...respostas
            .map((t) => Resposta(t['texto'].toString(),
                () => responder(int.parse(t['nota'].toString()))))
            .toList(),
      ],
    );
  }
}
