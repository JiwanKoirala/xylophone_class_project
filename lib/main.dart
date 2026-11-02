
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double height = 70;
  final AudioPlayer player = AudioPlayer();

  Widget drawKey(  
    {
    required int note,
    required Color keyColor,
    double keyHzt = 30,
    double keyHeight = 70}
    ) {
    return Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: keyHzt,
                  vertical: 10,
                ),
                child:TextButton(
                  onPressed:() async{
                    await player.stop();
                    player.play(AssetSource('note$note.wav'));
                  },
                  child: Container(
                    width: double.infinity,
                    height: keyHeight,
                    decoration: BoxDecoration(
                      color: keyColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              );
  }
  @override
  void dispose(){
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          elevation: 5,
          shadowColor: Colors.orange,
          title: Text(
            'Xylophone',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: drawKey(keyColor: Colors.red,note:1,)),
              Expanded(
                child: drawKey(keyColor:Colors.green,
                keyHzt: 50, keyHeight: height,note:2),
              ),
              Expanded(
                child: drawKey(keyColor:Colors.yellow,
                keyHzt:70, keyHeight: height,note:3),
              ),
              Expanded(
                child: drawKey(keyColor:Colors.blue,
                keyHzt:90, keyHeight: height,note:4 ),
              ),
              Expanded(
                child: drawKey(keyColor:Colors.purple,
                keyHzt:110, keyHeight: height,note:5),
              ),
              Expanded(
                child: drawKey(keyColor:Colors.orange,
                keyHzt:130, keyHeight: height,note:6),
              ),
              Expanded(
                child: drawKey(keyColor:Colors.pink,
                keyHzt:150, keyHeight: height,note:7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
