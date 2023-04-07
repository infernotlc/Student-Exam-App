import 'package:flutter/material.dart';
import 'package:myapp2/validator/student_validator.dart';

class StudentAdd extends StatefulWidget{
  List<Student> students;
  StudentAdd(List<Student>students) {
  this.students=students;
  }


  @override
  State<StatefulWidget> createState(){
    return _StudenAddState(students);
  }


class _StudenAddState extends State with StudentValidationMixin {
  List<Student> students;
  var student = Student.withoutInfo();
  var formKey=GlobalKey<FormState>();
 _StudentAddState( List<Student> students){
   this.students=students;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Yeni ogrenci ekle")
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
             key:formKey
              child: Column,
              children: <Widget>[
                buildfirstnameField(),
                buildLastnameField(),
                buildGradeField()
                buildSubmitButton()
              ]
          ),
        )
    );
  }

  Widget buildfirstnameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "student name", hintText: "Talha"),
      validator: validateLastName,
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }
  Widget buildLastnameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Student lastaname", hintText: "Talha"),
      validator: validateLastName,
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }
  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Grade", hintText: "65"),
      validator: validateGradeName,
      onSaved: (String value) {
        student.grade =int.parse(value) ;
      },
    );
  }

 Widget buildSubmitButton() {
  return RaisedButton(
  child:Text("Save"),
  onpressed:() {
  if (formKey.currentState.validate()) {
  formKey.currentState.save();
  students.add(student);
  saveStudent();
  Navigator.pop(context);
  }
  },
  );
  }
  void saveStuden(){
   print(student.firstName);
   print(student.lastName);
   print(student.grade);


  }
    }
}