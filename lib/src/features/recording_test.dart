import 'package:flutter/material.dart';

class RecordingTest extends StatelessWidget {
  const RecordingTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Recording Text",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.record_voice_over,
                      size: 40,
                    ),
                    Text(
                      "Start",
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.stop,
                      size: 40,
                    ),
                    Text(
                      "Stop",
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
