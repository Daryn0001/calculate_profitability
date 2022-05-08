import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pages/taskpage.dart';

class CostOfMachineTimeHour extends StatefulWidget {
  const CostOfMachineTimeHour({Key? key}) : super(key: key);

  @override
  _CostOfMachineTimeHourState createState() => _CostOfMachineTimeHourState();
}

class _CostOfMachineTimeHourState extends State<CostOfMachineTimeHour> {
  final double dividerWidth = 70;
  final double textSize = 18;
  final double indexSize = 11;

  int costOfMachineTimeHours = 0;
  double depreciationPerMonth = 0;
  double electricityConsumedPerMonth = 0;
  double maintenanceCostsPerMonth = 0;
  int workingDayPerMonth = 0;
  int hourlyWorkingDayRate = 0;

  int initialPrice = 0;
  double annualDepreciationPercentage = 0;
  double requiredPower = 0;
  double operatingTime = 0;
  double electricityTariff = 0;

  int programmerSalary = 0;
  int numberOfComputers = 0;

  final costOfMachineTimeHoursController = TextEditingController();
  final depreciationPerMonthController = TextEditingController();
  final electricityConsumedPerMonthController = TextEditingController();
  final maintenanceCostsPerMonthController = TextEditingController();
  final workingDayPerMonthController = TextEditingController();
  final hourlyWorkingDayRateController = TextEditingController();
  final initialPriceController = TextEditingController();
  final annualDepreciationPercentageController = TextEditingController();
  final requiredPowerController = TextEditingController();
  final operatingTimeController = TextEditingController();
  final electricityTariffController = TextEditingController();
  final programmerSalaryController = TextEditingController();
  final numberOfComputersController = TextEditingController();

  //final insuranceController = TextEditingController();

  String result = '';

  @override
  void initState() {
    super.initState();
  }

  void _getAnswer(d) {
    setState(() {
      result = d.toString();
    });
  }

