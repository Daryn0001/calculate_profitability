import 'package:calculate_profitability/pages/taskpage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../Animation/fadeAnimation.dart';
import '../core/data/time_say.dart';
import '../db/database_helper.dart';
import '../model/note.dart';
import '../widgets/list_item.dart';
import 'button_change_them.dart';

class HomePage extends StatefulWidget {
  VoidCallback opendrawer;
  //static List<Note> todo = [];
  HomePage({Key? key, required this.opendrawer}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoading = false;
  List<Note> todo = [];





  @override
  void initState() {
    super.initState();
    //deleteAllNotes();
    //printAll();
    refreshNote();
  }

  Future deleteAllNotes() async {

    final db = NotesDatabase.instance;
    db.deleteDatabase('notes.db');
    //db.dropIfExists();
  }

  Future printAll () async {
    final db = NotesDatabase.instance;
    print(db.showAllTables());
  }

  Future refreshNote() async {
    setState(() => isLoading = true);
    todo = await NotesDatabase.instance.readAllNotes();
    //print("todo size: ${todo.length}");
    setState(() => isLoading = false);
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
                    color: Colors.white70,
                    size: 30,
                  )),
              SizedBox(
                width: we * 0.7,
              ),
              /*SizedBox(
                width: we * 0.04,
              ),*/
              ChangeThembutton()
            ],
          )
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(children: [
                FadeAnimation(
                  delay: 0.8,
                  child: Container(
                    margin: EdgeInsets.only(top: he * 0.02, left: 10),
                    width: we, //* 0.9
                    //height: he * 0.15, //
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Timecall(),
                        SizedBox(
                          height: he * 0.06,
                        ),
                        //getDescription(),
                        Text(
                          "ТІЗІМДЕР",
                          style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.red.withOpacity(0.8),
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                         child: FutureBuilder(
                             initialData: const [],
                           future: NotesDatabase.instance.readAllNotes(),
                           builder: (context, AsyncSnapshot snapshot) {
                             return ListView.builder(
                                 itemCount: snapshot.data.length,
                                 //itemCount: 4,
                                 itemBuilder: (context, index) {
                                   Note n = snapshot.data[index];

                                   print('${n.id} : ${n.projectName}' );
                                      return ListItem(
                                       projectName: n.projectName,
                                       id: n.id
                                   );
                                 });
                           }

                         ),
                        ),
                      ]),
                ),
              ]),
            ),
      floatingActionButton: FadeAnimation(
        delay: 1.2,
        child: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context)
                .push(PageTransition(
                    type: PageTransitionType.fade, child: TaskPage()))
                .then((value) {
              refreshNote();
            });
            //refreshNote();
          },
          backgroundColor:
              const FloatingActionButtonThemeData().backgroundColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  String text = 'Кешенді құруға және өндіруге кеткен шығындар, '
      'техникалық құралдар кешеніне кеткен шығындар, программа жасауға және түзетуге кеткен шығындар, '
      'ақпарат өнімділігі есептеу';

  Widget getDescription() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey, // 126E82  0xFF04123F  132C33
          border: Border.all(
            color: Colors.black38,
          )),
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 16,
            letterSpacing: 2,
            color: Colors.white,
            fontWeight: FontWeight.w500),
      ),
    );
  }

}
