class ValidaionMixin{
  String validateEmail(String value){
    print("şifre");
    print(value);
    if(value.contains("@")!=true){
      return "E-mail formatı uygun değildir.";
    }
  }

  String validatePassword(String value){
    if(value.length<2){
      return "Şifre alanını boş geçemezsiniz";
    }
  }
}