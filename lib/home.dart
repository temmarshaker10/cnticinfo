import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import 'layout/layoutCubit.dart';
import 'layout/layoutStates.dart';

class home extends StatelessWidget {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<layoutCubit, layoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          layoutCubit cubit = layoutCubit.get(context);
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
                  SizedBox(height: 35,),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'مرحبا بكم👋 ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text(
                          'المنصة تحتوي على حلول',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'انية لمواد الاعلام الالي',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  module('PL','Programmation Lineaire', () {cubit.changeScreen(1); }),
                  module('SM', 'Structure Machine', () { cubit.changeScreen(2); }),
                  module('PS', 'Probabilité Statistique', () { cubit.changeScreen(3); }),
                  SizedBox(height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '© 2024 Copyright : ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                      InkWell(
                        onTap: () {
                          launchURL('https://linktr.ee/cntic.club');
                        },
                        child: Text(
                          'CNTIC',
                          style: TextStyle(
                              color: HexColor('#2e68b2'),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          );
        }

    );

  }
  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget module(String subName,String Name,void Function()? onTap){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 160,
        width: 235,
        child: InkWell(
          onTap: onTap,
          child: Card(
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      subName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),),
                  ),
                  margin: EdgeInsets.only(left: 70,right: 70,top: 20,bottom: 25),
                  color: HexColor('#2e68b2'),
                ),
                Padding(
                  padding:  EdgeInsets.only(
                      right: 10,left: 10,bottom: 10
                  ),
                  child: Text(
                    Name,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}