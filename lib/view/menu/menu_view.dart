import 'package:flutter/material.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
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
              SizedBox(height: 20), // เพิ่มระยะห่าง
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: media.width * 0.4,
                    height: media.width * 0.4,
                    color: Colors.blue,
                    margin: EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        "ผู้รับฝาก",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: media.width * 0.4,
                    height: media.width * 0.4,
                    color: Colors.red,
                    margin: EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        "เจ้าของสัตว์เลี้ยง",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MenuView(),
  ));
}
