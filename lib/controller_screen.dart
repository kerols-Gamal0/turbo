import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ControllerScreen extends StatefulWidget {
  const ControllerScreen({super.key});

  @override
  State<ControllerScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ControllerScreen> {
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref(
    "command",
  );
  void _sendCommand(String command) {
    _databaseRef.set(command);
  }

  Widget _buildCircleButton(IconData icon, String command) {
    return GestureDetector(
      onTapDown: (_) => _sendCommand(command),
      onTapUp: (_) => _sendCommand("S"),
      onTapCancel: () => _sendCommand("S"),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141118),
      appBar: AppBar(
        backgroundColor: Color(0xff141118),
        title: Text(
          'Controller',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: .center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    _buildCircleButton(Icons.keyboard_arrow_left_rounded, "L"),
                    _buildCircleButton(Icons.keyboard_arrow_right_rounded, "R"),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    _buildCircleButton(
                      Icons.keyboard_double_arrow_up_rounded,
                      "F",
                    ),
                    _buildCircleButton(
                      Icons.keyboard_double_arrow_down_rounded,
                      "B",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
