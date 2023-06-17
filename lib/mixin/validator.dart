mixin ValidationsMixin {
  String? nameValidatio(String? value, [String? message]){
    if(value!.isEmpty) return message ?? "Este campo é obrigatorio";
    return null;
  }

  String? passwordValidation(String? value, [String? message]){
    if(value!.length < 5) return message ?? "Este campo é obrigatorio";
    return null;
  }

  /*
  String? emailValidation(String? value, [String? message]){
    if(value! != "@") return message ?? "Campo invalido";
    return null;
  }
  */
}