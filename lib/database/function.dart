import 'package:flutter/material.dart';
import 'package:myapp/database/model.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Studentupdates>> studentlist = ValueNotifier([]);
Future<void> addStudent(Studentupdates value) async {
  final studentDb = await Hive.openBox<Studentupdates>('student');
  final id = await studentDb.add(value);
  final studentdata = studentDb.get(id);
  await studentDb.put(
      id,
      Studentupdates(
        name: studentdata!.name,
        sem: studentdata.sem,
        image: studentdata.image,
        age: studentdata.age,
        phone: studentdata.phone,
        address: studentdata.address,
        course: studentdata.course,
        id: id,
      ));
  getStudent();
}

Future<void> getStudent() async {
  final studentDb = await Hive.openBox<Studentupdates>('student');
  studentlist.value.clear();
  studentlist.value.addAll(studentDb.values);
  studentlist.notifyListeners();
}