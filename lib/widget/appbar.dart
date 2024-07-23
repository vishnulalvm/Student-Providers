// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:myapp/database/function.dart';
// import 'package:myapp/database/model.dart';

// final searchControler = TextEditingController();
// Timer? debouncer;

// String searchText = '';
// AppBar appbar(BuildContext context, value) {
//   return AppBar(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(
//         bottom: Radius.elliptical(MediaQuery.of(context).size.width, 70.0),
//       ),
//     ),
//     bottom: PreferredSize(
//       preferredSize: const Size.fromHeight(80),
//       child: SizedBox(
//         height: 80,
//         child: Container(
//           width: double.infinity,
//           height: 50,
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20),
//             child: TextField(
//               onChanged: (values) {
//                 value.getsearchtext(values);
//                 onSearchChange(values);
//               },
//               controller: searchControler,
//               decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.white),
//                     borderRadius: BorderRadius.circular(20)),
//                 hintText: 'search students...❔',
//                 hintStyle: const TextStyle(color: Colors.white),
//                 suffixIcon: IconButton(
//                     onPressed: () {
//                       searchControler.clear();
//                       value.getsearchText('');
//                       getStudent();
//                     },
//                     icon: const Icon(Icons.close)),
//                 prefixIcon: IconButton(
//                   icon: const Icon(Icons.search),
//                   onPressed: () {},
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// void onSearchChange(String values) {
//   final studentdb = Hive.box<Studentupdates>('student');
//   final students = studentdb.values.toList();
//   values = searchControler.text;
//   if (debouncer?.isActive ?? false) debouncer?.cancel();
//   debouncer = Timer(const Duration(milliseconds: 200), () {
//     if (searchText != searchControler) {
//       final filterdStudent = students
//           .where((students) => students.name!
//               .toLowerCase()
//               .trim()
//               .contains(values.toLowerCase().trim()))
//           .toList();
//       studentlist.value = filterdStudent;
//     }
//   });
// }
