
import 'package:flutter/material.dart';

import '../core/res/color.dart';

class ListItem extends StatelessWidget {
  final dynamic projectName;
  const ListItem({Key? key, this.projectName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppBarTheme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow:  [
          BoxShadow(
            color: AppColors.listBoxShadowColor,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(projectName,
                  style: TextStyle(
                    color: AppColors.listTitleColor,
                  fontSize: 15, fontWeight: FontWeight.w600)),
                ]
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(Icons.edit_outlined, size: 22),
            ),
            const SizedBox(width: 25),
            const Icon(
              Icons.delete_outline,
              size: 24,
              color: Color(0xFFFF5959),
            ),
          ]
        ),
      ),

    );
  }
}
