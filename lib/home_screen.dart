import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:myapp/button_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final AudioPlayer _player;
  final button = allButtons;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:
            button
                .map(
                  (button) => xylophoneButton(
                    color: button.color,
                    onPressed: () async {
                      await _player.play(
                        AssetSource('assets/${button.audioName}.wav'),
                      );
                    },
                  ),
                )
                .toList(),
      ),
    );
  }
}

// ignore: camel_case_types
class xylophoneButton extends StatelessWidget {
  const xylophoneButton({
    super.key,
    required this.color,
    required this.onPressed,
  });
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Container(
            height: 200,
            width: double.infinity,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
