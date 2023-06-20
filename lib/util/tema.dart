import 'package:flutter/material.dart';
import 'dart:ui';

class Tema {
  Tema._();

  static const corPrimaria = Color(0xFF2EC32C);
  static const corSencudaria = Color(0xFFFFF8D9);
  static const corTerciaria = Color(0xFFEBA83A);
  static const corIcone = Color.fromARGB(255, 255, 255, 255);

  static final ThemeData meuTema = ThemeData(
    // definindo cor primaria
    primaryColor: corPrimaria,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: const MaterialColor(
      0xFF2EC32C,
      <int, Color>{
        50: Color(0xFF2EC32C),
        100: Color(0xFF2EC32C),
        200: Color(0xFF2EC32C),
        300: Color(0xFF2EC32C),
        400: Color(0xFF2EC32C),
        500: Color(0xFF2EC32C),
        600: Color(0xFF2EC32C),
        700: Color(0xFF2EC32C),
        800: Color(0xFF2EC32C),
        900: Color(0xFF2EC32C),
      },
    )).copyWith(secondary: corSencudaria),

    // definido estilos para os textos
  );
}
