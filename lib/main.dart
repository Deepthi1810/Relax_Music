import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final player = AudioCache();
  static AudioPlayer instance;
  void playSound() async {
 instance = await player.loop('ocean.mp3');
  }
  void stopSound(){
    if(instance!=null){
      instance.pause();
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffECC6AF),
        appBar: AppBar(
          title:Text('Relaxo'),
          backgroundColor: Color(0xffFCAA7B),
        ),
        body: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Card(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child:Image.network('https://images.unsplash.com/photo-1494459940152-1e911caa8cc5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OXx8cmVsYXhpbmclMjBieSUyMHRoZSUyMGJlYWNofGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80',
                  height: 350.0,
                    width: 300.0,
                    fit: BoxFit.fill,

                  )

               ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(icon:Icon(
                    Icons.play_circle_filled,
                    color: Colors.green,
                    size: 60.0,

                  ) ,
                      onPressed:(){ playSound();}

                      ),
SizedBox(width: 30.0,),
                  IconButton(
                    icon:Icon(
                  Icons.pause_circle_filled,
                  color: Colors.red,
                  size: 60.0,
    ) ,
    onPressed: (){ stopSound();}
                    ),


                ],
              )
            ],
          ),
         decoration: BoxDecoration(
           gradient: LinearGradient(
             begin: Alignment.topCenter,
               end: Alignment.bottomCenter,
               colors: [Color(0xff6C6C6A),Color(0xffECC6AF)]))
           )
         )
        );

  }
}
