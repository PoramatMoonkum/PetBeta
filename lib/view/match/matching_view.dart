import 'package:flutter/material.dart';

class MatchingView extends StatefulWidget {
  const MatchingView({Key? key}) : super(key: key);

  @override
  State<MatchingView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MatchingView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/app_logo.png",
                width: media.width * 0.55,
                height: media.width * 0.55,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
 
}
} 