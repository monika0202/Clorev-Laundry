import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/credit_card_expiration_input_formatter.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int? maxLines;
  final Function(String) onChanged;
  final Function(String) onsubmitted;
  List<FieldValidator<dynamic>> validator;
  final VoidCallback onEditingCompleted;
  BoxConstraints? suffixboxConstraints;
  MaxLengthEnforcement? maxLengthEnforcement;
  final VoidCallback onTap;
  final Widget? suffix;
  final Widget? prefix;
  List<TextInputFormatter>? inputFormat;
  TextInputType? type;
  FocusNode focusNode;
  double height;
  bool completeEditing;
  bool readOnly;
  bool obsecureText;
  CustomTextField(
      {Key? key,
      this.inputFormat,
      this.validator = const [],
      required this.controller,
      this.prefix,
      this.maxLines,
      required this.labelText,
      required this.onChanged,
      this.height = 45,
      required this.onsubmitted,
      this.maxLengthEnforcement,
      required this.completeEditing,
      required this.onEditingCompleted,
      this.suffixboxConstraints,
      this.type,
      this.suffix,
      this.obsecureText = false,
      required this.onTap,
      this.readOnly = false,
      required this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Center(
        child: TextFormField(
          controller: controller,
          maxLengthEnforcement: maxLengthEnforcement,
          validator: MultiValidator(validator),
          onTap: onTap,
          obscureText: obsecureText,
          focusNode: focusNode,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.justify,
          inputFormatters: inputFormat,
          style: TextStyle(color: Colors.black),
          keyboardType: type,
          maxLines: maxLines,
          readOnly: readOnly,
          // controller: phone,
          onFieldSubmitted: onsubmitted,
          onEditingComplete: onEditingCompleted,
          decoration: InputDecoration(
            filled: true,
            fillColor: whiteColor,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            floatingLabelStyle: TextStyle(
                fontFamily: 'helvetica',
                color: completeEditing
                    ? Colors.grey[500]
                    : bluegradientstartColor),
            contentPadding:
                EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 15),
            prefixIcon: prefix,

            alignLabelWithHint: false,
            labelText: labelText,
            labelStyle:
                TextStyle(color: Colors.grey[500], fontFamily: 'helvetica'),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: bluegradientstartColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  color: completeEditing
                      ? Colors.grey[500]!
                      : bluegradientstartColor,
                  width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey[500]!, width: 1),
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.red, width: 1)),
            border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: BorderSide(
                    color: completeEditing
                        ? Colors.grey[500]!
                        : bluegradientstartColor,
                    width: 1)),

            //prefix: countryDropDown,
            // hintText: 'Enter the Mobile Number',
            suffixIcon: suffix,
            suffixIconConstraints: suffixboxConstraints,
            hintStyle:
                TextStyle(color: Colors.grey[500], fontFamily: 'helvetica'),
            //prefixText: "+91"
          ),
          // keyboardType: TextInputType.number,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
