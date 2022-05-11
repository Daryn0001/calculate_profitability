import 'package:calculate_profitability/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/note.dart';
import '../pages/taskpage.dart';


class TextFields {
  static const descriptionD = '1 ай ішіндегі жұмыс күндерінің саны: ';
  static const descriptionY = 'Рентабельдік норматив: ';
}


class ImplementingProgramCost extends StatefulWidget {
  const ImplementingProgramCost({Key? key, required this.note}) : super(key: key);

  final Note note;

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

  String result = '0';


  // ? 4.4
  int totalCostForCreationAndImplementing = 0;
  double profitabilityStandard = 0;
  double profit = 0;
  double projectPrice = 0;
  int programPrice = 0;

  final workingDayPerMonth2Controller = TextEditingController();
  final profitabilityStandardController = TextEditingController();

  void _getAnswer(d) {
    setState(() {
      result = d.toString();
    });
  }


  @override
  initState() {
    super.initState();

    if(widget.note.id != null){
      workingDayPerMonth2Controller.text = widget.note.workingDayPerMonth2.toString();
      profitabilityStandardController.text = widget.note.profitabilityStandard.toString();
    }
  }

  Future addNote({required costOfImplementingProgram,
                  required profitabilityStandard}) async {
    TaskPage.note.costOfImplementingProgram = costOfImplementingProgram;

    setState(() {
      // ?  4.0 point COMPLETE
      totalCostForCreationAndImplementing =
      (TaskPage.note.algorithmCreatingCost + TaskPage.note.technicalEquipmentCosts +
          TaskPage.note.programCreatingCost + costOfImplementingProgram).round();

      //? 4.4 point COMPLETE
      profit = (profitabilityStandard / 100) * totalCostForCreationAndImplementing;

      projectPrice = totalCostForCreationAndImplementing + profit;

      programPrice = (projectPrice +  (projectPrice / 10)).round();
      TaskPage.note.totalCostForCreationAndImplementing = totalCostForCreationAndImplementing;
      TaskPage.note.profit = profit;
      TaskPage.note.workingDayPerMonth2 = workingDayPerMonth2;
      TaskPage.note.profitabilityStandard = profitabilityStandard;
      TaskPage.note.projectPrice = projectPrice;
      TaskPage.note.programPrice = programPrice;
    });




   // print('$runtimeType note updated: ${TaskPage.note}\n');
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
          TextBuilder.getTitle(text: title),

          Wrap(children: [
            TextBuilder.getInputForms(
                title: TextFields.descriptionD,
                name: 'D',
                type: 'күн',
                controller: workingDayPerMonth2Controller, ),
            TextBuilder.getInputForms(
              title: TextFields.descriptionY,
                name: 'У',
                index: 'p',
                type: '%',
                controller: profitabilityStandardController),
          ]),
          ElevatedButton(
            onPressed: () async {
              if (workingDayPerMonth2Controller.text.isNotEmpty &&
                  profitabilityStandardController.text.isNotEmpty &&
              isDigit.hasMatch(workingDayPerMonth2Controller.text) &&
                  isDigit.hasMatch(profitabilityStandardController.text)) {
                workingDayPerMonth2 =
                    int.parse(workingDayPerMonth2Controller.text).toInt();
                profitabilityStandard =
                    double.parse(profitabilityStandardController.text).toDouble();
                String str = (TaskPage.note.day / workingDayPerMonth2).toStringAsFixed(2);
                double acc = double.parse(str).toDouble();

                costOfImplementingProgram = (
                    TaskPage.note.costOfMachineTime +
                        (
                            TaskPage.note.programmerSalary * acc
                            + TaskPage.note.insuranceCost
                        )).round();

                addNote(costOfImplementingProgram: costOfImplementingProgram,
                    profitabilityStandard: profitabilityStandard);

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


          getResultText(title: 'Программаны ендірумен байланысты шығын',
              text:'С', index:'кекш', value: result),

          getResultText(title: 'Кешенді құруға және өндіруге кеткен шығын',
            text:'С', index:'ж', value: totalCostForCreationAndImplementing,),

          getResultText(title: 'Пайда',text:'П', value: profit),

          getResultText(title: 'Жасалған жобаның бағасы',text:'Z', value: projectPrice),

          getResultText(title: 'Ақпараттылық тиімділік', text:'Т', index:'ж', value:result,),

          getResultText(title: 'Құрастырылған бағдарламаның бағасы', text:'Z', index:'жжб',  value: programPrice,),

        ]));
  }

  Widget getResultText({required title, required text, index = '', required value, type= ' теңге'}){
    return  Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top:8),
      child: Column(
        children: [
           Text('$title :',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16)),
          RichText(
            text: TextSpan(children: [
              TextBuilder.getText(text: text),
              TextBuilder.getTextIndex(text: index),
              TextBuilder.getText(text: ' = '),
              TextBuilder.getText(text: value.toString()),
              TextBuilder.getTextIndex(text: type),
            ]),
          ),
        ],
      ),
    );
  }

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
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
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
