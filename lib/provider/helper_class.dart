import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/database/model.dart';



class StudentProvider extends ChangeNotifier {
  File? selectedimage;
  String? onsearch;
  List<Studentupdates> _studentlist = [];
  List<Studentupdates> get studentsearchlist {
    return _studentlist;
  }

  getimage(File? image) {
    selectedimage = image;
    notifyListeners();
  }

  getsearchtext(String? str) {
    onsearch = str;
    notifyListeners();
  }

}