  Future addNote(
      {required double programCreatingCost,
      required double costOfMachineTime,
      required int hour,
      required int day,
      required int costPerHour,
      required double costForWritingAndCorrecting,
      required double timeForFix,
      required int programmerSalary}) async {
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
          const Text('Машиналық уақыт сағатының құнын есептеу:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    children: [
                      getText(text: 'q'),
                      getText(text: ' = '),
                    ]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        children: [
                          getText(
                            text: 'A',
                          ),
                          getText(
                            text: ' + ',
                          ),
                          getText(
                            text: 'E',
                          ),
                          getText(text: ' + '),
                          getText(
                            text: 'Q',
                          ),
                        ]),
                  ),
                  SizedBox(
                    width: dividerWidth,
                    child: const Divider(
                      height: 5,
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        children: [
                          getText(
                            text: 'D',
                          ),
                          getTextIndex(text: 'p'),
                          getText(text: ' * '),
                          getText(
                            text: 'r',
                          ),
                        ]),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    children: [
                      getText(text: 'A'),
                      getText(text: ' = '),
                    ]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        children: [
                          getText(
                            text: 'S',
                          ),
                          getText(
                            text: ' * ',
                          ),
                          getText(
                            text: 'q',
                          ),
                          getTextIndex(text: 'аморт'),
                        ]),
                  ),
                  SizedBox(
                    width: dividerWidth,
                    child: const Divider(
                      height: 5,
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        children: [
                          getText(
                            text: '12',
                          ),
                        ]),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    children: [
                      getText(text: 'E'),
                      getText(text: ' = '),
                      getText(text: 'w'),
                      getText(text: ' * '),
                      getText(text: 't'),
                      getText(text: ' * '),
                      getText(text: 'T'),
                    ]),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    children: [
                      getText(text: 'Q'),
                      getTextIndex(text: 'p'),
                      getText(text: ' = '),
                    ]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        children: [
                          getText(
                            text: 'Q',
                          ),
                          getTextIndex(text: 'c'),
                        ]),
                  ),
                  const SizedBox(
                    width: 30,
                    child: Divider(
                      height: 5,
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        children: [
                          getText(
                            text: 'n',
                          ),
                        ]),
                  ),
                ],
              ),
            ],
          ),
          Form(
            child: Wrap(children: [
              getInputForms(name: 'S', type: 'теңге', controller: initialPriceController),
              getInputForms(
                  name: 'q',
                  index: 'аморт',
                  type: '%',
                  controller: annualDepreciationPercentageController),
              getInputForms(name: 'w', type: 'кВт/сағ', controller: requiredPowerController),
              getInputForms(name: 't', type: 'сағат', controller: operatingTimeController),
              getInputForms(name: 'T', type: 'теңге', controller: electricityTariffController),
              getInputForms(
                  name: 'Q',
                  index: 'c',
                  type: 'теңге',
                  controller: programmerSalaryController),
              getInputForms(name: 'n', type: 'дана', controller: numberOfComputersController),
              getInputForms(
                  name: 'D',
                  index: 'p',
                  type: 'күн',
                  controller: workingDayPerMonthController),
              getInputForms(
                  name: 'r', type: 'сағат', controller: hourlyWorkingDayRateController),
            ]),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () async {
                RegExp isDigit = RegExp(r'[0-9]\.?[0-9]?');
                if (initialPriceController.text.isNotEmpty &&
                    annualDepreciationPercentageController.text.isNotEmpty &&
                    requiredPowerController.text.isNotEmpty &&
                    operatingTimeController.text.isNotEmpty &&
                    electricityTariffController.text.isNotEmpty &&
                    programmerSalaryController.text.isNotEmpty &&
                    numberOfComputersController.text.isNotEmpty &&
                    workingDayPerMonthController.text.isNotEmpty &&
                    hourlyWorkingDayRateController.text.isNotEmpty &&
                    isDigit.hasMatch(initialPriceController.text) &&
                    isDigit.hasMatch(
                        annualDepreciationPercentageController.text) &&
                    isDigit.hasMatch(requiredPowerController.text) &&
                    isDigit.hasMatch(operatingTimeController.text) &&
                    isDigit.hasMatch(programmerSalaryController.text) &&
                    isDigit.hasMatch(numberOfComputersController.text) &&
                    isDigit.hasMatch(workingDayPerMonthController.text) &&
                    isDigit.hasMatch(hourlyWorkingDayRateController.text) &&
                    isDigit.hasMatch(electricityTariffController.text)) {
                  initialPrice = int.parse(initialPriceController.text).toInt();
                  annualDepreciationPercentage =
                      double.parse(annualDepreciationPercentageController.text)
                          .toDouble();
                  requiredPower =
                      double.parse(requiredPowerController.text).toDouble();
                  operatingTime =
                      double.parse(operatingTimeController.text).toDouble();
                  electricityTariff =
                      double.parse(electricityTariffController.text).toDouble();
                  programmerSalary =
                      int.parse(programmerSalaryController.text).toInt();
                  numberOfComputers =
                      int.parse(numberOfComputersController.text).toInt();
                  workingDayPerMonth = int.parse(workingDayPerMonthController.text).toInt();
                  hourlyWorkingDayRate =
                      int.parse(hourlyWorkingDayRateController.text).toInt();

                  print('initialPrice: $initialPrice '
                      'annualDepreciationPercentage: $annualDepreciationPercentage '
                      'requiredPower: $requiredPower '
                      'operatingTime: $operatingTime '
                      'electricityTariff: $electricityTariff '
                      'programmerSalary $programmerSalary '
                      'numberOfComputers: $numberOfComputers '
                      'workingDayPerMonth: $workingDayPerMonth '
                      'hourlyWorkingDayRate: $hourlyWorkingDayRate');

                  depreciationPerMonth =
                      (initialPrice * (annualDepreciationPercentage / 100)) / 12;
                  electricityConsumedPerMonth =
                      requiredPower * operatingTime * electricityTariff;
                  maintenanceCostsPerMonth =
                      programmerSalary / numberOfComputers;
                  costOfMachineTimeHours =
                      ((depreciationPerMonth +
                              electricityConsumedPerMonth +
                              maintenanceCostsPerMonth) /
                          (workingDayPerMonth * hourlyWorkingDayRate)).round();

                  _getAnswer(costOfMachineTimeHours);
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
              text: TextSpan(children: [
                getText(text: 'q'),
                getText(text: ' = '),
                getText(text: result),
                getTextIndex(text: ' тенге/сағ'),
              ]),
            ),
          ),
        ]));
  }

  void a({listOfControllers}) {}

  Widget getInputForms({required name, index = '', required controller, required type}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(const Size(400, 50)),
        child: ListTile(
          leading: RichText(
            text: TextSpan(children: [
              getText(text: name),
              getTextIndex(text: index),
            ]),
          ),
          title: getInputField(controller: controller),
          trailing: Text(type, style: const TextStyle(fontSize: 12)),

        ),
      ),
    );
  }

  // ! create text
  TextSpan getText({required text}) {
    return TextSpan(
        text: text, style: TextStyle(color: Colors.black, fontSize: textSize));
  }

  // ! create text index
  TextSpan getTextIndex({required text}) {
    return TextSpan(
        text: text,
        style: TextStyle(
            color: Colors.black,
            fontSize: indexSize,
            fontFeatures: const [FontFeature.subscripts()]));
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