import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onPressed;

  Resposta(this.texto, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
        ),
        child: Text(
          texto,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
