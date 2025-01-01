import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({Key? key}) : super(key: key);

  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
 final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  void _togglePlayPause() async{
    if (isPlaying) {
    await  _audioPlayer.pause();
    } else {
       try {
        await _audioPlayer.setSource(AssetSource('product.ogg')); 
        await _audioPlayer.resume(); 
      } catch (e) {
        print('Error playing audio: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to play audio.')),
        );
      }
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal, 
      ),
      body: Container(
        color: const Color.fromARGB(255, 196, 232, 229),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Audio Player',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto', 
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _togglePlayPause,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade700, 
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  isPlaying ? 'Pause' : 'Play',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'Roboto', 
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
