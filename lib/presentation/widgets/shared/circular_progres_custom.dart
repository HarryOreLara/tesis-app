import 'package:flutter/material.dart';



class CustomCircularProgres extends StatelessWidget {
  const CustomCircularProgres({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 10.0,
          ),
          Text("Cargando..")
        ],
      ),
    );
  }
}