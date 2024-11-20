import 'package:flutter/cupertino.dart';

class ToggleTheme with ChangeNotifier{
  bool _isChecked = false;
  bool _passwordCheck = false;

  bool get isChecked => _isChecked;

  void toggleCheckBox(bool? newValue){
    if(newValue !=null){
      _isChecked=!_isChecked;
    }else{
      _isChecked=!_isChecked;
    }
    notifyListeners();
  }

  // void toogleIcon(){
  //
  //   _passwordCheck=!_passwordCheck;
  //   notifyListeners();
  // }

}

class TogglePassword with ChangeNotifier{
  bool _isChecked = false;
  bool _passwordCheck = false;

  bool get isChecked => _isChecked;

  void toggleCheckBox(bool? newValue){
    if(newValue !=null){
      _isChecked=!_isChecked;
    }else{
      _isChecked=!_isChecked;
    }
    notifyListeners();
  }

// void toogleIcon(){
//
//   _passwordCheck=!_passwordCheck;
//   notifyListeners();
// }

}