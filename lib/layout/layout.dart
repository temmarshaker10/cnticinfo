import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../PL_page.dart';
import 'layoutCubit.dart';
import 'layoutStates.dart';

class layout_page extends StatefulWidget {
  @override
  State<layout_page> createState() => _layout_pageState();
}

class _layout_pageState extends State<layout_page> {
  int navColorWhite = 0;
  int addCont = 0;
  double? result = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => layoutCubit(),
      child: BlocConsumer<layoutCubit, layoutStates>(
          listener: (context, state) {},
          builder: (context, state) {
            layoutCubit cubit = layoutCubit.get(context);
            return Scaffold(
              body: WillPopScope(
                  onWillPop: () async {
                    return false;
                  },
                  child: cubit.screens[cubit.indexScreen]),
              drawer: Center(
                child: Drawer(
                  width: 250,
                  backgroundColor: HexColor('#2e68b2'),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 165,
                      ),
                      InkWell(
                        onTap: () {
                          cubit.changeScreen(1);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(vertical: 18),
                            child: Text(
                              "Programmation Linéaire",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cubit.changeScreen(2);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(10),

                            ///margin: EdgeInsets.symmetric(vertical: 18),
                            child: Text(
                              "Structure Machine",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cubit.changeScreen(3);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(vertical: 18),
                            child: Text(
                              "Probabilité Statistique",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(120),
                    topLeft: Radius.circular(120),
                  ),
                  child: Container(
                    height: 100,
                    child: CurvedNavigationBar(
                      height: 55,
                      animationDuration: Duration(milliseconds: 550),
                      color: HexColor('#2e68b2'),
                      buttonBackgroundColor: HexColor('#f9fafb'),
                      backgroundColor: HexColor('#f9fafb'),
                      animationCurve: Curves.linear,
                      items: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'HOME',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: cubit.indexScreen == 0
                                    ? HexColor('#010208')
                                    : HexColor('#f9fafb')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'PL',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: cubit.indexScreen == 1
                                    ? HexColor('#010208')
                                    : HexColor('#f9fafb')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'SM',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: cubit.indexScreen == 2
                                    ? HexColor('#010208')
                                    : HexColor('#f9fafb')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'PS',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: cubit.indexScreen == 3
                                    ? HexColor('#010208')
                                    : HexColor('#f9fafb')),
                          ),
                        ),
                      ],
                      index: cubit.indexScreen,
                      onTap: (index) {
                        setState(() {
                          cubit.changeScreen(index);
                          navColorWhite = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget myTextFormField(TextEditingController controller) {
    return Container(
      width: 80,
      height: 50,
      decoration:
          BoxDecoration(color: const Color.fromARGB(255, 192, 191, 191)),
      child: TextField(
        maxLength: 6,
        onChanged: (String? value) {
          double? nbr = value != null ? double.parse(value) : null;
          result = nbr != null ? (result! + nbr) : result;
          print(result!);
        },
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter value (max 7 digits)",
          counterText: "", // Setting the counterText to empty string
        ),
      ),
    );
  }

  TextStyle letterStyle() {
    return TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  }
}

Widget sectionItem(
    {required String nameSection, required void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(3),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            nameSection,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
      ),
    ),
  );
}
