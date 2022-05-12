import 'dart:ui';

import 'package:calculate_profitability/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import '../model/note.dart';
import '../pages/taskpage.dart';


class TextFields {
  static const title = 'Программа жазуға және түзеуге кеткен шығындарды есептеу:';
  static const descriptionForK = 'ДЭЕМ-нің бір күндік жұмыс істеу уақыты: ';
  static const descriptionForD = 'ДЭЕМ-де жұмыс жасау мерзімі: ';
  static const descriptionForQ = 'Машиналық уақыт сағатының құны: ';
  static const descriptionForA = 'Програманы түзетуге кеткен уақыт мерзімі: ';
  static const descriptionForJ = 'Программист жалақысы: ';
}

class CostOfCreatingProgram extends StatefulWidget {
  const CostOfCreatingProgram({Key? key, required this.note}) : super(key: key);

  final Note note;

  @override
  _CostOfCreatingProgramState createState() => _CostOfCreatingProgramState();
}

class _CostOfCreatingProgramState extends State<CostOfCreatingProgram> {

  final fixController = TextEditingController();
  final salaryController = TextEditingController();
  final hourController = TextEditingController();
  final dayController = TextEditingController();
  final costPerHourController = TextEditingController();
  String result = '';


  @override
  initState() {
    super.initState();

    if(widget.note.id != null){
      if(widget.note.programmerSalary != 0){
        salaryController.text = widget.note.programmerSalary.toString();
      }
      if(widget.note.hour != 0){
        hourController.text = widget.note.hour.toString();
      }
      if(widget.note.day != 0){
        dayController.text = widget.note.day.toString();
      }
      if(widget.note.costPerHour != 0){
        costPerHourController.text = widget.note.costPerHour.toString();
      }
      if(widget.note.timeForFix != 0){
        fixController.text = widget.note.timeForFix.toString();
      }
    }
  }

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

   // print('$runtimeType note updated: ${TaskPage.note}\n');
  }


  @override
  Widget build(BuildContext context) {
    return box();
  }


  Widget box() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black54, width: 2.5)),
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          TextBuilder.getTitle(text: TextFields.title),
          RichText(
            text: TextSpan(
                children: [
                  TextBuilder.getText(text: 'C'),
                  TextBuilder.getTextIndex(text: 'пжкш'),
                  TextBuilder.getText(text: ' = '),
                  TextBuilder.getText(text: 'К'),
                  TextBuilder.getTextIndex(text: 'пткмуқ'),
                  TextBuilder.getText(text: ' + '),
                  TextBuilder.getText(text: 'Ж'),
                  TextBuilder.getTextIndex(text: 'жқ')
                ]),
          ),
          RichText(
            text: TextSpan(
                children: [
                  TextBuilder.getText(text: 'К'),
                  TextBuilder.getTextIndex(text: 'пткмуқ'),
                  TextBuilder.getText(text: ' = '),
                  TextBuilder.getText(text: 'k',),
                  TextBuilder.getText(text: ' * ', ),
                  TextBuilder.getText(text: 'd', ),
                  TextBuilder.getText(text: ' * ', ),
                  TextBuilder.getText(text: 'q', ),
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
          Wrap(
              children: [
                TextBuilder.getInputForms(title: TextFields.descriptionForK, name: 'k', type: 'сағат',  controller: hourController),
                TextBuilder.getInputForms(title: TextFields.descriptionForD, type: 'күн', name: 'd', controller: dayController),
                TextBuilder.getInputForms(title: TextFields.descriptionForQ, type: 'теңге', name: 'q',  controller: costPerHourController),
                TextBuilder.getInputForms(title: TextFields.descriptionForA, type: 'ай', name: 'А', index: 'ум',  controller: fixController),
                TextBuilder.getInputForms(title: TextFields.descriptionForJ, type: 'теңге', name: 'Ж', index: 'пж',  controller: salaryController),
              ]
          ),
          ElevatedButton(
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

              } else {
                TextBuilder.getAlertMessage(context: context);
              }
            },
            child: const Text('Енгізу'),
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

}

