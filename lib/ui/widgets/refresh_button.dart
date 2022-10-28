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
 //           'Please check your internet conection \n and them tap to refresh',
            'Por favor comprueba tu conexión a internet\n pulsa el botón para recargar',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          IconButton(
            onPressed: callback,
            icon: Icon(Icons.refresh, size: 48 , color: Theme.of(context).primaryColor,),
          )
        ],
      ),
    );
  }
}
