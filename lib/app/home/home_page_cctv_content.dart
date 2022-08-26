import 'package:flutter/material.dart';

class Cctv extends StatelessWidget {
  const Cctv({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('this page will allow you to watch your'),
          Text('ip webcams in the future')
        ],
      ),
    );
  }
}
