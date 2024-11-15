import 'dart:math';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double storagePercentage = 0.0;
  int ping = 0;
  Timer? _pingTimer;

  @override
  void initState() {
    super.initState();
    _startPingUpdates();
  }


  // Method to simulate ping updates (replace with actual implementation if available)
  void _startPingUpdates() {
    _pingTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        // Simulating ping value for demonstration

        ping = (100 + (Random().nextInt(50))) as int; // Generates ping between 100-150 ms
      });
    });
  }
  @override
  void dispose() {
    _progressNotifier.dispose();
    _pingTimer?.cancel();
    super.dispose();
  }
  ValueNotifier<double> _progressNotifier = ValueNotifier(0.0);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('DASHBOARD', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SimpleCircularProgressBar(
                  valueNotifier: _progressNotifier,
                  mergeMode: true,
                  progressStrokeWidth: 8.0,
                  backStrokeWidth: 8.0,
                  progressColors: [Colors.greenAccent, Colors.lightGreenAccent],
                  backColor: Colors.grey,
                  onGetText: (double value) {
                    TextStyle centerTextStyle = TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    );

                    return Text(
                      '${value.toInt()}%', // Show percentage as integer
                      style: centerTextStyle,
                    );
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PING: $ping ms',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('AI ANALYSIS'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('ULTRA BOOST'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('GFX TOOL'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.red,
              child: Center(
                child: Text(
                  'ACTIVATE 4X GAME SPACE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              '(In the previous version, you needed to select a game before speeding up. From this version, you just need to press Activate 4X Game Space then open the game and the AI will automatically optimize and speed up.)',
              style: TextStyle(color: Colors.white, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
