import 'package:calculate_profitability/widgets/text_span.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pages/taskpage.dart';

class ImplementingProgramCost extends StatefulWidget {
  const ImplementingProgramCost({Key? key}) : super(key: key);

  @override
  _ImplementingProgramCostState createState() =>
      _ImplementingProgramCostState();
}

class _ImplementingProgramCostState extends State<ImplementingProgramCost> {
  final isDigit = RegExp(r'[0-9]\.?[0-9]?');
  final title = "Программаны ендірумен байланысты шығындарды есептеу";
  int costOfImplementingProgram = 0;
  double costOfMachineTime = 0;
  int day = 0;
  int workingDayPerMonth2 = 0;
  int programmerSalary = 0;
  double insuranceCost = 0;
  String result = '';

  final workingDayPerMonth2Controller = TextEditingController();

  void _getAnswer(d) {
    setState(() {
      result = d.toString();
    });
  }

  Future addNote({required costOfImplementingProgram}) async {
    TaskPage.note.costOfImplementingProgram = costOfImplementingProgram;

    setState(() {
      // ?  4.0 point COMPLETE
      TaskPage.note.totalCostForCreationAndImplementing =
          (TaskPage.note.algorithmCreatingCost + TaskPage.note.technicalEquipmentCosts +
              TaskPage.note.programCreatingCost + costOfImplementingProgram).round();

    });
    print('$runtimeType note updated: ${TaskPage.note}\n');
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
              getInputForms(
                  name: 'D',
                  type: '',
                  controller: workingDayPerMonth2Controller),
            ]),
          ),
          ElevatedButton(
            onPressed: () async {
              if (workingDayPerMonth2Controller.text.isNotEmpty &&
                  isDigit.hasMatch(workingDayPerMonth2Controller.text)) {
                workingDayPerMonth2 =
                    int.parse(workingDayPerMonth2Controller.text).toInt();
                String str = (TaskPage.note.day / workingDayPerMonth2).toStringAsFixed(2);
                double acc = double.parse(str).toDouble();

                costOfImplementingProgram = (
                    TaskPage.note.costOfMachineTime +
                        (
                            TaskPage.note.programmerSalary * acc
                            + TaskPage.note.insuranceCost
                        )).round();

                addNote(costOfImplementingProgram: costOfImplementingProgram);

                _getAnswer(costOfImplementingProgram);
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
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(top:8),
            child: RichText(
              text: TextSpan(children: [
                TextBuilder.getText(text: 'Кешенді құруға және өндіруге кеткен шығын:'),
                TextBuilder.getText(text: 'С'),

                TextBuilder.getText(text: ' = '),
                TextBuilder.getText(text: TaskPage.note.totalCostForCreationAndImplementing.toString()),
                TextBuilder.getTextIndex(text: ' теңге'),
              ]),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(top:8),
            child: RichText(
              text: TextSpan(children: [
                TextBuilder.getText(text: 'Ақпараттылық тиімділік:'),
                TextBuilder.getText(text: 'Т'),
                TextBuilder.getTextIndex(text: 'ж'),
                TextBuilder.getText(text: ' = '),
                TextBuilder.getText(text: result),
                TextBuilder.getTextIndex(text: ' теңге'),
              ]),
            ),
          ),
        ]));
  }

  /* Widget getComponentName({required name}){
    return Text(name,
      style: TextStyle(fontSize: componentFontSize),
    );
  }*/

  Widget getInputForms(
      {required name, index = '', required controller, required type}) {
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
