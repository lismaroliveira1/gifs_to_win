class CommonController {
  Map validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)', errorTextDialog;
    RegExp regExp = new RegExp(patttern);
    bool isValidName;
    if (value.length == 0) {
      isValidName = false;
      errorTextDialog = null;
    } else if (value.length > 0 && value.length < 4) {
      errorTextDialog = "Informe o nome";
      isValidName = false;
    } else if (!regExp.hasMatch(value)) {
      errorTextDialog = "O nome deve conter caracteres de a-z ou A-Z";
      isValidName = false;
    } else {
      isValidName = true;
      errorTextDialog = null;
    }
    return {
      'isValidName': isValidName,
      'errorTextDialog': errorTextDialog,
    };
  }
}
