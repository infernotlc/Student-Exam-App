class StudentValidationMixin{
  String validateFirstName(String value){
    if(value.length<2 ){
      return "name must be at least 2 characters";

    }
  }
  String validateLastName(String value){
    if(value.length<2 ){
      return "surname must be at least 2 characters";

    }
  }
  String validateGrade(String value){
    var grade=int.parse(value);
    if(grade<0 || grade>100){
      return"Grade must be between 0-100";

    }
  }
}