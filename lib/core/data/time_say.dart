import 'package:flutter/material.dart';

class Timecall extends StatelessWidget {
  String text = "";

  int nowtime = DateTime.now().hour;
  String timeCall() {
    print(nowtime);
    if (nowtime <= 4) {
      text = "Қайырлы түн  🌙";
    }
    else if (nowtime <= 11) {
      text = "Қайырлы таң  ☀️";
    }
    else if (nowtime > 11 && nowtime < 16) {
      text = "Қайырлы күн  🌞";
    } else if (nowtime >= 16 && nowtime < 18){
      text = "Қайырлы кеш  🌆";
    }else if (nowtime >= 18) {
      text = "Қайырлы түн  🌙";
    }

    return text;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      timeCall(),
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 27,
      ),
    ));
  }
}
