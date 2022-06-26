import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var pontucaoTotal = 0;
  final perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Vermelho', 'nota': 5},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Branco', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 10},
        {'texto': 'Cobra', 'nota': 5},
        {'texto': 'Elefante', 'nota': 3},
        {'texto': 'Leão', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'nota': 10},
        {'texto': 'João', 'nota': 5},
        {'texto': 'Leo', 'nota': 3},
        {'texto': 'Pedro', 'nota': 1},
      ],
    }
  ];

  bool get temPergunta {
    return _perguntaSelecionada < perguntas.length;
  }

  void _responder(int pontos) {
    if (temPergunta) {
      setState(() {
        _perguntaSelecionada++;
        pontucaoTotal += pontos;
      });
    }
  }

  void reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      pontucaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Perguntas'),
      ),
      body: temPergunta
          ? Questionario(
              perguntas: perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              responder: _responder,
            )
          : Resultado(pontucaoTotal, reiniciarQuestionario),
    ));
  }
}
