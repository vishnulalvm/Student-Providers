// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myapp/screen/home.dart';
import 'package:myapp/widget/color.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotohome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 78, 44, 24),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text.rich(
              TextSpan(
                text: 'STUDENT',
                style: const TextStyle(
                  color: Color.fromARGB(255, 4, 142, 221),
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' DATAS',
                    style: TextStyle(
                    color: CustomColor.getColor(),
                      fontWeight: FontWeight.normal,
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
           
          ],
        ),
      ),
    );
  }

  Future<void> gotohome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => const HomeScreen()));
  }
}