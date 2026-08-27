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

  Widget _buildSquareButton(IconData icon, String command) {
    return GestureDetector(
      onTapDown: (_) => _sendCommand(command),
      onTapUp: (_) => _sendCommand("S"),
      onTapCancel: () => _sendCommand("S"),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: Color(0xff172946),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white, size: 40),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Controller',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Color(0xff172946),
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    _buildSquareButton(
                      Icons.keyboard_double_arrow_left_rounded,
                      "L",
                    ),
                    _buildSquareButton(
                      Icons.keyboard_double_arrow_right_rounded,
                      "R",
                    ),
                  ],
                ),
              ),
              SizedBox(width: 50),
              SizedBox(
                width: 338,
                height: 186,
                child: Image.asset(
                  "assets/images/controller-logo.png",
                  fit: .fill,
                ),
              ),

              Expanded(
                child: Column(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    _buildSquareButton(
                      Icons.keyboard_double_arrow_up_rounded,
                      "F",
                    ),
                    _buildSquareButton(
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
