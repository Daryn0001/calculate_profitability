import 'dart:ui';

import 'package:calculate_profitability/widgets/creating_algorithm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/creating_programm.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
   var algosCost;
   var programCost;

  String text = 'Кешенді құруға және өндіруге кеткен шығындар, '
      'техникалық құралдар кешеніне кеткен шығындар, программа жасауға және түзетуге кеткен шығындар, '
      'ақпарат өнімділігі есептеу';

  String answer = '0', v1 = '0', v2 = '', v3 = '';

  String initValue(String s) {
    setState(() {
      v1 = s;
      print('v1: $v1');
    });
    return v1;
  }


  Widget getAlgorithmCost() {
     algosCost  = const CostOfCreatingAnAlgorithm();
    String result = CostOfCreatingAnAlgorithm.result;
    print('result: $result');
    return Container(child: algosCost);
  }

  Widget getProgramCost(){
    programCost = const CostOfCreatingProgram();
    return Container(child: programCost );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
              color: Colors.white70,
              child: Column(
                children: [
                  getDescription(),
                  getAlgorithmCost(),
                  getProgramCost(),

                ],
              )),
        ));
  }

// ! cost of creating an algorithm

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
}

/*Container(
            child: ListTile(
              leading: RichText(
                text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(text: 'Ж', style: TextStyle(fontSize: 18)),
                      TextSpan(
                          text: 'қ',
                          style: TextStyle(
                              fontSize: 12,
                              fontFeatures: [FontFeature.subscripts()])),
                    ]),
              ),
              title: getInputField(hintText: 'first', controller: first),
            ),
          ),
          Container(
            child: ListTile(

              leading: RichText(
                text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(text: 'T', style: TextStyle(fontSize: 18)),

                    ]),
              ),
              title: getInputField(hintText: 'second', controller: second),
            ),
          ),
          Container(
            child: ListTile(
              leading: RichText(
                text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(text: 'А', style: TextStyle(fontSize: 18)),
                      TextSpan(
                          text: 'әс',
                          style: TextStyle(
                              fontSize: 12,
                              fontFeatures: [FontFeature.subscripts()])),
                    ]),
              ),
              title: getInputField(hintText: 'third', controller: third),
            ),
          ),*/
