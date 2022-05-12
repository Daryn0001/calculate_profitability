import 'package:calculate_profitability/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/note.dart';
import '../pages/taskpage.dart';

class TechnicalEquipmentCost extends StatefulWidget {
  const TechnicalEquipmentCost({Key? key, required this.note}) : super(key: key);

  final Note note;

  @override
  _TechnicalEquipmentCostState createState() => _TechnicalEquipmentCostState();
}

class _TechnicalEquipmentCostState extends State<TechnicalEquipmentCost> {
  final title = 'Техникалық құралдар кешеніне кеткен шығынды есептеу';
  final isDigit = RegExp(r'[0-9]\.?[0-9]?');

  final componentNames = [
    'ДЭЕМ-нің саны:',
    'ДЭЕМ бағасы:',
    'Басып шығару құралының бағасы:',
    'Басып шығару құралының бағасы:'
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


  @override
  initState() {
    super.initState();

    if(widget.note.id != 0){
      if(widget.note.quantityOfComputers != 0){
        quantityOfComputersController.text =
            widget.note.quantityOfComputers.toString();
      }
      if(widget.note.costOfOneComputer != 0){
        costOfOneComputerController.text =
            widget.note.costOfOneComputer.toString();
      }
      if(widget.note.quantityOfPrinters != 0){
        quantityOfPrintersController.text =
            widget.note.quantityOfPrinters.toString();
      }
      if(widget.note.costOfOnePrinter != 0){
        costOfOnePrinterController.text =
            widget.note.costOfOnePrinter.toString();
      }


    }
  }

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

    //print('$runtimeType note updated: ${TaskPage.note}\n  ');
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: box(),
    );
  }

  Widget box() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black54, width: 2.5)),
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              )),

          Wrap(children: [
            getInputForms(title: componentNames[0] ,name: '', type: 'дана', controller: quantityOfComputersController),
            getInputForms(title: componentNames[1] ,name: '', type: 'теңге', controller: costOfOneComputerController),
            getInputForms(title: componentNames[2] ,name: '', type: 'дана', controller: quantityOfPrintersController),
            getInputForms(title: componentNames[3], name: '', type: 'теңге', controller: costOfOnePrinterController),


          ]),
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


  Widget getInputForms({required type, required name, index = '', required controller, required title}) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 16,)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 8),
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
          ),
        ],
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
