import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonGeneric extends StatefulWidget {
  const ButtonGeneric({Key? key}) : super(key: key);

  get onPressed => null;

  @override
  State<ButtonGeneric> createState() => _ButtonGenericState();
}

class _ButtonGenericState extends State<ButtonGeneric> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: null,
    );
  }
}
