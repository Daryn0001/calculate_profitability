
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../core/res/style.dart';
import '../db/database_helper.dart';
import '../pages/taskpage.dart';

class ListItem extends StatefulWidget {
  final dynamic projectName;
  final dynamic id;
  const ListItem({Key? key, this.projectName, this.id}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isDeleted = false;
  late Color titleColor;
  late TextDecoration titleStyle;

  @override
  initState(){
    super.initState();

      if(isDeleted) {
        titleStyle = TextDecoration.lineThrough;
        titleColor = AppStyle.listTitleDisabledColor;
      } else {
        titleStyle = TextDecoration.none;
        titleColor = AppStyle.listTitleActiveColor;
      }

  }


  setBool () {
    setState(() {
      if(isDeleted) {
        isDeleted = false;
        titleStyle = TextDecoration.lineThrough;
        titleColor = AppStyle.listTitleDisabledColor;
      } else {
        isDeleted = true;
        titleStyle = TextDecoration.none;
        titleColor = AppStyle.listTitleActiveColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppBarTheme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow:  [
          BoxShadow(
            color: AppStyle.listBoxShadowColor,
            spreadRadius: -4,
            blurRadius: 25,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.only(
        top: 11,
        bottom: 11,
        right: 27,
        left: 27,
      ),

      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(widget.projectName,
                  style: TextStyle(
                    decoration: titleStyle,
                      decorationThickness: 3.0,
                      decorationColor: Colors.black87,
                      color: titleColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  )),
            ),

           Row(
             children: [
               // * Edit the feed
               GestureDetector(
                 onTap: () async {
                   var n =  await NotesDatabase.instance.readNote(widget.id);
                   await Navigator.of(context)
                       .push(PageTransition(
                       type: PageTransitionType.fade,
                       child: TaskPage(
                         noteForEdit: n,
                         isEdit: true,
                       )))
                       .then((value) {

                   });
                   //refreshNote();
                 },
                 child: const Icon(Icons.edit_outlined, size: 22),
               ),
               const SizedBox(width: 25),
               GestureDetector(
                 onTap: () {
                   setBool();
                   print('deleted by id: ${widget.id}');
                   NotesDatabase.instance.delete(widget.id).then((value) =>
                   {
                     setState(() {})
                   });
                 },
                 child: const Icon(
                   Icons.delete_outline,
                   size: 24,
                   color: Color(0xFFFF5959),
                 ),
               ),
             ]
           ),

          ]
        ),
      ),

    );
  }
}
