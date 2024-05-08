import 'package:flutter/material.dart';
import 'package:pettakecare/common_widget/round_button.dart';
import 'package:pettakecare/common_widget/round_textfield.dart';
import 'package:pettakecare/view/pay_view/pay_view.dart';

class PetOwnerView extends StatefulWidget {
  const PetOwnerView({Key? key}) : super(key: key);

  @override
  State<PetOwnerView> createState() => _PetOwnerViewState();
}

class _PetOwnerViewState extends State<PetOwnerView> {
  TextEditingController txtSearch = TextEditingController();

  List<String> selectedTags = [];

  int depositDays = 0;

  bool isHomeCareSelected = true;

  void incrementDepositDays() {
    setState(() {
      depositDays++;
    });
  }

  void decrementDepositDays() {
    setState(() {
      if (depositDays > 0) {
        depositDays--;
      }
    });
  }

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
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(media.width * 0.2),
                ),
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfield(
                  hintText: "รายการ :",
                  controller: txtSearch,
                  left: Container(
                    alignment: Alignment.center,
                    width: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfield(
                  hintText: "ชื่อ :",
                  controller: txtSearch,
                  left: Container(
                    alignment: Alignment.center,
                    width: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(media.width * 0.2),
                ),
                child: Center(
                  child: Text(
                    "แท็กสื่อที่ต้องการ",
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
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: <Widget>[
                  ChoiceChip(
                    label: Text('แมว'),
                    selected: selectedTags.contains('แมว'),
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedTags.add('แมว');
                        } else {
                          selectedTags.remove('แมว');
                        }
                      });
                    },
                    selectedColor: Colors.green,
                    labelStyle: TextStyle(
                      color: selectedTags.contains('แมว')
                          ? Colors.black
                          : Colors.white,
                    ),
                    backgroundColor: selectedTags.contains('แมว')
                        ? Colors.white
                        : Colors.green,
                  ),
                  ChoiceChip(
                    label: Text('หมา'),
                    selected: selectedTags.contains('หมา'),
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedTags.add('หมา');
                        } else {
                          selectedTags.remove('หมา');
                        }
                      });
                    },
                    selectedColor: Colors.green,
                    labelStyle: TextStyle(
                      color: selectedTags.contains('หมา')
                          ? Colors.black
                          : Colors.white,
                    ),
                    backgroundColor: selectedTags.contains('หมา')
                        ? Colors.white
                        : Colors.green,
                  ),
                  ChoiceChip(
                    label: Text('คอนโดแมว'),
                    selected: selectedTags.contains('คอนโดแมว'),
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedTags.add('คอนโดแมว');
                        } else {
                          selectedTags.remove('คอนโดแมว');
                        }
                      });
                    },
                    selectedColor: Colors.green,
                    labelStyle: TextStyle(
                      color: selectedTags.contains('คอนโดแมว')
                          ? Colors.black
                          : Colors.white,
                    ),
                    backgroundColor: selectedTags.contains('คอนโดแมว')
                        ? Colors.white
                        : Colors.green,
                  ),
                  ChoiceChip(
                    label: Text('น้ำพุแมว'),
                    selected: selectedTags.contains('น้ำพุแมว'),
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedTags.add('น้ำพุแมว');
                        } else {
                          selectedTags.remove('น้ำพุแมว');
                        }
                      });
                    },
                    selectedColor: Colors.green,
                    labelStyle: TextStyle(
                      color: selectedTags.contains('น้ำพุแมว')
                          ? Colors.black
                          : Colors.white,
                    ),
                    backgroundColor: selectedTags.contains('น้ำพุแมว')
                        ? Colors.white
                        : Colors.green,
                  ),
                  ChoiceChip(
                    label: Text('พื้นที่สำหรับหมา'),
                    selected: selectedTags.contains('พื้นที่สำหรับหมา'),
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedTags.add('พื้นที่สำหรับหมา');
                        } else {
                          selectedTags.remove('พื้นที่สำหรับหมา');
                        }
                      });
                    },
                    selectedColor: Colors.green,
                    labelStyle: TextStyle(
                      color: selectedTags.contains('พื้นที่สำหรับหมา')
                          ? Colors.black
                          : Colors.white,
                    ),
                    backgroundColor: selectedTags.contains('พื้นที่สำหรับหมา')
                        ? Colors.white
                        : Colors.green,
                  ),
                  ChoiceChip(
                    label: Text('หอพัก'),
                    selected: selectedTags.contains('หอพัก'),
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedTags.add('หอพัก');
                        } else {
                          selectedTags.remove('หอพัก');
                        }
                      });
                    },
                    selectedColor: Colors.green,
                    labelStyle: TextStyle(
                      color: selectedTags.contains('หอพัก')
                          ? Colors.black
                          : Colors.white,
                    ),
                    backgroundColor: selectedTags.contains('หอพัก')
                        ? Colors.white
                        : Colors.green,
                  ),
                   ChoiceChip(
                    label: Text('บ้าน'),
                    selected: selectedTags.contains('บ้าน'),
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedTags.add('บ้าน');
                        } else {
                          selectedTags.remove('บ้าน');
                        }
                      });
                    },
                    selectedColor: Colors.green,
                    labelStyle: TextStyle(
                      color: selectedTags.contains('บ้าน')
                          ? Colors.black
                          : Colors.white,
                    ),
                    backgroundColor: selectedTags.contains('บ้าน')
                        ? Colors.white
                        : Colors.green,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'ฝากกี่วัน: $depositDays',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: incrementDepositDays,
                    child: Icon(Icons.add),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: decrementDepositDays,
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isHomeCareSelected = true; // กำหนดให้เลือก "ดูแลที่บ้าน"
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: isHomeCareSelected ? Colors.green : Colors.grey,
                    ),
                    child: Text('ดูแลที่บ้าน'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isHomeCareSelected = false; // กำหนดให้เลือก "ฝากผู้ดูแล"
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: !isHomeCareSelected ? Colors.green : Colors.grey,
                    ),
                    child: Text('ฝากผู้ดูแล'),
                  ),
                ],
              ),
              RoundButton(title: "ค้นหาผู้รับฝาก", onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyOrderView(),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
