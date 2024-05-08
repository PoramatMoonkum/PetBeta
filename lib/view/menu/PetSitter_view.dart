import 'package:flutter/material.dart';

class PetSitterView extends StatefulWidget {
  const PetSitterView({Key? key}) : super(key: key);

  @override
  State<PetSitterView> createState() => _MenuViewState();
}

class _MenuViewState extends State<PetSitterView> {
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