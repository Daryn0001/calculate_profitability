import 'dart:ui';

import 'package:calculate_profitability/widgets/creating_algorithm.dart';
import 'package:flutter/material.dart';

import '../model/note.dart';
import '../widgets/implementing_program.dart';
import '../widgets/calculate_machine_time_hour.dart';
import '../widgets/creating_programm.dart';
import '../widgets/technical_equipment.dart';

class TaskPage extends StatefulWidget {
  static Note note = Note();
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  double algorithmCreatingCost = 0;
  double insuranceCost = 0;
  var algosCost;
   var programCost;

  String text = 'Кешенді құруға және өндіруге кеткен шығындар, '
      'техникалық құралдар кешеніне кеткен шығындар, программа жасауға және түзетуге кеткен шығындар, '
      'ақпарат өнімділігі есептеу';



   initValue(String s) {
    setState(() {

    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
              //color: Colors.white70,
              child: Column(

                children: [
                  getDescription(),

                  getAlgorithmCost(),
                  getTechnicalEquipmentCost(),
                  getCostOfMachineTimeHour(),
                  getProgramCost(),

                  const ImplementingProgramCost(),

                ],
              )),
        ));
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
  Widget getAlgorithmCost() {
    algosCost  = const CostOfCreatingAnAlgorithm();
    String result = CostOfCreatingAnAlgorithm.result;
    print('result: $result');
    return Container(child: algosCost);
  }

  /// ! 4.1.2 point: cost of Technical Equipment
  Widget getTechnicalEquipmentCost() {
    return const TechnicalEquipmentCost();
  }


  /// ! 4.2 point: cost of creating an program
  Widget getProgramCost(){
    programCost = const CostOfCreatingProgram();
    return Container(child: programCost );
  }

  //! 4.2.1
Widget getCostOfMachineTimeHour(){

    return const CostOfMachineTimeHour();
}

}

