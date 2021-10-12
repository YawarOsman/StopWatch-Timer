
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class Timerr extends StatefulWidget {
  const Timerr({Key? key}) : super(key: key);

  @override
  _TimerrState createState() => _TimerrState();
}

class _TimerrState extends State<Timerr> {

  Duration duration=Duration();
  Timer? timer; bool absorb=false;
  String stop_start='Start';
  int secondValue=00;
  int minuteValue=00;
  int hourValue=00;

  @override
  void initState() {
    super.initState();
    startTimer();
    timer!.cancel();
  }

  startTimer(){
    timer=Timer.periodic(Duration(seconds: 1), (timer) {
      if(duration>Duration()){
        duration-=Duration(seconds: 1);
      }
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
            Stack(
              children: [

                AbsorbPointer(
                  absorbing: absorb,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 80,height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                                ),
                                NumberPicker(
                                minValue: 0,
                                maxValue: 99,
                                value: duration.inHours.remainder(100),
                                onChanged: (value){
                                  duration=Duration(hours: value,minutes: minuteValue.remainder(60),seconds: secondValue.remainder(60));
                                  this.hourValue=duration.inHours.remainder(100);
                                  setState(() {});
                                },
                                textStyle: TextStyle(fontSize: 35,color: Colors.white30),
                                selectedTextStyle: TextStyle(fontSize: 60),
                                itemCount: 3,
                                itemHeight: 100,
                                zeroPad: true,
                                infiniteLoop: true,
                              )

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 80,height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                            ),
                               NumberPicker(
                                minValue: 0,
                                maxValue: 59,
                                value: duration.inMinutes.remainder(60),
                                onChanged: (value){
                                  duration=Duration(hours: hourValue.remainder(100),minutes: value,seconds: secondValue.remainder(60));
                                  this.minuteValue=duration.inMinutes.remainder(60);
                                  setState(() {});
                                },
                                textStyle: TextStyle(fontSize: 35,color: Colors.white30),
                                selectedTextStyle: TextStyle(fontSize: 60),
                                itemCount: 3,
                                itemHeight: 100,
                                zeroPad: true,
                                infiniteLoop: true,
                              )

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 80,height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                            ),
                            NumberPicker(
                              minValue: 0,
                              maxValue: 59,
                              value: duration.inSeconds.remainder(60),
                              onChanged: (value){
                                duration=Duration(hours: hourValue.remainder(100),minutes: minuteValue.remainder(60),seconds: value);
                                this.secondValue=duration.inSeconds.remainder(60);
                                setState(() {});
                              },
                              textStyle: TextStyle(fontSize: 35,color: Colors.white30),
                              selectedTextStyle: TextStyle(fontSize: 60),
                              itemCount: 3,
                              itemHeight: 100,
                              zeroPad: true,
                              infiniteLoop: true,
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
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
                        color: duration==Duration()?Color(0xff272754):Colors.purple,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: Text('$stop_start',
                        style: TextStyle(fontSize: 26,color: duration==Duration()?Colors.white60:Colors.white),textAlign: TextAlign.center),
                    )),
                SizedBox(width: 70,),
                AbsorbPointer(
                  absorbing: duration==Duration(),
                  child: GestureDetector(
                      onTap: (){
                        absorb=false;
                        duration=Duration(hours: 0,minutes: 0,seconds: 0);
                        stop_start='Start';
                        timer!.cancel();
                        setState((){});
                      },
                      child: Container(
                        width: 140,alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: duration==Duration()?Colors.white24:Colors.white38,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        child: Text('Reset',style: TextStyle(fontSize: 26,color: duration==Duration()?Colors.white60:Colors.white),textAlign: TextAlign.center,),
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