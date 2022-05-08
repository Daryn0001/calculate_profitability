import 'package:calculate_profitability/widgets/text_span.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pages/taskpage.dart';

class TechnicalEquipmentCost extends StatefulWidget {
  const TechnicalEquipmentCost({Key? key}) : super(key: key);

  @override
  _TechnicalEquipmentCostState createState() => _TechnicalEquipmentCostState();
}

class _TechnicalEquipmentCostState extends State<TechnicalEquipmentCost> {
  final title = 'техникалық құралдар кешеніне кеткен шығынды есептеу';
  final isDigit = RegExp(r'[0-9]\.?[0-9]?');
  double componentFontSize = 14;
  final componentNames = [
    'ДЭЕМ-нің саны:',
    'ДЭЕМ бағасы:',
    'Басып шығару құралының бағасы',
    'Басып шығару құралының бағасы'
  ];
  int technicalEquipmentCosts = 0;
  int quantityOfComputers = 0;
  int costOfOneComputer = 0;
  int quantityOfPrinters = 0;
  int costOfOnePrinter = 0;

  final quantityOfComputersController = TextEditingController();
  final costOfOneComputerController = TextEditingController();
  final quantityOfPrintersController = TextEditingController();
  final costOfOnePrinterController = TextEditingController();

  String result = "";

  void _getAnswer(d) {
    setState(() {
      result = d.toString();
    });
  }

  Future addNote ({
    required technicalEquipmentCosts,
    required quantityOfComputers,
    required costOfOneComputer,
    required quantityOfPrinters,
    required costOfOnePrinter,
    }) async
  {
    TaskPage.note.technicalEquipmentCosts = technicalEquipmentCosts;
    TaskPage.note.quantityOfComputers = quantityOfComputers;
    TaskPage.note.costOfOneComputer = costOfOneComputer;
    TaskPage.note.quantityOfPrinters = quantityOfPrinters;
    TaskPage.note.costOfOnePrinter = costOfOnePrinter;

    print('$runtimeType note updated: ${TaskPage.note}\n  ');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: box(),
    );
  }

  Widget box() {
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              )),

          Form(
            child: Wrap(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                getComponentName(name: componentNames[0]),
                getInputForms(name: '', type: 'дана', controller: quantityOfComputersController),
              ]),
              Column(children: [
                getComponentName(name: componentNames[1]),
                getInputForms(name: '', type: 'теңге', controller: costOfOneComputerController),
              ]),
              Column(children: [
                getComponentName(name: componentNames[2]),
                getInputForms(name: '', type: 'дана', controller: quantityOfPrintersController),
              ]),
              Column(children: [
                getComponentName(name: componentNames[3]),
                getInputForms(name: '', type: 'теңге', controller: costOfOnePrinterController),
              ]),


            ]),
          ),
          ElevatedButton(
            onPressed: () async {

              if (quantityOfComputersController.text.isNotEmpty &&
                  costOfOneComputerController.text.isNotEmpty &&
                  quantityOfPrintersController.text.isNotEmpty &&
                  costOfOnePrinterController.text.isNotEmpty &&
                  isDigit.hasMatch(quantityOfComputersController.text) &&
                  isDigit.hasMatch(costOfOneComputerController.text) &&
                  isDigit.hasMatch(quantityOfPrintersController.text) &&
                  isDigit.hasMatch(costOfOnePrinterController.text)) {

                quantityOfComputers = int.parse(quantityOfComputersController.text).toInt();
                costOfOneComputer = int.parse(costOfOneComputerController.text).toInt();
                quantityOfPrinters = int.parse(quantityOfPrintersController.text).toInt();
                costOfOnePrinter = int.parse(costOfOnePrinterController.text).toInt();

                technicalEquipmentCosts = (quantityOfComputers * costOfOneComputer)
                                          + (quantityOfPrinters * costOfOnePrinter);

                addNote (
                   technicalEquipmentCosts: technicalEquipmentCosts,
                   quantityOfComputers: quantityOfComputers,
                   costOfOneComputer: costOfOneComputer,
                   quantityOfPrinters: quantityOfPrinters,
                   costOfOnePrinter: costOfOnePrinter,
                );

                _getAnswer(technicalEquipmentCosts);
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
          Container(
            padding: const EdgeInsets.all(8),
            child: RichText(
              text: TextSpan(children: [
                TextBuilder.getText(text: 'С'),
                TextBuilder.getTextIndex(text: 'ткқш'),
                TextBuilder.getText(text: ' = '),
                TextBuilder.getText(text: result),
                TextBuilder.getTextIndex(text: ' теңге'),
              ]),
            ),
          ),
        ]));
  }

  Widget getComponentName({required name}){
    return Text(name,
      style: TextStyle(fontSize: componentFontSize),
    );
  }

  Widget getInputForms({required name, index = '', required controller, required type}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(const Size(400, 50)),
        child: ListTile(
          leading: RichText(
            text: TextSpan(children: [
              TextBuilder.getText(text: name),
              TextBuilder.getTextIndex(text: index),
            ]),
          ),
          title: getInputField(controller: controller),
          trailing: Text(type, style: const TextStyle(fontSize: 12)),

        ),
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
