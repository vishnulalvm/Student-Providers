import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/database/model.dart';
import 'package:myapp/provider/helper_class.dart';
import 'package:myapp/screen/splash.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.openBox<Studentupdates>('student');
  if(!Hive.isAdapterRegistered(StudentupdatesAdapter().typeId)) {
    Hive.registerAdapter(StudentupdatesAdapter());
  }
  runApp( const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StudentProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255, 254, 209, 85),)
        ),
        
        home: const ScreenSplash(),
      ),
    );
  }
}