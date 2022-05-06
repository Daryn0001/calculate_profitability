import 'package:calculate_profitability/pages/taskpage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../Animation/fadeAnimation.dart';
import '../core/data/time_say.dart';
import 'button_change_them.dart';

class HomePage extends StatefulWidget {
  VoidCallback opendrawer;
   HomePage({Key? key, required this.opendrawer}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List todo = [];
  @override
   void initState(){
    super.initState();

    todo.addAll(['project1', 'project2', 'project3' ]);
  }


  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppBarTheme.of(context).backgroundColor,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: widget.opendrawer,
                  icon: const Icon(
                    Icons.drag_handle_outlined,
                    color: Colors.grey,
                    size: 30,
                  )),
              SizedBox(
                width: we * 0.77,
              ),
              /*SizedBox(
                width: we * 0.04,
              ),*/
              ChangeThembutton()
            ],
          )
        ],
      ),
      body: SizedBox(
        width: we,
        height: he,
        child: Column(
          children: [
            FadeAnimation(
              delay: 0.8,
              child: Container(
                margin: EdgeInsets.only(top: he * 0.02,  left: 10),
                width: we ,//* 0.9
                height: he * 0.15, //
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Timecall(),
                    SizedBox(
                      height: he * 0.06,
                    ),
                    Text(
                      "CATEGORIES",
                      style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.grey.withOpacity(0.8),
                          fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
      floatingActionButton:FadeAnimation(
        delay: 1.2,
        child: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).push(PageTransition(
                type: PageTransitionType.fade, child: const TaskPage()));
            //refreshNote();
          },
          backgroundColor:
          const FloatingActionButtonThemeData().backgroundColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}


/*FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TaskPage()))
          .then((value) {
            setState(() {

            });
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/

/*ListView.builder(
            itemCount: todo.length,

            itemBuilder: (BuildContext ctx, int index){
              return ListTile(
                title: Text(todo[index],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                ),
                trailing: const Icon(Icons.delete, color: Colors.red),
              );
            }
        )*/