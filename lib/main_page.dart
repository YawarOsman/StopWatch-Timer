import 'package:animation/stop_watch.dart';
import 'package:animation/timer.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black12,
           title:  TabBar(
                tabs: [
                  Tab(child: Text('StopWatch',style: TextStyle(fontSize: 24),),),
                  Tab(child: Text('Timer',style: TextStyle(fontSize: 24),),),
                ]),
          ),
          body: TabBarView(
              children: [
                StopWatch(),
                Timerr()
          ]),
        ),
      ),
    );
  }
}
