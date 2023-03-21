import 'package:flutter/material.dart';
import 'package:student_information_system/student.dart';

class EditStudent extends StatefulWidget {
  late List<Student> students;

  @override
  State<StatefulWidget> createState() {
    return _StudentPageState();
  }

  EditStudent(List<Student> students){
    this.students=students;

  }
}

class _StudentPageState extends State<EditStudent> {
  var key = GlobalKey<FormState>();
  var student = Student('', '', 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Edit Student'),),
      body: Container(
        margin: EdgeInsets.all(20),

        child: Form(
          key: this.key,


          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Öğrenci Adı',

                ),
                onSaved: (newValue) {
                  if(newValue!=null){
                    student.name=newValue;
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("enter valid name"),
                    ));
                  }

                },

              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Öğrenci Soyadı',

                ),
                onSaved: (newValue) {
                  if(newValue!=null){
                    student.surname=newValue;
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("enter valid surname"),
                    ));
                  }

                },

              ),


              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Öğrenci Notu',

                ),
                onSaved: (newValue) {
                  if(newValue!=null){
                    student.score = int.parse(newValue);
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("enter valid grade"),
                    ));
                  }

                },

              ),


              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(right: 110,left: 110),
                child: ElevatedButton(
                  autofocus: true,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                    onPressed: (){

                      key.currentState!.save();

                      setState(() {
                        widget.students.add(student);
                      });
                      Navigator.pop(context);

                    },

                    child: Row(
                      children: [
                        Icon(Icons.add_circle_outlined),
                        SizedBox(width: 12),
                        Center(child: Text('Ekle')),
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsets.only(right: 110,left: 110),
                child: ElevatedButton(
                    autofocus: true,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                    onPressed: null,

                    child: Row(
                      children: [
                        Icon(Icons.change_circle_outlined),
                        SizedBox(width:12),
                        Center(child: Text('Güncelle')),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
