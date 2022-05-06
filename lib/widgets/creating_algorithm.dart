import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CostOfCreatingAnAlgorithm extends StatefulWidget {
   static String result =  '';
  const CostOfCreatingAnAlgorithm({Key? key}) : super(key: key);

  @override
  _CostOfCreatingAnAlgorithmState createState() => _CostOfCreatingAnAlgorithmState();
}

class _CostOfCreatingAnAlgorithmState extends State<CostOfCreatingAnAlgorithm> {
  final salaryController = TextEditingController();
  final insuranceController = TextEditingController();
  final timeController = TextEditingController();
  String salary = '',
      timeSpend = '',
      spendingOnInsurance = '',
      result = '';


  void _getAnswer(double d) {
    setState(() {
      CostOfCreatingAnAlgorithm.result = result =  d.toString();
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
                      text: 'ақкш',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFeatures: [FontFeature.subscripts()])),
                  TextSpan(text: ' = ', style: TextStyle(fontSize: 14)),
                  TextSpan(text: 'Ж',
                      //style: TextStyle(fontSize: 14)
                  ),
                  TextSpan(
                      text: 'қ',
                      style: TextStyle(
                          fontSize: 10,
                          fontFeatures: [FontFeature.subscripts()])),
                  TextSpan(text: ' * ', style: TextStyle(fontSize: 14)),
                  TextSpan(text: 't',),
                  TextSpan(text: ' + ', style: TextStyle(fontSize: 14)),
                  TextSpan(text: 'A', ),
                  TextSpan(
                      text: 'әс',
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
                          child: getInputForms(name: 'Ж', index: 'қ', controller: salaryController))
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: ConstrainedBox(
                          constraints: BoxConstraints.tight(const Size(400, 50)),
                          child: getInputForms(name: 'Т', controller: timeController))
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: ConstrainedBox(
                          constraints: BoxConstraints.tight(const Size(400, 50)),
                          child: getInputForms(name: 'А', index: 'әс', controller: insuranceController))
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
                    timeController.text.isNotEmpty &&
                    isDigit.hasMatch(salaryController.text) &&
                    isDigit.hasMatch(insuranceController.text) &&
                    isDigit.hasMatch(timeController.text)) {
                  double n1 = double.parse(salaryController.text);
                  double n2 = double.parse(timeController.text);
                  double n3 = double.parse(insuranceController.text);
                  double d1 = n1 * n2 + ((n1 * n3) / 100);

                  _getAnswer(d1);
                  salaryController.text = '${salaryController.text} тг';
                  insuranceController.text = '${insuranceController.text}%';
                  timeController.text = '${timeController.text} ай';

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
                        text: 'ақкш',
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
