import 'package:flutter/material.dart';
import 'package:interactive_cares_edu/Utils/constants/strings.dart';

class textField extends StatelessWidget {
  textField({Key? key,required this.labelTxt,required this.keyboardType,required this.obscureText,
    required this.prefixIcon,required this.onSaved,required this.validator}) : super(key: key);

  var labelTxt,obscureText,prefixIcon,keyboardType,onSaved,validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        labelText: labelTxt,
        labelStyle: TextStyle(fontSize: 13),
        prefixIcon: Icon(prefixIcon,
          size: 20,
        ),
      ),
      keyboardType: keyboardType,
      onSaved: onSaved,
      validator: validator,
    );
  }
}
