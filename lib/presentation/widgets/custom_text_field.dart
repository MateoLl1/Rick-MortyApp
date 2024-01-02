
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, 
    required this.onChanged, 
    required this.label
  });
  final Function(String)? onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20)
    );
    final focusNode = FocusNode();
    return TextFormField(
      
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      decoration: InputDecoration(
        border: border,
        isDense: true,
        hintText: label,
        suffixIcon: const Icon(Icons.search),
      ),
      
      onChanged: onChanged,

    );
  }
}