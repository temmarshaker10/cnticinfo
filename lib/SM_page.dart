import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout/layoutCubit.dart';
import 'layout/layoutStates.dart';


class System_Machine extends StatefulWidget {
  @override
  _System_MachineState createState() => _System_MachineState();
}

class _System_MachineState extends State<System_Machine> {

  String selectedItem1 = "binary";
  String selectedItem2 = "decimal";
  String dropdownValue = 'One';
  TextEditingController ? outputController = TextEditingController();
  TextEditingController ? inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<layoutCubit, layoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          layoutCubit cubit = layoutCubit.get(context);
          outputController!.text = cubit.smResult!;
          return SafeArea(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // menu
                          width: 75,
                          height: 75,
                          child: Stack(
                            //alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                // blue touch
                                decoration: BoxDecoration(
                                    color: HexColor('#2e68b2'),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(180))),
                              ),
                              Builder(
                                builder: (context) => IconButton(
                                  onPressed: () {
                                    Scaffold.of(context).openDrawer();
                                    print('hyyyy');
                                  },
                                  icon: Icon(Icons.menu_rounded),
                                  iconSize: 52,
                                  color: HexColor('#f9fafb'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'INFO',
                              style: TextStyle(
                                  color: HexColor('#2e68b2'),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'SOLUTION',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 23,
                          ),
                          child: Image(
                            fit: BoxFit.fill,
                            width: 130,
                            height: 70,
                            image: AssetImage('assets/images/LOGO.png'),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: HexColor('#2e68b2'),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 18),
                      child: Text(
                        "Structure Machine",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Convarsation between numerical systems:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "recent systeme",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Text(
                            "transform to",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start,
                          ),
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton<String>(
                          value: selectedItem1,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedItem1 = newValue!;
                              print(" -------------- $selectedItem1");
                            });
                          },
                          items: <String>['binary', 'decimal','octal', 'hexadecimal']
                              .map<DropdownMenuItem<String>>((String value) {
                            print(value);
                                return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          ">",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        DropdownButton<String>(
                          value: selectedItem2,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedItem2 = newValue!;
                              print("-------------$selectedItem2");
                            });
                          },
                          items: <String>['binary', 'decimal','octal', 'hexadecimal']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                            }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 150,
                      height: 35,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 192, 191, 191)),
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: TextField(
                          controller: inputController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 10),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          if(inputController!.text.length == 0)
                            cubit.viderOutput();
                          if(selectedItem1 == 'binary'){
                            print("---1--------$selectedItem1");
                            if(selectedItem2 == 'decimal'){
                              cubit.binaryToDecimal(inputController!.text);
                              print(inputController!.text);
                              print("---2--------$selectedItem2");
                            }

                            if(selectedItem2 == 'hexadecimal')
                              cubit.binaryToHex(inputController!.text);
                            if(selectedItem2 == 'octal')
                              cubit.binaryToOctal(inputController!.text);

                          }
                          if(selectedItem1 == 'decimal'){
                            if(selectedItem2 == 'binary')
                              cubit.decimalToBinary(int.parse(inputController!.text));
                            if(selectedItem2 == 'hexadecimal')
                              cubit.decimalToHex(int.parse(inputController!.text));
                            if(selectedItem2 == 'octal')
                              cubit.decimalToOctal(int.parse(inputController!.text));
                          }
                          if(selectedItem1 == 'octal'){
                            if(selectedItem2 == 'binary')
                              cubit.octalToBinary(inputController!.text);
                            if(selectedItem2 == 'hexadecimal')
                              cubit.octalToHex(inputController!.text);
                            if(selectedItem2 == 'decimal')
                              cubit.octalToDecimal(inputController!.text);
                          }
                          if(selectedItem1 == 'hexadecimal'){
                            print(inputController!.text.length);
                            if(selectedItem2 == 'binary')
                              cubit.hexToBinary(inputController!.text);
                            if(selectedItem2 == 'octal')
                              cubit.hexToOctal(inputController!.text);
                            if(selectedItem2 == 'decimal')
                              cubit.hexToDecimal(inputController!.text);
                          }
                          },
                        child: Column(children: [
                          Text(
                            "Transformation ",
                            softWrap: true,
                            maxLines: 2,
                            style:
                            TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 150,
                      height: 35,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 192, 191, 191)),
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: TextField(
                          controller: outputController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 10),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                )
            ),
          );
        }

    );
  }
  bool isNumber(String str) {
    if (str == null) {
      return false;
    }
    final number = double.tryParse(str);
    return number != null;
  }
}