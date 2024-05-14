import 'package:flutter/material.dart';
import 'package:pettakecare/common_widget/notification.dart';

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
      appBar: AppBar(
        title: Text("Pet Sitter"),
        leading: BackButton(),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: const [NotificationBadge()],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/img/splash_bg.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          Image.asset(
            "assets/img/pr.jpg",
            width: media.width * 0.55,
            height: media.width * 0.55,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
