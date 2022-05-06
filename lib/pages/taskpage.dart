import 'dart:ui';

import 'package:flutter/material.dart';


class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  String text = 'Кешенді құруға және өндіруге кеткен шығындар, '
      'техникалық құралдар кешеніне кеткен шығындар, программа жасауға және түзетуге кеткен шығындар, '
      'ақпарат өнімділігі есептелінген';
  final first = TextEditingController();
  final second = TextEditingController();
  final third = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  SingleChildScrollView(
        child: Container(
          color: Colors.white70,
          child: Column(
            children:    [
              getDescription(),
              box()

            ],
          )
        ),
      )
    );
  }
// ! cost of creating an algorithm
  Widget box(){
    return Container(
      decoration:  BoxDecoration(
          border: Border.all(
              color: Colors.grey
          )
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                    text: 'C',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14
                )),
                TextSpan(
                  text: 'ақкш',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFeatures: [FontFeature.subscripts()])
                ),
                TextSpan(
                    text: ' = ',
                    style: TextStyle(
                        fontSize: 14
                    )),
                TextSpan(
                    text: 'Ж',
                    style: TextStyle(
                        fontSize: 14
                    )),
                TextSpan(
                    text: 'қ',
                    style: TextStyle(
                        fontSize: 10,
                        fontFeatures: [FontFeature.subscripts()])
                ),
                TextSpan(
                    text: ' * ',
                    style: TextStyle(
                        fontSize: 14
                    )),
                TextSpan(
                    text: 't',
                    style: TextStyle(
                        fontSize: 14
                    )),
                TextSpan(
                    text: ' + ',
                    style: TextStyle(
                        fontSize: 14
                    )),
                TextSpan(
                    text: 'A',
                    style: TextStyle(
                        fontSize: 14
                    )),
                TextSpan(
                    text: 'әс',
                    style: TextStyle(
                        fontSize: 10,
                        fontFeatures: [FontFeature.subscripts()])
                ),
              ]
            ),
          ),

          Container(
            child: ListTile(
              leading: RichText(
                text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                          text: 'Ж',
                          style: TextStyle(
                              fontSize: 18
                          )),
                      TextSpan(
                          text: 'қ',
                          style: TextStyle(
                              fontSize: 12,
                              fontFeatures: [FontFeature.subscripts()])
                      ),
                    ]
                ),
              ),
              title: getInputField(hintText: 'first', controller: first),
            ),
          ),
          Container(
            child: ListTile(
              leading: Wrap(
                  direction: Axis.horizontal,
                  children: const[
                    Text('T'),
                  ]
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
                      TextSpan(
                          text: 'А',
                          style: TextStyle(
                              fontSize: 18
                          )),
                      TextSpan(
                          text: 'әс',
                          style: TextStyle(
                              fontSize: 12,
                              fontFeatures: [FontFeature.subscripts()])
                      ),
                    ]
                ),
              ),
              title: getInputField(hintText: 'third', controller: third),
            ),
          ),
        ]
      )
    );
  }

  Widget getDescription(){
    return Container(
      decoration:  BoxDecoration(
        color: Color(0xFF04123F),
        border: Border.all(
          color: Colors.black38,
        )
      ),
      padding: const EdgeInsets.all(8),
      child: Text(text,
        style: const TextStyle(
            fontSize: 13,
            letterSpacing: 2,
            color: Colors.white,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget getInputField({hintText, controller}){
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      decoration: BoxDecoration(
          color: const Color(0xFFeeeeee),
          border: Border.all(color: Colors.white70, width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        minLines: 1,
        maxLines: 2,
        decoration: InputDecoration(
            hoverColor: Colors.white,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF8F8F9E))),
      ),

    );
  }

}
