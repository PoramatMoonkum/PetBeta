import 'package:flutter/material.dart';
import 'package:pettakecare/view/card/card.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(media.width * 0.2),
                ),
                child: Center(
                  child: Text(
                    "แจ้งเตือน",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              PetSitterCard(
                imageUrl: 'https://www.google.com/search?sca_esv=ce5211ae4c407a08&sca_upv=1&q=cat&uds=ADvngMhum2KpuLWKZLPgcW2PAu-93I3xSYCbV07vKNjdocA6hPAcsXoeYigTKfmM_80-UXGLr1mXNlCtIGX8a99NmvoW0yn0wn46bA6ooi1Owt7SYztM5PfCKR2eMcd1j6ddE-LLmhCKPxQ4rLKiyDex9ZJpibFbR7JTAZWlNVmFlRO0KCagrihSwLSBPTCwmwFGxthnvXNUQrFN9HWKrAgXCe3cmztDZF-kDcn-4RPuwKfETlHi2RM3GAuH7dLhIaoQRi2GxtoU4e2mY5cqAFjl2CeesuipgA&udm=2&prmd=ivsnmbtz&sa=X&ved=2ahUKEwiChu-7nP2FAxXyZmwGHbPPBfwQtKgLegQIDRAB&biw=1488&bih=742&dpr=1.25#vhid=Wt17bybNg2aFGM&vssid=mosaic',
                name: 'John Doe',
                description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                onAcceptChanged: (accepted) {
                  if (accepted) {
                    // กระทำเมื่อตกลง
                  } else {
                    // กระทำเมื่อปฏิเสธ
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
