import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  final VoidCallback callback;
  const RefreshButton({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Please check your internet conection \n and them tap to refresh',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          IconButton(
            onPressed: callback,
            icon: const Icon(Icons.refresh, size: 48),
          )
        ],
      ),
    );
  }
}
