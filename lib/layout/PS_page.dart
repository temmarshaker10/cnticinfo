import 'package:cnticinfo/layout/ps_laws/bernouli.dart';
import 'package:cnticinfo/layout/ps_laws/binomial.dart';
import 'package:cnticinfo/layout/ps_laws/poisson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layoutCubit.dart';
import 'layoutStates.dart';

class PS_page extends StatefulWidget {
  @override
  State<PS_page> createState() => _PS_pageState();
}

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

class _PS_pageState extends State<PS_page> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<layoutCubit, layoutStates>(
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
                  Container(
                    decoration: BoxDecoration(
                        color: HexColor('#2e68b2'),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 18),
                    child: Text(
                      "Probabilité Statistique",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: InkWell(
                      onTap: () {
                        navigateTo(context, bernouli());
                      },
                      child: Card(
                        elevation: 15,
                        margin: EdgeInsets.all(15),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Bernouli',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 28,
                              ),
                              SizedBox(
                                width: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: InkWell(
                      onTap: () {
                        navigateTo(context, binomial());
                      },
                      child: Card(
                        elevation: 15,
                        margin: EdgeInsets.all(15),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Binomoial',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 28,
                              ),
                              SizedBox(
                                width: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: InkWell(
                      onTap: () {
                        navigateTo(context, poisson());
                      },
                      child: Card(
                        elevation: 15,
                        margin: EdgeInsets.all(15),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Poisson',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 28,
                              ),
                              SizedBox(
                                width: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
