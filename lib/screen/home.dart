import 'dart:async';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:myapp/database/curd.dart';
import 'package:myapp/database/function.dart';
import 'package:myapp/database/model.dart';
import 'package:myapp/provider/helper_class.dart';
import 'package:myapp/screen/add.dart';
import 'package:myapp/widget/bottom_sheet.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getStudent();
    super.initState();
    searchControler.removeListener(() {
      searchText;
    });
  }

  final searchControler = TextEditingController();
  Timer? debouncer;
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom:
                  Radius.elliptical(MediaQuery.of(context).size.width, 70.0),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: SizedBox(
              height: 100,
              child: Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    onChanged: (values) {
                      value.getsearchtext(values);
                      onSearchChange(values);
                    },
                    autofocus: false,

                    focusNode: FocusNode(),
                    controller: searchControler,
                    decoration: InputDecoration(

                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 24, 20, 20)),
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'Search students',
                      hintStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      suffixIcon: IconButton(
                          onPressed: () {
                            searchControler.clear();
                            value.getsearchtext('');
                            getStudent();
                          },
                          icon: const Icon(Icons.close)),
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: ValueListenableBuilder(
            valueListenable: studentlist,
            builder: (context, List<Studentupdates> students, Widget? child) {
              return studentlist.value.isEmpty
                  ? SizedBox(
                    // height: 600,
                    //width: 400,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 1,
                          ),
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.network(
                                'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/c7/d8/61/c7d861d7-1681-f93e-386e-2f67159a6ee1/logo_keep_2020q4_color-0-1x_U007emarketing-0-0-0-6-0-0-0-85-220-0.png/230x0w.webp'),
                          ),
                        ],
                      ),
                    ),
                  )
                  : GridView.builder(
                  shrinkWrap: true,
                  itemCount: students.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    mainAxisExtent: 305,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final studentdata = students.reversed.toList()[index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          showDraggableBottomSheet(
                              context,
                              studentdata.name!,
                              studentdata.course!,
                              studentdata.sem!,
                              studentdata.phone!,
                              studentdata.age!,
                              studentdata.address!,
                              studentdata.image!);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color:
                                  const Color.fromARGB(255, 236, 228, 233),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0),
                                  ),
                                  child: Container(
                                    color: Colors.grey,
                                    child: Placeholder(
                                      child: Image.file(
                                        File(studentdata.image!),
                                        height: 170,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        studentdata.name!.toUpperCase(),
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        studentdata.course!.toUpperCase(),
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.edit),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (reg) =>
                                                          DataInsert(
                                                            isEdit: true,
                                                            value:
                                                                studentdata,
                                                          )));
                                            },
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete),
                                            onPressed: () {
                                              delete(
                                                  context, studentdata.id);
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                                      );
            }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 254, 175, 85),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (reg) => DataInsert(
                        isEdit: false,
                      )),
            );
          },
        ),
      );
    });
  }

  onSearchChange(
    String values,
  ) {
    final studentdb = Hive.box<Studentupdates>('student');
    final students = studentdb.values.toList();
    values = searchControler.text;

    if (debouncer?.isActive ?? false) debouncer?.cancel();
    debouncer = Timer(const Duration(milliseconds: 200), () {
      if (searchText != searchControler) {
        final filterdStudent = students
            .where((students) => students.name!
                .toLowerCase()
                .trim()
                .contains(values.toLowerCase().trim()))
            .toList();
        studentlist.value = filterdStudent;
      }
    });
  }
}
