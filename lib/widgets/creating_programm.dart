import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CostOfCreatingProgram extends StatefulWidget {
  static String result = '';
  const CostOfCreatingProgram({Key? key}) : super(key: key);

  @override
  _CostOfCreatingProgramState createState() => _CostOfCreatingProgramState();
}

class _CostOfCreatingProgramState extends State<CostOfCreatingProgram> {
  final fixController = TextEditingController();
  final insuranceController = TextEditingController();
  final salaryController = TextEditingController();
  final hourController = TextEditingController();
  final dayController = TextEditingController();
  final costPerHourController = TextEditingController();
  String costOfMachineTime = '',
      hour = '',
      day = '',
      costPerHour = '',
      tieForFix = '',
      salary = '',
      spendingOnInsurance = '',
      result = '';


  void _getAnswer(double d) {
    setState(() {
      CostOfCreatingProgram.result = result = d.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return box();
  }


  Widget box() {
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          RichText(
            text: const TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 18),
                children: [
                  TextSpan(
                    text: 'C',
                    // style: TextStyle(color: Colors.black, fontSize: 18)
                  ),
                  TextSpan(
                      text: 'пжкш',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFeatures: [FontFeature.subscripts()])),
                  TextSpan(text: ' = ', style: TextStyle(fontSize: 14)),
                  TextSpan(text: 'К',
                    //style: TextStyle(fontSize: 14)
                  ),
                  TextSpan(
                      text: 'пткмуқ',
                      style: TextStyle(
                          fontSize: 10,
                          fontFeatures: [FontFeature.subscripts()])),

                  TextSpan(text: ' + ', style: TextStyle(fontSize: 14)),
                  TextSpan(text: 'Ж', ),
                  TextSpan(
                      text: 'жқ',
                      style: TextStyle(
                          fontSize: 10,
                          fontFeatures: [FontFeature.subscripts()])),
                ]),
          ),
          RichText(
            text: const TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 18),
                children: [
                  TextSpan(
                    text: 'К',
                    // style: TextStyle(color: Colors.black, fontSize: 18)
                  ),
                  TextSpan(
                      text: 'пткмуқ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFeatures: [FontFeature.subscripts()])),
                  TextSpan(text: ' = ', style: TextStyle(fontSize: 14)),
                  TextSpan(text: 'k',),
                  TextSpan(text: ' * ', style: TextStyle(fontSize: 14)),
                  TextSpan(text: 'd', ),
                  TextSpan(text: ' * ', style: TextStyle(fontSize: 14)),
                  TextSpan(text: 'q', ),
                ]),
          ),
          RichText(
            text: const TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 18),
                children: [
                  TextSpan(
                    text: 'Ж',
                    // style: TextStyle(color: Colors.black, fontSize: 18)
                  ),
                  TextSpan(
                      text: 'жқ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFeatures: [FontFeature.subscripts()])),
                  TextSpan(text: ' = ', style: TextStyle(fontSize: 14)),
                  TextSpan(text: 'А',
                    //style: TextStyle(fontSize: 14)
                  ),
                  TextSpan(
                      text: 'ум',
                      style: TextStyle(
                          fontSize: 10,
                          fontFeatures: [FontFeature.subscripts()])),

                  TextSpan(text: ' * ', style: TextStyle(fontSize: 14)),
                  TextSpan(text: 'Ж', ),
                  TextSpan(
                      text: 'пж',
                      style: TextStyle(
                          fontSize: 10,
                          fontFeatures: [FontFeature.subscripts()])),
                  TextSpan(text: ' + ', style: TextStyle(fontSize: 14)),
                  TextSpan(text: 'А', ),
                  TextSpan(
                      text: 'әсш',
                      style: TextStyle(
                          fontSize: 10,
                          fontFeatures: [FontFeature.subscripts()])),
                ]),
          ),
          Form(
            //autovalidateMode: AutovalidateMode.always,
            child: Wrap(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: ConstrainedBox(
                          constraints: BoxConstraints.tight(const Size(400, 50)),
                          child: getInputForms(name: 'k',  controller: hourController))
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: ConstrainedBox(
                          constraints: BoxConstraints.tight(const Size(400, 50)),
                          child: getInputForms(name: 'd', controller: dayController))
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: ConstrainedBox(
                          constraints: BoxConstraints.tight(const Size(400, 50)),
                          child: getInputForms(name: 'q',  controller: costPerHourController))
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: ConstrainedBox(
                          constraints: BoxConstraints.tight(const Size(400, 50)),
                          child: getInputForms(name: 'А', index: 'ум',  controller: fixController))
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: ConstrainedBox(
                          constraints: BoxConstraints.tight(const Size(400, 50)),
                          child: getInputForms(name: 'Ж', index: 'пж',  controller: salaryController))
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: ConstrainedBox(
                          constraints: BoxConstraints.tight(const Size(400, 50)),
                          child: getInputForms(name: 'А', index: 'әсш',   controller: insuranceController))
                  )
                ]
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                RegExp isDigit = RegExp(r'[0-9]\.?[0-9]?');
                if (salaryController.text.isNotEmpty &&
                    insuranceController.text.isNotEmpty &&
                    costPerHourController.text.isNotEmpty &&
                    hourController.text.isNotEmpty &&
                    dayController.text.isNotEmpty &&
                    fixController.text.isNotEmpty &&
                    isDigit.hasMatch(salaryController.text) &&
                    isDigit.hasMatch(insuranceController.text) &&
                    isDigit.hasMatch(costPerHourController.text) &&
                    isDigit.hasMatch(hourController.text) &&
                    isDigit.hasMatch(dayController.text) &&
                    isDigit.hasMatch(fixController.text)) {
                  double n1 = double.parse(hourController.text);
                  double n2 = double.parse(dayController.text);
                  double n3 = double.parse(costPerHourController.text);
                  double n4 = double.parse(fixController.text);
                  double n5 = double.parse(salaryController.text);
                  double n6 = double.parse(insuranceController.text);
                  double d1 = (n1 * n2 * n3) + n4 * n5 + n6;

                  _getAnswer(d1);
                  salaryController.text = '${salaryController.text} тг';
                  insuranceController.text = '${insuranceController.text} тг';
                  fixController.text = '${fixController.text} ай';

                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                        Text('Alert', style: TextStyle(color: Colors.red))),
                  );
                }
              },
              child: const Text('Енгізу'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: RichText(
              text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    const TextSpan(text: 'С', style: TextStyle(fontSize: 18)),
                    const TextSpan(
                        text: 'пжкш',
                        style: TextStyle(
                            fontSize: 12,
                            fontFeatures: [FontFeature.subscripts()])),
                    const TextSpan(text: ' = ', style: TextStyle(fontSize: 18)),
                    TextSpan(
                        text: result, style: const TextStyle(fontSize: 16)),
                    const TextSpan(
                        text: ' тг ', style: TextStyle(fontSize: 14)),
                  ]),
            ),
          ),
        ]));
  }

  Widget getInputForms({required name, index = '', required controller}) {

    return Container(
      child: ListTile(
        leading: RichText(
          text:
          TextSpan(style: const TextStyle(color: Colors.black), children: [
            TextSpan(text: name, style:const TextStyle(fontSize: 18)),
            TextSpan(
                text: index,
                style: const TextStyle(
                    fontSize: 12, fontFeatures: [FontFeature.subscripts()])),
          ]),
        ),
        title: getInputField(controller: controller),
      ),
    );
  }

  Widget getInputField({controller}) {
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
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}

