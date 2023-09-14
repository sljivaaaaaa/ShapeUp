import 'dart:async';
import 'package:flutter/material.dart';

class WorkoutTimerPage extends StatefulWidget {
  final String workoutLabel;
  final List<String> workoutImagePaths;

  WorkoutTimerPage({
    required this.workoutLabel,
    required this.workoutImagePaths,
  });

  @override
  _WorkoutTimerPageState createState() => _WorkoutTimerPageState();
}

class _WorkoutTimerPageState extends State<WorkoutTimerPage> {
  late Timer _timer;
  int _imageIndex = 0;
  List<String> _imagePaths = [];
  double _progress = 1.0;
  bool _workoutDone = false;
  int _countdown = 30;

  @override
  void initState() {
    super.initState();
    _imagePaths = widget.workoutImagePaths;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown == 0) {
          if (_imageIndex < _imagePaths.length - 1) {
            _imageIndex++;
            _countdown = 30;
          } else {
            _showWorkoutDoneMessage();
            _timer.cancel();
            return;
          }
        } else {
          _countdown--;
        }

        _progress = _countdown / 30;
      });
    });
  }

  void _showWorkoutDoneMessage() {
    setState(() {
      _workoutDone = true;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workoutLabel),
        backgroundColor: Colors.pink[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),

            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Image.asset(
                _imagePaths[_imageIndex],
                fit: BoxFit.cover,
              ),
            ),
            Spacer(flex: 1),

            Text(
              '$_countdown seconds left',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 120,
              height: 120,
              child: CircularProgressIndicator(
                value: _progress,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                strokeWidth: 15,
              ),
            ),
            Spacer(flex: 2),

            _workoutDone
                ? Text(
              'Workout done!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
