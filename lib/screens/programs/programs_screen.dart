import 'package:flutter/material.dart';
import 'timer.dart';

class ProgramsScreen extends StatelessWidget {
  final Map<String, String> workoutButtonImageMap = {
    'Yoga': 'assets/images/yoga_button.jpg',
    'Cardio': 'assets/images/cardio_button.jpg',
    'Aerobic': 'assets/images/aerobic_button.jpg',
    'Strength Workout': 'assets/images/strength_button.jpg',

  };

  final Map<String, List<String>> workoutTimerImageMap = {
    'Yoga': [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
      'assets/images/4.png',
      'assets/images/5.png',
      'assets/images/6.png',

    ],
    'Cardio': [
      'assets/images/cardio1.png',
      'assets/images/cardio2.png',
      'assets/images/cardio3.png',
      'assets/images/cardio4.png',
      'assets/images/cardio5.png',
      'assets/images/cardio6 (6).png',

    ],
    'Aerobic': [
      'assets/images/aero1.png',
      'assets/images/aero2.png',
      'assets/images/aero3.png',
      'assets/images/aero4.png',
      'assets/images/aero5.png',


    ],
    'Strength Workout': [
      'assets/images/str1.png',
      'assets/images/str2.png',
      'assets/images/str3.png',
      'assets/images/str4.png',
      'assets/images/str5.png',
      'assets/images/str6.png',
    ],

  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a workout'),
        backgroundColor: Colors.pink[100],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/picture_for_home.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ListView.builder(
            itemCount: workoutButtonImageMap.length,
            padding: EdgeInsets.all(10.2),
            itemBuilder: (context, index) {
              final workoutLabel = workoutButtonImageMap.keys.elementAt(index);
              final buttonImagePath = workoutButtonImageMap[workoutLabel]!;
              final timerImagePaths = workoutTimerImageMap[workoutLabel]!;
              return buildProgramButton(
                context,
                workoutLabel,
                buttonImagePath,
                timerImagePaths,
                Colors.pink[100]!,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildProgramButton(
      BuildContext context,
      String label,
      String buttonImagePath,
      List<String> timerImagePaths,
      Color color,
      ) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkoutTimerPage(
              workoutLabel: label,
              workoutImagePaths: timerImagePaths,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Image.asset(buttonImagePath),
          SizedBox(height: 13),
          Text(
            label,
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
