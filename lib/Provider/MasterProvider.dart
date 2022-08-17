import 'package:flutter/cupertino.dart';

class MasterProvider with ChangeNotifier{
  String? _link ;
  String? get getLink => _link;
  set setLink (String link){
    _link = link;
    notifyListeners();
  }

}