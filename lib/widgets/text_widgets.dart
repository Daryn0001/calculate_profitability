import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/res/style.dart';

class TextBuilder {
  static const _alertText = 'Барлық мәтін жолақтарын енгізіңіз';
  static final _titleTextColor = AppStyle.titleTextColor;

// ! alert text widget
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> getAlertMessage({required context}){
    return ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
          content:
          Text(_alertText, style: TextStyle(color: AppStyle.alertMessageColor))),
    );
  }

  // ! create title
  static Text getTitle({required text, size = 18.0, color}){
    color ??= _titleTextColor;
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: color,
        ));
  }

  // ! create text
  static TextSpan getText({required text, size = 18.0, color}) {
    color ??= _titleTextColor;
    size = size.toDouble();
    return TextSpan(
        text: text,
        style: TextStyle(color: color,
      fontSize: size, ));
  }

  // ! create text index
  static TextSpan getTextIndex({required text, size = 11.0, color}) {
    color  ??= _titleTextColor;
    return TextSpan(
        text: text,
        style: TextStyle(
            color: color,
            fontSize: size,
            fontFeatures: const [FontFeature.subscripts()]));
  }

  static Widget getInputForms({required type, required name, index = '', required controller, required title}) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 16, )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 8),
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(400, 50)),
              child: ListTile(
                leading: RichText(
                  text: TextSpan(children: [
                    TextBuilder.getText(text: name, ),
                    TextBuilder.getTextIndex(text: index, ),
                  ]),
                ),
                title: getInputField(controller: controller),
                trailing: Text(type, style: const TextStyle(fontSize: 12)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget getInputField({controller}) {
    return Container(
      height: 30,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This is the required field';
          }
          return null;
        },
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9\.{1}]'))
        ],
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        controller: controller,
        minLines: 1,
        maxLines: 1,
        decoration: InputDecoration(
          hoverColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.white70,
              width: 2.5,
            ),
          ),
        ),
      ),
    );
  }

}
