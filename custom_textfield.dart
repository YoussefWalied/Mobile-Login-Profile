import 'package:assignment/colortemplate.dart';
import 'package:flutter/material.dart';
/*
class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    required this.controller,
    this.icon,
    this.hintText = "",
    this.labelText = "",
    this.isObscureText = false,
    this.validator,
    required this.keyboardType,
    IconData? suffixIcon,
    Function? suffixPressed,
  }) : super(key: key);

  final TextEditingController controller;
  final IconData? icon;
  final String hintText;
  final String labelText;
  final bool isObscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  bool isPasswordShown = false;
  bool get isPasswordShownGetter => isPasswordShown;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.03),
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        key: widget.key,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.isObscureText ? !widget.isPasswordShown : false,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.only(
            left: mediaQuery.size.height * 0.02,
            right: mediaQuery.size.height * 0.025,
            top: mediaQuery.size.height * 0.02,
            bottom: mediaQuery.size.height * 0.009,
          ),
          counterText: "",
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            fontFamily: 'Open sans',
            fontSize: 16,
            color: kTextColorPurple,
          ),
          hintText: widget.hintText,
          prefixIcon: widget.icon != null
              ? Icon(widget.icon, color: Colors.black)
              : null,
          suffixIcon: Visibility(
            visible: widget.isObscureText,
            child: IconButton(
              icon: Padding(
                padding: EdgeInsets.only(top: mediaQuery.size.height * 0.0),
                child: Icon(
                  widget.isPasswordShown
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.black,
                  size: mediaQuery.size.width * 0.06,
                ),
              ),
              onPressed: () {
                setState(() {
                  widget.isPasswordShown = !widget.isPasswordShown;
                });
              },
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1.2, color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1.5, color: Colors.black),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    required this.controller,
    this.icon,
    this.hintText = "",
    this.labelText = "",
    this.isObscureText = false,
    this.validator,
    required this.keyboardType,
    IconData? suffixIcon,
    Function? suffixPressed,
  }) : super(key: key);

  final TextEditingController controller;
  final IconData? icon;
  final String hintText;
  final String labelText;
  final bool isObscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  bool isPasswordShown = false;
  bool get isPasswordShownGetter => isPasswordShown;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.03),
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        key: widget.key,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.isObscureText ? !widget.isPasswordShown : false,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.only(
            left: mediaQuery.size.height * 0.02,
            right: mediaQuery.size.height * 0.025,
            top: mediaQuery.size.height * 0.02,
            bottom: mediaQuery.size.height * 0.009,
          ),
          counterText: "",
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            fontFamily: 'Open sans',
            fontSize: 16,
            color: kTextColorPurple,
          ),
          hintText: widget.hintText,
          prefixIcon: widget.icon != null
              ? Icon(widget.icon, color: Colors.black)
              : null,
          errorStyle: const TextStyle(color: Colors.red),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1.2, color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1.5, color: Colors.red),
          ),
          suffixIcon: Visibility(
            visible: widget.isObscureText,
            child: IconButton(
              icon: Padding(
                padding: EdgeInsets.only(top: mediaQuery.size.height * 0.0),
                child: Icon(
                  widget.isPasswordShown
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.black,
                  size: mediaQuery.size.width * 0.06,
                ),
              ),
              onPressed: () {
                setState(() {
                  widget.isPasswordShown = !widget.isPasswordShown;
                });
              },
            ),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
*/
class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    required this.controller,
    this.icon,
    this.hintText = "",
    this.labelText = "",
    this.isObscureText = false,
    this.validator,
    required this.keyboardType,
    IconData? suffixIcon,
    Function? suffixPressed,
  }) : super(key: key);

  final TextEditingController controller;
  final IconData? icon;
  final String hintText;
  final String labelText;
  final bool isObscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  bool isPasswordShown = false;
  bool get isPasswordShownGetter => isPasswordShown;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.03),
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        key: widget.key,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.isObscureText ? !widget.isPasswordShown : false,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.only(
            left: mediaQuery.size.height * 0.02,
            right: mediaQuery.size.height * 0.025,
            top: mediaQuery.size.height * 0.02,
            bottom: mediaQuery.size.height * 0.009,
          ),
          counterText: "",
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            fontFamily: 'Open sans',
            fontSize: 16,
            color: kTextColorPurple,
          ),
          hintText: widget.hintText,
          prefixIcon: widget.icon != null
              ? Icon(widget.icon, color: Colors.black)
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1.2, color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1.5, color: Colors.black),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1.2, color: kSecondColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1.5, color: Colors.red),
          ),
          suffixIcon: Visibility(
            visible: widget.isObscureText,
            child: IconButton(
              icon: Padding(
                padding: EdgeInsets.only(top: mediaQuery.size.height * 0.0),
                child: Icon(
                  widget.isPasswordShown
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.black,
                  size: mediaQuery.size.width * 0.06,
                ),
              ),
              onPressed: () {
                setState(() {
                  widget.isPasswordShown = !widget.isPasswordShown;
                });
              },
            ),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
