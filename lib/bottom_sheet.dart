import 'package:flutter/material.dart';
import 'package:get/get.dart';

void openBottomSheet() {
  Get.bottomSheet(
    Column(
      children: [
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'Bottom Sheet',
            style: TextStyle(fontSize: 18),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Close'),
        ),
      ],
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

class DropDownController extends GetxController {
  var dropdownValue = "Java".obs;

  setValue(String x) {
    dropdownValue.value = x;
  }

  getValue() => dropdownValue.value;
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void openBottomSheet() {
    String? gender = "New"; //no radio button will be selected on initial
    var chosenValue = "--Select State--";
    String dropdownValue = '--Select City--';

    Get.bottomSheet(
      Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 15.0, top: 25, bottom: 10),
            child: const Text(
              "Sort By",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          ///
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    RadioListTile(
                      title: Text("New"),
                      value: "New",
                      groupValue: gender,
                      onChanged: (value) {},
                    ),
                    RadioListTile(
                      title: Text("Nearby"),
                      value: "Nearby",
                      groupValue: gender,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    RadioListTile(
                      title: Text("Popularity"),
                      value: "Popularity",
                      groupValue: gender,
                      onChanged: (value) {},
                    ),
                    RadioListTile(
                      title: Text("Verified"),
                      value: "Verified",
                      groupValue: gender,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ],
          ),

          ///
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 15.0, top: 25, bottom: 10),
            child: const Text(
              "Location",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          ///

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 100,
                width: 150,
                // padding: const EdgeInsets.all(30.0),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white, width: 0), //<-- SEE HERE
                    ),
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderSide: BorderSide.none,
                    ),
                  ),
                  value: chosenValue,
                  isExpanded: false,
                  isDense: true,
                  onChanged: (String? newValue) {},
                  items: <String>['--Select State--', 'Cat', 'Tiger', 'Lion']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 100,
                width: 150,
                // padding: const EdgeInsets.all(30.0),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white, width: 0), //<-- SEE HERE
                    ),
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderSide: BorderSide.none,
                    ),
                  ),
                  value: dropdownValue,
                  isExpanded: false,
                  isDense: true,
                  onChanged: (String? newValue) {},
                  items: <String>['--Select City--', 'Cat', 'Tiger', 'Lion']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BottomSheet"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bottom sheet example'),
            OutlinedButton(
              onPressed: openBottomSheet,
              child: const Text('Open'),
            )
          ],
        ),
      ),
    );
  }
}
