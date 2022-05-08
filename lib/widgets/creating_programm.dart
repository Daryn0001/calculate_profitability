import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../db/database_helper.dart';
import '../pages/taskpage.dart';


class CostOfCreatingProgram extends StatefulWidget {
  const CostOfCreatingProgram({Key? key}) : super(key: key);

  @override
  _CostOfCreatingProgramState createState() => _CostOfCreatingProgramState();
}

class _CostOfCreatingProgramState extends State<CostOfCreatingProgram> {

  final fixController = TextEditingController();
  //final insuranceController = TextEditingController();
  final salaryController = TextEditingController();
  final hourController = TextEditingController();
  final dayController = TextEditingController();
  final costPerHourController = TextEditingController();
  String result = '';


  void _getAnswer(double d) {
    setState(() {
      result = d.toString();
    });
  }


  Future addNote({
    required double programCreatingCost,
    required double costOfMachineTime,
    required int hour,
    required int day,
    required int costPerHour,
    required double costForWritingAndCorrecting,
    required double timeForFix,
    required int programmerSalary
  })
  async {

    TaskPage.note.programCreatingCost = programCreatingCost;
    TaskPage.note.costOfMachineTime = costOfMachineTime;
    TaskPage.note.hour = hour;
    TaskPage.note.day = day;
    TaskPage.note.costPerHour = costPerHour;
    TaskPage.note.costForWritingAndCorrecting = costForWritingAndCorrecting;
    TaskPage.note.timeForFix = timeForFix;
    TaskPage.note.programmerSalary = programmerSalary;


    //await NotesDatabase.instance.update(TaskPage.note);

    print('note updated: ${TaskPage.note}');
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
          const Text('Программа жазуға және түзеуге кеткен шығындарды есептеу:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              )),
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
                ]
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () async {
                RegExp isDigit = RegExp(r'[0-9]\.?[0-9]?');
                if (salaryController.text.isNotEmpty &&
                    costPerHourController.text.isNotEmpty &&
                    hourController.text.isNotEmpty &&
                    dayController.text.isNotEmpty &&
                    fixController.text.isNotEmpty &&
                    isDigit.hasMatch(salaryController.text) &&
                    isDigit.hasMatch(costPerHourController.text) &&
                    isDigit.hasMatch(hourController.text) &&
                    isDigit.hasMatch(dayController.text) &&
                    isDigit.hasMatch(fixController.text)) {
                  int hour = int.parse(hourController.text);
                  int day = int.parse(dayController.text);
                  int costPerHour = int.parse(costPerHourController.text);
                  double timeForFix = double.parse(fixController.text);
                  int programmerSalary = int.parse(salaryController.text);
                  double costOfMachineTime = (hour * day * costPerHour) * 1.0;
                  double costForWritingAndCorrecting = timeForFix * programmerSalary + TaskPage.note.insuranceCost;
                  double programCreatingCost = costOfMachineTime + costForWritingAndCorrecting;


                 await addNote(
                     programCreatingCost: programCreatingCost,
                     costOfMachineTime: costOfMachineTime,
                     hour: hour,
                     day: day,
                     costPerHour: costPerHour,
                     costForWritingAndCorrecting: costForWritingAndCorrecting,
                     timeForFix: timeForFix,
                     programmerSalary: programmerSalary
                  );

                  _getAnswer(programCreatingCost);
                  hourController.text = '${hourController.text} сағат';
                  dayController.text = '${dayController.text} күн';
                  costPerHourController.text = '${costPerHourController.text} теңге';
                  salaryController.text = '${salaryController.text} теңге';
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

