import 'dart:ui';

import 'package:calculate_profitability/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/note.dart';
import '../pages/taskpage.dart';

class TextFields {
  static const title = 'Машиналық уақыт сағатының құнын есептеу:';
  static const descriptionForS = 'Мұндағы S: ДЭЕМ-нің алғашқы бағасы.';
  static const descriptionForQ = 'Мұндағы Qc: Программист жалақысы.';
}


class CostOfMachineTimeHour extends StatefulWidget {
  const CostOfMachineTimeHour({Key? key, required this.note}) : super(key: key);

  final Note note;

  @override
  _CostOfMachineTimeHourState createState() => _CostOfMachineTimeHourState();
}

class _CostOfMachineTimeHourState extends State<CostOfMachineTimeHour> {
  final double dividerWidth = 70;
  final double textSize = 18;
  final double indexSize = 11;


  final isDigit = RegExp(r'[0-9]\.?[0-9]?');

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

  _changeText(){
    setState(() {
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
        workingDayPerMonth =
            int.parse(workingDayPerMonthController.text).toInt();
        hourlyWorkingDayRate =
            int.parse(hourlyWorkingDayRateController.text).toInt();

        depreciationPerMonth =
            (initialPrice * (annualDepreciationPercentage / 100)) /
                12;
        electricityConsumedPerMonth =
            requiredPower * operatingTime * electricityTariff;
        maintenanceCostsPerMonth =
            programmerSalary / numberOfComputers;
        costOfMachineTimeHours = ((depreciationPerMonth +
            electricityConsumedPerMonth +
            maintenanceCostsPerMonth) /
            (workingDayPerMonth * hourlyWorkingDayRate))
            .round();

        addNote(
          initialPrice: initialPrice,
          annualDepreciationPercentage: annualDepreciationPercentage,
          requiredPower: requiredPower,
          operatingTime: operatingTime,
          electricityTariff: electricityTariff,
          programmerSalary: programmerSalary,
          numberOfComputers: numberOfComputers,
          workingDayPerMonth: workingDayPerMonth,
          hourlyWorkingDayRate: hourlyWorkingDayRate,
          depreciationPerMonth: depreciationPerMonth,
          electricityConsumedPerMonth: electricityConsumedPerMonth,
          maintenanceCostsPerMonth: maintenanceCostsPerMonth,
          costOfMachineTimeHours: costOfMachineTimeHours,
        );


      }
    });
  }


  @override
  void initState() {
    super.initState();

    if (widget.note.id != null) {
      costOfMachineTimeHoursController.text =
          widget.note.costOfMachineTimeHours  != 0 ? widget.note.costOfMachineTimeHours.toString()  : '';
      depreciationPerMonthController.text =
          widget.note.depreciationPerMonth != 0 ? widget.note.depreciationPerMonth.toString() : '';
      electricityConsumedPerMonthController.text =
          widget.note.electricityConsumedPerMonth != 0 ? widget.note.electricityConsumedPerMonth.toString() : '';
      maintenanceCostsPerMonthController.text =
          widget.note.maintenanceCostsPerMonth != 0 ? widget.note.maintenanceCostsPerMonth.toString() : '';
      workingDayPerMonthController.text =
          widget.note.workingDayPerMonth != 0 ? widget.note.workingDayPerMonth.toString() : '';
      hourlyWorkingDayRateController.text =
          widget.note.hourlyWorkingDayRate != 0 ? widget.note.hourlyWorkingDayRate.toString() : '';
      initialPriceController.text = widget.note.initialPrice != 0 ? widget.note.initialPrice.toString() : '';
      annualDepreciationPercentageController.text =
          widget.note.annualDepreciationPercentage != 0 ? widget.note.annualDepreciationPercentage.toString() : '';
      requiredPowerController.text = widget.note.requiredPower != 0 ? widget.note.requiredPower.toString() : '';
      operatingTimeController.text = widget.note.operatingTime != 0 ? widget.note.operatingTime.toString() : '';
      electricityTariffController.text =
          widget.note.electricityTariff != 0 ? widget.note.electricityTariff.toString() : '';
      programmerSalaryController.text = widget.note.programmerSalary != 0 ? widget.note.programmerSalary.toString() : '';
      numberOfComputersController.text =
          widget.note.numberOfComputers != 0 ? widget.note.numberOfComputers.toString() : '';
    }


    costOfMachineTimeHoursController.addListener(() => { _changeText()});
    depreciationPerMonthController.addListener(() => { _changeText()});
    electricityConsumedPerMonthController.addListener(() => { _changeText()});
    maintenanceCostsPerMonthController.addListener(() => { _changeText()});
    workingDayPerMonthController.addListener(() => { _changeText()});
    hourlyWorkingDayRateController.addListener(() => { _changeText()});
    initialPriceController.addListener(() => { _changeText()});
    annualDepreciationPercentageController.addListener(() => { _changeText()});
    requiredPowerController.addListener(() => { _changeText()});
    operatingTimeController.addListener(() => { _changeText()});
    electricityTariffController.addListener(() => { _changeText()});
    programmerSalaryController.addListener(() => { _changeText()});
    numberOfComputersController.addListener(() => { _changeText()});

  }

  void _getAnswer(d) {
    setState(() {
      result = d.toString();
    });
  }

  Future addNote({
    required initialPrice,
    required annualDepreciationPercentage,
    required requiredPower,
    required operatingTime,
    required electricityTariff,
    required programmerSalary,
    required numberOfComputers,
    required workingDayPerMonth,
    required hourlyWorkingDayRate,
    required depreciationPerMonth,
    required electricityConsumedPerMonth,
    required maintenanceCostsPerMonth,
    required costOfMachineTimeHours,
  }) async {
    TaskPage.note.initialPrice = initialPrice;
    TaskPage.note.annualDepreciationPercentage = annualDepreciationPercentage;
    TaskPage.note.requiredPower = requiredPower;
    TaskPage.note.operatingTime = operatingTime;
    TaskPage.note.electricityTariff = electricityTariff;
    TaskPage.note.programmerSalary2 = programmerSalary;
    TaskPage.note.numberOfComputers = numberOfComputers;
    TaskPage.note.workingDayPerMonth = workingDayPerMonth;
    TaskPage.note.hourlyWorkingDayRate = hourlyWorkingDayRate;
    TaskPage.note.depreciationPerMonth = depreciationPerMonth;
    TaskPage.note.electricityConsumedPerMonth = electricityConsumedPerMonth;
    TaskPage.note.maintenanceCostsPerMonth = maintenanceCostsPerMonth;
    TaskPage.note.costOfMachineTimeHours = costOfMachineTimeHours;


    //print('$runtimeType note updated: ${TaskPage.note}\n');
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
        child: Column(
          children: [
          TextBuilder.getTitle(text: TextFields.title),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    children: [
                      TextBuilder.getText(text: 'q'),
                      TextBuilder.getText(text: ' = '),
                    ]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        children: [
                          TextBuilder.getText(
                            text: 'A',
                          ),
                          TextBuilder.getText(
                            text: ' + ',
                          ),
                          TextBuilder.getText(
                            text: 'E',
                          ),
                          TextBuilder.getText(text: ' + '),
                          TextBuilder.getText(
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
                    children: [
                      TextBuilder.getText(text: 'A'),
                      TextBuilder.getText(text: ' = '),
                    ]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        children: [
                          TextBuilder.getText(
                            text: 'S',
                          ),
                          TextBuilder.getText(
                            text: ' * ',
                          ),
                          TextBuilder.getText(
                            text: 'q',
                          ),
                          TextBuilder.getTextIndex(text: 'аморт'),
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

                        children: [
                          TextBuilder.getText(
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
                    children: [
                      TextBuilder.getText(text: 'E'),
                      TextBuilder.getText(text: ' = '),
                      TextBuilder.getText(text: 'w'),
                      TextBuilder.getText(text: ' * '),
                      TextBuilder.getText(text: 't'),
                      TextBuilder.getText(text: ' * '),
                      TextBuilder.getText(text: 'T'),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    children: [
                      TextBuilder.getText(text: TextFields.descriptionForS,
                          size: 16,
                          color: Colors.black54),
                    ]),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    children: [
                      TextBuilder.getText(text: TextFields.descriptionForQ,
                          size: 16,
                          color: Colors.black54),
                    ]),
              ),
            ],
          ),
          Wrap(children: [
            TextBuilder.getInputForms(
            title: 'Амортизацияның жылдық пайызы:',
                name: 'q',
                index: 'аморт',
                type: '%',
                controller: annualDepreciationPercentageController),
            TextBuilder.getInputForms(
              title: 'ДЭЕМ қажетті қуат:',
                name: 'w',
                type: 'кВт/сағ',
                controller: requiredPowerController),
            TextBuilder.getInputForms(
              title: 'ДЭЕМ-нің жұмыс уақыты:',
                name: 't',
                type: 'сағат',
                controller: operatingTimeController),
            TextBuilder.getInputForms(
              title: 'Электроэнергия тарифі: ',
                name: 'T',
                type: 'теңге',
                controller: electricityTariffController),
            TextBuilder.getInputForms(
              title: 'ДЭЕМ-нің саны: ',
                name: 'n',
                type: 'дана',
                controller: numberOfComputersController),
            TextBuilder.getInputForms(
              title: '1 айдағы жұмыс күні: ',
                name: 'D',
                index: 'p',
                type: 'күн',
                controller: workingDayPerMonthController),
            TextBuilder.getInputForms(
              title: '1 күндегі жүмыс уақыты:',
                name: 'r',
                type: 'сағат',
                controller: hourlyWorkingDayRateController),
          ]),
          ElevatedButton(
            onPressed: () async {

              if (annualDepreciationPercentageController.text.isNotEmpty &&
                  requiredPowerController.text.isNotEmpty &&
                  operatingTimeController.text.isNotEmpty &&
                  electricityTariffController.text.isNotEmpty &&
                  numberOfComputersController.text.isNotEmpty &&
                  workingDayPerMonthController.text.isNotEmpty &&
                  hourlyWorkingDayRateController.text.isNotEmpty &&
                  isDigit.hasMatch(
                      annualDepreciationPercentageController.text) &&
                  isDigit.hasMatch(requiredPowerController.text) &&
                  isDigit.hasMatch(operatingTimeController.text) &&
                  isDigit.hasMatch(numberOfComputersController.text) &&
                  isDigit.hasMatch(workingDayPerMonthController.text) &&
                  isDigit.hasMatch(hourlyWorkingDayRateController.text) &&
                  isDigit.hasMatch(electricityTariffController.text)) {

                annualDepreciationPercentage =
                    double.parse(annualDepreciationPercentageController.text)
                        .toDouble();
                requiredPower =
                    double.parse(requiredPowerController.text).toDouble();
                operatingTime =
                    double.parse(operatingTimeController.text).toDouble();
                electricityTariff =
                    double.parse(electricityTariffController.text).toDouble();
                numberOfComputers =
                    int.parse(numberOfComputersController.text).toInt();
                workingDayPerMonth =
                    int.parse(workingDayPerMonthController.text).toInt();
                hourlyWorkingDayRate =
                    int.parse(hourlyWorkingDayRateController.text).toInt();

                depreciationPerMonth =
                    (TaskPage.note.technicalEquipmentCosts * (annualDepreciationPercentage / 100)) /
                        12;
                electricityConsumedPerMonth =
                    requiredPower * operatingTime * electricityTariff;
                maintenanceCostsPerMonth =
                    TaskPage.note.salary / numberOfComputers;
                costOfMachineTimeHours = ((depreciationPerMonth +
                            electricityConsumedPerMonth +
                            maintenanceCostsPerMonth) /
                        (workingDayPerMonth * hourlyWorkingDayRate))
                    .round();

                addNote(
                  initialPrice: TaskPage.note.technicalEquipmentCosts,
                  annualDepreciationPercentage: annualDepreciationPercentage,
                  requiredPower: requiredPower,
                  operatingTime: operatingTime,
                  electricityTariff: electricityTariff,
                  programmerSalary: TaskPage.note.salary,
                  numberOfComputers: numberOfComputers,
                  workingDayPerMonth: workingDayPerMonth,
                  hourlyWorkingDayRate: hourlyWorkingDayRate,
                  depreciationPerMonth: depreciationPerMonth,
                  electricityConsumedPerMonth: electricityConsumedPerMonth,
                  maintenanceCostsPerMonth: maintenanceCostsPerMonth,
                  costOfMachineTimeHours: costOfMachineTimeHours,
                );

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
