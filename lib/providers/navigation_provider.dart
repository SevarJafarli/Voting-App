import 'package:flutter/cupertino.dart';
import 'package:voting_app_demo/models/enums/home_tab_enum.dart';

class NavigationProvider extends ChangeNotifier{
  HomeTab? currentTab;

void clearSelection(){
  currentTab = null;
  
}
  void navigate(HomeTab tab){
    currentTab = tab;
    notifyListeners();
  }
}