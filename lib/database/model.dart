import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class Studentupdates {

@HiveField(0)
String? name;
@HiveField(1)
String? sem;
@HiveField(2)
String? image;
@HiveField(3)
int? age;
@HiveField(4)
int? phone;
@HiveField(5)
String? address;
@HiveField(6)
String? course;
@HiveField(7)
int? id;

Studentupdates ({
  required this.name,
  required this.sem,
  required this.image,
  required this.age,
  required this.phone,
  required this.address,
  required this.course,
  required this.id,

});
}