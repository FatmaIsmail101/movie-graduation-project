import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.prefixIcon,
    required this.text,
    this.suffixIcon,
    this.isPassword = false,
    this.validator,
    this.textEditingController,
    this.onChanged,
    this.onFieldSubmitted,
    required this.textInputType,
    this.onTap});

  final Widget prefixIcon;
  final String text;
  final Widget? suffixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;;
  final VoidCallback? onTapfinal TextEditingController? textEditingController;
  final void Function(String)? onFieldSubmitted;
  final TextInputType textInputType;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      keyboardType: widget.textInputType,
      style: TextStyle(color: Colors.white),
      onChanged: widget.onChanged,
      controller: widget.textEditingController,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator,
      obscureText: widget.isPassword ? obscureText : false,
      decoration: InputDecoration(
        filled: true,
        errorStyle: TextStyle(color: Colors.red,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(

        borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(

        borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(

        borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red),
        ),
        fillColor: Color(0xff282A28),
        hintText: widget.text,

        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? Bounceable(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: obscureText
                    ? Icon(Icons.visibility_off, color: Colors.white)
                    : Icon(Icons.visibility, color: Colors.white),
              )
            : null,
      ),
    );
  }
}
