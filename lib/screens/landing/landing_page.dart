import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shape_up/screens/auth/auth_view.dart'; // Import your AuthView here

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/picture_for_home.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.57,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Text(
                    "ShapeUp",
                    style: GoogleFonts.dancingScript(
                      fontSize: 85,
                      color: Colors.pink[200],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AuthView()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink[200],
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
