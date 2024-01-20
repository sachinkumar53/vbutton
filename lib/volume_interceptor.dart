import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VolumeInterceptor extends StatefulWidget {
  @override
  _VolumeInterceptorState createState() => _VolumeInterceptorState();
}

class _VolumeInterceptorState extends State<VolumeInterceptor> {
  int _counter = 0;
  final MethodChannel _channel = const MethodChannel('volume_interceptor');

  //late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    //_audioPlayer = AudioPlayer();
    _initPlatformState();
  }

  Future<void> _initPlatformState() async {
    _channel.setMethodCallHandler((MethodCall call) async {
      if (call.method == 'volumeButtonPressed') {
        // Perform your custom task for volume button press
        print("Volume button pressed");
        setState(() {
          _counter++;
        });
        // Add your custom task here

        // Stop the default behavior of volume buttons
        return true;
      }
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Volume Button Override'),
        ),
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$_counter',
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              Text('Press volume buttons to increase count.')
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    //_audioPlayer.dispose();
    super.dispose();
  }
}
