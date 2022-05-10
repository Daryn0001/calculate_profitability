
import 'package:calculate_profitability/widgets/creating_algorithm.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../db/database_helper.dart';
import '../model/note.dart';
import '../widgets/implementing_program.dart';
import '../widgets/calculate_machine_time_hour.dart';
import '../widgets/creating_programm.dart';
import '../widgets/technical_equipment.dart';

class TaskPage extends StatefulWidget {
  static Note note = Note();
   dynamic noteForEdit;
  final bool isEdit;
   TaskPage({Key? key, this.noteForEdit, this.isEdit = false}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  final controller = TextEditingController();



  String text = 'Кешенді құруға және өндіруге кеткен шығындар, '
      'техникалық құралдар кешеніне кеткен шығындар, программа жасауға және түзетуге кеткен шығындар, '
      'ақпарат өнімділігі есептеу';


  @override
  dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  initState() {
    super.initState();
    if(widget.noteForEdit != null && widget.noteForEdit.projectName.isNotEmpty){
      TaskPage.note = widget.noteForEdit;
        controller.text = widget.noteForEdit.projectName;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: KeyboardDismisser(
          gestures: const [GestureType.onTap, GestureType.onVerticalDragDown],
          child: SingleChildScrollView(
            child: Container(
                //color: Colors.white70,
                child: Column(

                  children: [
                    getDescription(),
                    getInputField(controller: controller),
                    getAlgorithmCost(note: widget.noteForEdit),
                    getTechnicalEquipmentCost(note: widget.noteForEdit),
                    getCostOfMachineTimeHour(note: widget.noteForEdit),
                    getProgramCost(note: widget.noteForEdit),
                    getImplementingProgramCost(note: widget.noteForEdit),

                    submitBtn(),
                  ],
                )),
          ),
        ));
  }


  Widget submitBtn(){
    return ElevatedButton(
      onPressed: () {
        addProjectName(name: controller.text);

      },
      child: Text('растау'),
    );
  }

  Future addProjectName({name}) async{
    setState(() {
      if(name != '' && name.isNotEmpty){
      TaskPage.note.projectName = name;
      }
    });
    if(widget.noteForEdit != null) {
      TaskPage.note.id = widget.noteForEdit.id;
    }
    if(widget.isEdit){
      setState(() {
        widget.noteForEdit.projectName = TaskPage.note.projectName;
        widget.noteForEdit.algorithmCreatingCost = TaskPage.note.algorithmCreatingCost != 0 ?  TaskPage.note.algorithmCreatingCost : widget.noteForEdit.algorithmCreatingCost;
        widget.noteForEdit.totalCostForCreationAndImplementing = TaskPage.note.totalCostForCreationAndImplementing != 0 ?  TaskPage.note.totalCostForCreationAndImplementing : widget.noteForEdit.totalCostForCreationAndImplementing;
        widget.noteForEdit.salary = TaskPage.note.salary != 0 ?  TaskPage.note.salary : widget.noteForEdit.salary;
        widget.noteForEdit.timeToCreateAlgorithm = TaskPage.note.timeToCreateAlgorithm != 0 ?  TaskPage.note.timeToCreateAlgorithm : widget.noteForEdit.timeToCreateAlgorithm;
        widget.noteForEdit.insuranceInPercents = TaskPage.note.insuranceInPercents != 0 ?  TaskPage.note.insuranceInPercents : widget.noteForEdit.insuranceInPercents;
        widget.noteForEdit.insuranceCost = TaskPage.note.insuranceCost != 0 ?  TaskPage.note.insuranceCost : widget.noteForEdit.insuranceCost;
        widget.noteForEdit.programCreatingCost = TaskPage.note.programCreatingCost != 0 ?  TaskPage.note.programCreatingCost : widget.noteForEdit.programCreatingCost;
        widget.noteForEdit.costOfMachineTime = TaskPage.note.costOfMachineTime != 0 ?  TaskPage.note.costOfMachineTime : widget.noteForEdit.costOfMachineTime;
        widget.noteForEdit.hour = TaskPage.note.hour != 0 ?  TaskPage.note.hour : widget.noteForEdit.hour;
        widget.noteForEdit.day = TaskPage.note.day != 0 ?  TaskPage.note.day : widget.noteForEdit.day;
        widget.noteForEdit.costPerHour = TaskPage.note.costPerHour != 0 ?  TaskPage.note.costPerHour : widget.noteForEdit.costPerHour;
        widget.noteForEdit.costForWritingAndCorrecting = TaskPage.note.costForWritingAndCorrecting != 0 ?  TaskPage.note.costForWritingAndCorrecting : widget.noteForEdit.costForWritingAndCorrecting;
        widget.noteForEdit.timeForFix = TaskPage.note.timeForFix != 0 ?  TaskPage.note.timeForFix : widget.noteForEdit.timeForFix;
        widget.noteForEdit.numberOfComputers = TaskPage.note.numberOfComputers != 0 ?  TaskPage.note.numberOfComputers : widget.noteForEdit.numberOfComputers;
        widget.noteForEdit.programmerSalary =  TaskPage.note.programmerSalary != 0 ? TaskPage.note.programmerSalary : widget.noteForEdit.programmerSalary;
        widget.noteForEdit.technicalEquipmentCosts = TaskPage.note.technicalEquipmentCosts != 0 ?  TaskPage.note.technicalEquipmentCosts : widget.noteForEdit.technicalEquipmentCosts;
        widget.noteForEdit.quantityOfComputers = TaskPage.note.quantityOfComputers != 0 ?  TaskPage.note.quantityOfComputers : widget.noteForEdit.quantityOfComputers;
        widget.noteForEdit.costOfOneComputer = TaskPage.note.costOfOneComputer != 0 ?  TaskPage.note.costOfOneComputer : widget.noteForEdit.costOfOneComputer;
        widget.noteForEdit.quantityOfPrinters = TaskPage.note.quantityOfPrinters != 0 ?  TaskPage.note.quantityOfPrinters : widget.noteForEdit.quantityOfPrinters;
        widget.noteForEdit.costOfOnePrinter = TaskPage.note.costOfOnePrinter != 0 ?  TaskPage.note.costOfOnePrinter : widget.noteForEdit.costOfOnePrinter;
        widget.noteForEdit.costOfMachineTimeHours = TaskPage.note.costOfMachineTimeHours != 0 ?  TaskPage.note.costOfMachineTimeHours : widget.noteForEdit.costOfMachineTimeHours;
        widget.noteForEdit.depreciationPerMonth = TaskPage.note.depreciationPerMonth != 0 ?  TaskPage.note.depreciationPerMonth : widget.noteForEdit.depreciationPerMonth;
        widget.noteForEdit.electricityConsumedPerMonth = TaskPage.note.electricityConsumedPerMonth != 0 ?  TaskPage.note.electricityConsumedPerMonth : widget.noteForEdit.electricityConsumedPerMonth;
        widget.noteForEdit.maintenanceCostsPerMonth = TaskPage.note.maintenanceCostsPerMonth != 0 ?  TaskPage.note.maintenanceCostsPerMonth : widget.noteForEdit.maintenanceCostsPerMonth;
        widget.noteForEdit.workingDayPerMonth = TaskPage.note.workingDayPerMonth != 0 ?  TaskPage.note.workingDayPerMonth : widget.noteForEdit.workingDayPerMonth;
        widget.noteForEdit.hourlyWorkingDayRate = TaskPage.note.hourlyWorkingDayRate != 0 ?  TaskPage.note.hourlyWorkingDayRate : widget.noteForEdit.hourlyWorkingDayRate;
        widget.noteForEdit.initialPrice = TaskPage.note.initialPrice != 0 ?  TaskPage.note.initialPrice : widget.noteForEdit.initialPrice;
        widget.noteForEdit.annualDepreciationPercentage = TaskPage.note.annualDepreciationPercentage != 0 ?  TaskPage.note.annualDepreciationPercentage : widget.noteForEdit.annualDepreciationPercentage;
        widget.noteForEdit.requiredPower = TaskPage.note.requiredPower != 0 ?  TaskPage.note.requiredPower : widget.noteForEdit.requiredPower;
        widget.noteForEdit.operatingTime = TaskPage.note.operatingTime != 0 ?  TaskPage.note.operatingTime : widget.noteForEdit.operatingTime;
        widget.noteForEdit.electricityTariff = TaskPage.note.electricityTariff != 0 ?  TaskPage.note.electricityTariff : widget.noteForEdit.electricityTariff;
        widget.noteForEdit.programmerSalary2 = TaskPage.note.programmerSalary2 != 0 ?  TaskPage.note.programmerSalary2 : widget.noteForEdit.programmerSalary2;
        widget.noteForEdit.costOfImplementingProgram = TaskPage.note.costOfImplementingProgram != 0 ?  TaskPage.note.costOfImplementingProgram : widget.noteForEdit.costOfImplementingProgram;
        widget.noteForEdit.workingDayPerMonth2 = TaskPage.note.workingDayPerMonth2 != 0 ?  TaskPage.note.workingDayPerMonth2 : widget.noteForEdit.workingDayPerMonth2;
        widget.noteForEdit.profitabilityStandard = TaskPage.note.profitabilityStandard != 0 ?  TaskPage.note.profitabilityStandard : widget.noteForEdit.profitabilityStandard;
        widget.noteForEdit.profit =  TaskPage.note.profit != 0 ? TaskPage.note.profit : widget.noteForEdit.profit;
        widget.noteForEdit.projectPrice = TaskPage.note.projectPrice != 0 ?  TaskPage.note.projectPrice : widget.noteForEdit.projectPrice;
        widget.noteForEdit.programPrice = TaskPage.note.programPrice != 0 ?  TaskPage.note.programPrice : widget.noteForEdit.programPrice;

        //widget.noteForEdit.projectName = name;
      });
      await NotesDatabase.instance.update(widget.noteForEdit);
      //print('noteForEdit:  ${widget.noteForEdit}');
      //print('static note ${TaskPage.note}');
    }
    else {

      Note n = await NotesDatabase.instance.create(TaskPage.note);
      //print('created: $n');
    }

    Navigator.of(context).pop();
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

        //keyboardType: const TextInputType.numberWithOptions(decimal: true),
        controller: controller,
        minLines: 1,
        maxLines: 1,
        decoration: InputDecoration(
          labelText: 'Проект тақырыбын енгізіңіз',
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

  Widget getDescription() {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF04123F),
          border: Border.all(
            color: Colors.black38,
          )),
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 13,
            letterSpacing: 2,
            color: Colors.white,
            fontWeight: FontWeight.w500),
      ),
    );
  }
// !
/// ! 4.1 point: cost of creating an algorithm
  Widget getAlgorithmCost({note}) {
    Note n = Note();
    if(note != null) n = note;
    return CostOfCreatingAnAlgorithm(note: n);
  }

  /// ! 4.1.2 point: cost of Technical Equipment
  Widget getTechnicalEquipmentCost({note}) {
    Note n = Note();
    if(note != null) n = note;
    return TechnicalEquipmentCost(
        note: n
    );
  }


  /// ! 4.2 point: cost of creating an program
  Widget getProgramCost({note}){
    Note n = Note();
    if(note != null) n = note;
    return CostOfCreatingProgram(
        note: n
    );
  }

  //! 4.2.1
Widget getCostOfMachineTimeHour({note}){
  Note n = Note();
  if(note != null) n = note;
    return CostOfMachineTimeHour(
        note: n
    );
}

  Widget getImplementingProgramCost({note}) {
    Note n = Note();
    if(note != null) n = note;
    return ImplementingProgramCost(note: n);
  }

}

