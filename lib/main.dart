import 'package:flutter/material.dart';
import 'package:student_information_system/edit_student.dart';
import 'package:student_information_system/student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SSS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Student Information System',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  List<Student> students = [Student('ali', 'ahmet', 40),Student('kerem', 'samet',40)];


  MyHomePage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Student selectedStudent = Student('', '', 0);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: bodyStructure(context),
    );
  }

  Widget bodyStructure(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: widget.students.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(widget.students[index].name +
                    ' ' +
                    widget.students[index].surname),
                subtitle: Text(
                    'Not: ${widget.students[index].score} (${widget.students[index].getStatus})'),
                leading: Icon(Icons.account_circle_rounded, size: 50),
                trailing: statusIcon(widget.students[index].score),
                //Icon(Icons.done_outline_sharp),
                onTap: () {
                  setState(() {
                    this.selectedStudent=widget.students[index];
                  });

                },


              );
            },
          ),
        ),
        ElevatedButton(onPressed:(){
    setState(() {

    });
    } , child: Text('Yenile')),
        Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(12),),
          child: Text('Selected student : ${selectedStudent.name} ${selectedStudent.surname}',
          style: TextStyle(fontWeight: FontWeight.w400,
          fontSize: 18
          ),
          ),
        ),
        SizedBox(height: 20,),
        Row(
          children: <Widget>[
            SizedBox(
              width: 5,
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditStudent(widget.students)),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add_circle_outlined),
                      SizedBox(width: 10),
                      Text('Öğrenci Ekle'),
                    ],
                  )),
            ),
            SizedBox(
              width: 5,
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 6,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditStudent(widget.students)),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.change_circle_outlined),
                      SizedBox(width: 5),
                      Text('Güncelle'),
                    ],
                  )),
            ),
            SizedBox(
              width: 3,
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 4,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed:() {deleteStudent(selectedStudent,widget.students);},
                  child: Row(
                    children: [
                      Icon(Icons.delete_forever),
                      SizedBox(width: 5),
                      Text('Sil'),
                    ],
                  )),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        )
      ],
    );
  }

  Widget statusIcon(int score) {
    if (score >= 50 && score <= 100) {
      return Icon(Icons.done_outlined);
    } else if (score >= 30) {
      return Icon(Icons.access_time);
    } else {
      return Icon(Icons.clear_sharp);
    }
  }

  showStudent(String name) {
    print(name);
  }

  deleteStudent(Student student,List students) {
for(int i=0;i<students.length;i++){
  if(student.name==students[i].name){
    setState(() {
      students.removeAt(i);
    });


  }

}




  }


}
