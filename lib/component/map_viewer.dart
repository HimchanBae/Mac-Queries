import 'package:flutter/material.dart';

class MapViewer extends StatelessWidget {
  const MapViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(50),
              minScale: 0.5,
              maxScale: 5,
              panEnabled: true,
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/images/mq_campus_map.png',
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
