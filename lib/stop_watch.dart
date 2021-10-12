
import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {

  Duration duration=Duration();
  Timer? timer; bool absorb=false;
  String stop_start='Start';

  @override
  void initState() {
    super.initState();
    startTimer();
    timer!.cancel();
  }

  startTimer(){
    timer=Timer.periodic(Duration(seconds: 1), (timer) {
      duration+=Duration(seconds: 1);
      setState((){});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 80,height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      alignment: Alignment.center,
                      child: Text('${duration.inHours<=9?'0${duration.inHours}':duration.inHours}',
                          style: TextStyle(fontSize: 60),textAlign: TextAlign.center),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 80,height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      alignment: Alignment.center,
                      child: Text('${duration.inMinutes<=9?'0${duration.inMinutes}':duration.inMinutes}',
                          style: TextStyle(fontSize: 60),textAlign: TextAlign.center),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 80,height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      alignment: Alignment.center,
                      child: Text('${duration.inSeconds.remainder(60)<=9?'0${duration.inSeconds.remainder(60)}':duration.inSeconds.remainder(60)}',
                          style: TextStyle(fontSize: 60),textAlign: TextAlign.center),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 400,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: (){
                      if(timer!.isActive){
                        timer!.cancel();
                        stop_start='Resume';

                      }else{
                        startTimer();
                        stop_start='Stop';
                      }
                      absorb=true;
                      setState((){});
                    },
                    child: Container(
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: Text('$stop_start',style: TextStyle(fontSize: 26),textAlign: TextAlign.center,),
                    )),
                SizedBox(width: 70,),
                AbsorbPointer(
                  absorbing: !absorb,
                  child: GestureDetector(
                      onTap: (){
                        absorb=false;
                        duration=Duration(minutes: 0,seconds: 0,microseconds: 0);
                        stop_start=timer!.isActive?'Stop':'Start';
                        timer!.cancel();
                        setState((){});
                      },
                      child: Container(
                        width: 140,alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: absorb?Colors.white38:Colors.white24,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        child: Text('Reset',style: TextStyle(fontSize: 26,color: absorb?Colors.white:Colors.white60),textAlign: TextAlign.center,),
                      )),
                )
              ],

            )
          ],
        ),
      ),
    );
  }
}