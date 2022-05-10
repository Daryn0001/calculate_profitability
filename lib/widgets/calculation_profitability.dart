import 'package:calculate_profitability/widgets/text_span.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pages/taskpage.dart';

class ProfitabilityCalculation extends StatefulWidget {

  const ProfitabilityCalculation({Key? key}) : super(key: key);

  @override
  _ProfitabilityCalculationState createState() => _ProfitabilityCalculationState();
}

class _ProfitabilityCalculationState extends State<ProfitabilityCalculation> {
  final isDigit = RegExp(r'[0-9]\.?[0-9]?');
  final title = "Рентабельдікті есептеу: ";

  double profitabilityStandard = 0;
  double profit = 0;
  double projectPrice = 0;
  int programPrice = 0;

  final profitabilityStandardController = TextEditingController();
  final profitController = TextEditingController();
  final projectPriceController = TextEditingController();
  final programPriceController = TextEditingController();
  String result = '';


  void _getAnswer(d) {
    setState(() {
      result = d.toString();
    });
  }

  @override
  dispose()  {
    super.dispose();
    profitabilityStandardController.dispose();
    profitController.dispose();
    projectPriceController.dispose();
    programPriceController.dispose();
  }

  @override
  initState(){
    super.initState();

  }


  Future addNote ({required double profitabilityStandard}) async {
    profit = (profitabilityStandard / 100) * TaskPage.note.totalCostForCreationAndImplementing;

    projectPrice = TaskPage.note.totalCostForCreationAndImplementing + profit;




  }

  @override
  Widget build(BuildContext context) {
    return Container();
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
                  name: 'У',
                  type: '%',
                  index: 'p',
                  controller: profitabilityStandardController),
            ]),
          ),
          ElevatedButton(
            onPressed: () async {
              if (profitabilityStandardController.text.isNotEmpty &&
                  isDigit.hasMatch(profitabilityStandardController.text)) {
                profitabilityStandard =
                    double.parse(profitabilityStandardController.text).toDouble();

               addNote(profitabilityStandard: profitabilityStandard);



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

        ]));
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
