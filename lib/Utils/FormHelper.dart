import 'package:flutter/material.dart';

class FormHelper {
  static Widget textInput(
      BuildContext context, Object initialValue, Function onChanged,
      {bool isTextArea = false,
      bool isNumberInput = false,
      obscureText: false,
      Function onValidate,
      Widget prefixIcon,
      Widget suffixIcon,
      String text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextFormField(
              initialValue: initialValue != null ? initialValue.toString() : '',
              decoration: fieldDecoration(
                context,
                suffixIcon: suffixIcon,
                hintText: text,
              ),
              obscureText: obscureText,
              maxLines: !isTextArea ? 1 : 3,
              keyboardType:
                  isNumberInput ? TextInputType.number : TextInputType.text,
              onChanged: (String value) {
                return onChanged(value);
              },
              validator: (value) {
                return onValidate(value);
              }),
        ),
      ),
    );
  }

  static InputDecoration fieldDecoration(
    BuildContext context, {
    String hintText,
    String helperText,
    Widget prefixIcon,
    Widget suffixIcon,
  }) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(6),
      hintText: hintText,
      helperText: helperText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      hasFloatingPlaceholder: false,
      filled: false,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusedBorder: OutlineInputBorder(
        borderSide: new BorderSide(color: Colors.white),
        borderRadius: new BorderRadius.circular(25.7),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: new BorderSide(color: Colors.white),
        borderRadius: new BorderRadius.circular(25.7),
      ),
    );
  }

  static Widget fieldLabel(String labelName) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
        child: Text(
          labelName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ));
  }

  static Widget saveButton(String buttonText, Function onTap,
      {String colors, String textColor, bool fullWidth}) {
    return Container(
      height: 50.0,
      width: 150.0,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.redAccent,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            color: Colors.red,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showMessage(
    BuildContext context,
    String title,
    String message,
    String buttonText,
    Function onPressed,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            FlatButton(
              onPressed: () {
                return onPressed();
              },
              child: Text(buttonText),
            ),
          ],
        );
      },
    );
  }
}
