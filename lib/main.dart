import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uzaktan Işık Kontrolü',
      theme: ThemeData(primaryColor: Colors.purple[300]), 
      home: LightControlPage(),
    );
  }
}

class LightControlPage extends StatefulWidget {
  @override
  _LightControlPageState createState() => _LightControlPageState();
}

class _LightControlPageState extends State<LightControlPage> {
  bool isLightOn = false;

  void toggleLight() {
    setState(() {
      isLightOn = !isLightOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uzaktan Işık Kontrolü'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: toggleLight,
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: isLightOn ? Colors.green : Colors.grey,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
             child: AnimatedAlign(
              duration: Duration(milliseconds: 100), // Animasyon süresi
              alignment: isLightOn ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
