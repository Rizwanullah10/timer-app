import 'package:flutter/material.dart';

void main() {
  runApp(TimerApp());
}

class TimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int countdown = 10; // Set your desired countdown start time
  bool isRunning = false;

  void startTimer() async {
    setState(() {
      isRunning = true;
    });
    for (int i = countdown; i > 0; i--) {
      setState(() {
        countdown = i;
      });
      await Future.delayed(Duration(seconds: 1));
    }
    setState(() {
      countdown = 0;
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$countdown',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isRunning ? null : startTimer,
              child: Text(isRunning ? 'Running...' : 'Start Timer'),
            ),
          ],
        ),
      ),
    );
  }
}
