import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// ignore: must_be_immutable
class InputGeneric extends StatefulWidget {
  late String label;
  late TextEditingController controller;
  late TextInputType typeInput;
  late String? Function(String?)? validator;
  late String Function(String?) onChange;
  late String errorText;

  InputGeneric({
    Key? key,
    required this.label,
    required this.controller,
    required this.typeInput,
    // required this.validator,
    // required this.onChange,
    // required this.errorText,
  }) : super(key: key);

  @override
  State<InputGeneric> createState() => _InputGenericState();
}

class _InputGenericState extends State<InputGeneric> {
  @override
  void initState() {
    super.initState();
    widget.controller = TextEditingController();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  void _validateInput(String value) {
    setState(() {
      widget.errorText = widget.validator!(value) ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.typeInput,
      decoration: InputDecoration(
        labelText: widget.label,
        //  errorText: widget.errorText
      ),
      // validator: widget.validator,
      onEditingComplete: () => _validateInput(widget.controller.text),
      // onChanged: widget.onChange,
    );
  }
}
