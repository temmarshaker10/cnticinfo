import 'package:cnticinfo/cache_helper.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PL_page extends StatefulWidget {
  @override
  State<PL_page> createState() => _PL_pageState();
}

class _PL_pageState extends State<PL_page> {
  @override
  void initState() {
    super.initState();
    addCont = cachHelper.get(key: 'addCont');
    String? x, x1, x2, x3, x4, x5, y, y1, y2, y3, y4, y5, z, z1, z2, z3, z4, z5;
    x = cachHelper.get(key: 'x');
    x1 = cachHelper.get(key: 'x1');
    x2 = cachHelper.get(key: 'x2');
    x3 = cachHelper.get(key: 'x3');
    x4 = cachHelper.get(key: 'x4');
    x5 = cachHelper.get(key: 'x5');
    y = cachHelper.get(key: 'y');
    y1 = cachHelper.get(key: 'y1');
    y2 = cachHelper.get(key: 'y2');
    y3 = cachHelper.get(key: 'y3');
    y4 = cachHelper.get(key: 'y4');
    y5 = cachHelper.get(key: 'y5');
    z = cachHelper.get(key: 'z');
    z1 = cachHelper.get(key: 'z1');
    z2 = cachHelper.get(key: 'z2');
    z3 = cachHelper.get(key: 'z3');
    z4 = cachHelper.get(key: 'z4');
    z5 = cachHelper.get(key: 'z5');
    if (x != null) xController.text = x;
    if (x1 != null) x1Controller!.text = x1;
    if (x2 != null) x2Controller.text = x2;
    if (x3 != null) x3Controller.text = x3;
    if (x4 != null) x4Controller.text = x4;
    if (x5 != null) x5Controller.text = x5;
    if (y != null) yController.text = y;
    if (y1 != null) y1Controller!.text = y1;
    if (y2 != null) y2Controller.text = y2;
    if (y3 != null) y3Controller.text = y3;
    if (y4 != null) y4Controller.text = y4;
    if (y5 != null) y5Controller.text = y5;
    if (z != null) zController.text = z;
    if (z1 != null) z1Controller!.text = z1;
    if (z2 != null) z2Controller.text = z2;
    if (z3 != null) z3Controller.text = z3;
    if (z4 != null) z4Controller.text = z4;
    if (z5 != null) z5Controller.text = z5;
    if (addCont == null) addCont = 0;
  }

  String? strX1;
  TextEditingController zController = TextEditingController();
  TextEditingController xController = TextEditingController();
  TextEditingController yController = TextEditingController();
//////////////////////////////////////////////////////////////////
  TextEditingController? x1Controller = TextEditingController();
  TextEditingController x2Controller = TextEditingController();
  TextEditingController x3Controller = TextEditingController();
  TextEditingController x4Controller = TextEditingController();
  TextEditingController x5Controller = TextEditingController();
  TextEditingController x6Controller = TextEditingController();
  TextEditingController? y1Controller = TextEditingController();
  TextEditingController y2Controller = TextEditingController();
  TextEditingController y3Controller = TextEditingController();
  TextEditingController y4Controller = TextEditingController();
  TextEditingController y5Controller = TextEditingController();
  TextEditingController y6Controller = TextEditingController();
  TextEditingController? z1Controller = TextEditingController();
  TextEditingController z2Controller = TextEditingController();
  TextEditingController z3Controller = TextEditingController();
  TextEditingController z4Controller = TextEditingController();
  TextEditingController z5Controller = TextEditingController();
  int navColorWhite = 0;
  int? addCont;
  double? result = 0;
  bool bigThan1 = false;
  bool bigThan2 = false;
  bool bigThan3 = false;
  bool bigThan4 = false;
  bool bigThan5 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // dont stack with status bar of system
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///logo:
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

            ///title module
            Container(
              decoration: BoxDecoration(
                  color: HexColor('#2e68b2'),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 18),
              child: Text(
                "Programmation Linéaire",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),

            ///text objectif
            Text(
              "Fonction Objectif:",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10,
            ),

            ///form z=
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                letter('Z', HexColor('#2e68b2')),
                SizedBox(
                  width: 12,
                ),
                letter('=', HexColor('#2e68b2')),
                SizedBox(
                  width: 12,
                ),
                myTextFormField(xController, "x"),
                letter('X', HexColor('#2e68b2')),
                SizedBox(
                  width: 20,
                ),
                letter('+', HexColor('#2e68b2')),
                SizedBox(
                  width: 20,
                ),
                myTextFormField(yController, "y"),
                SizedBox(
                  width: 2,
                ),
                letter('Y', HexColor('#2e68b2')),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            ///text contrait
            Text(
              "Les Contraints:",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10,
            ),
            formContraint(
              xController: x1Controller!,
              yController: y1Controller!,
              zController: z1Controller!,
              id: 1,
              keyX: 'x1',
              keyY: 'y1',
              keyZ: 'z1',
            ),
            if (addCont! > 0)
              formContraint(
                xController: x2Controller,
                yController: y2Controller,
                zController: z2Controller,
                id: 2,
                keyX: 'x2',
                keyY: 'y2',
                keyZ: 'z2',
              ),
            if (addCont! > 1)
              formContraint(
                xController: x3Controller,
                yController: y3Controller,
                zController: z3Controller,
                id: 3,
                keyX: 'x3',
                keyY: 'y3',
                keyZ: 'z3',
              ),
            if (addCont! > 2)
              formContraint(
                xController: x4Controller,
                yController: y4Controller,
                zController: z4Controller,
                id: 4,
                keyX: 'x4',
                keyY: 'y4',
                keyZ: 'z4',
              ),
            if (addCont! > 3)
              formContraint(
                xController: x5Controller,
                yController: y5Controller,
                zController: z5Controller,
                id: 5,
                keyX: 'x5',
                keyY: 'y5',
                keyZ: 'z5',
              ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.green,
                  child: TextButton(
                      onPressed: () async {
                        print(addCont!);
                        addCont = addCont! >= 4 ? 4 : addCont! + 1;
                        await cachHelper.saveData(
                            key: 'addCont', value: addCont!);
                        setState(() {});
                      },
                      child: Text(
                        'ADD',
                        style: letterStyle().copyWith(color: Colors.black),
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  color: Colors.red,
                  child: TextButton(
                      onPressed: () async {
                        addCont = addCont! == 0 ? 0 : addCont! - 1;
                        await cachHelper.saveData(
                            key: 'addCont', value: addCont!);
                        setState(() {});
                      },
                      child: Text(
                        'DELETE',
                        style: letterStyle().copyWith(color: Colors.black),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 500,
                      height: 500,
                      child: LineChart(
                        LineChartData(
                          minX: 0,
                          maxX: 25,
                          minY: 0,
                          maxY: 25,
                          lineBarsData: [
                            if (isNumber(x1Controller!.text) &&
                                isNumber(y1Controller!.text) &&
                                isNumber(z1Controller!.text))
                              LineChartBarData(
                                spots: [
                                  FlSpot(
                                      0,
                                      f(
                                          a: double.parse(
                                              x1Controller!.text.toString()),
                                          x: 0,
                                          b: double.parse(
                                              y1Controller!.text.toString()),
                                          z: double.parse(
                                              z1Controller!.text.toString()))),
                                  FlSpot(
                                      100,
                                      f(
                                          a: double.parse(
                                              x1Controller!.text.toString()),
                                          x: 100,
                                          b: double.parse(
                                              y1Controller!.text.toString()),
                                          z: double.parse(
                                              z1Controller!.text.toString()))),
                                ],
                                isCurved: true,
                                color: Colors.blue,
                                barWidth: 4,
                                isStrokeCapRound: true,
                                belowBarData: BarAreaData(show: false),
                              ),
                            if (addCont! > 0 &&
                                isNumber(x2Controller!.text) &&
                                isNumber(y2Controller!.text) &&
                                isNumber(z2Controller!.text))
                              LineChartBarData(
                                spots: [
                                  FlSpot(
                                      0,
                                      f(
                                          a: double.parse(
                                              x2Controller!.text.toString()),
                                          x: 0,
                                          b: double.parse(
                                              y2Controller!.text.toString()),
                                          z: double.parse(
                                              z2Controller!.text.toString()))),
                                  FlSpot(
                                      100,
                                      f(
                                          a: double.parse(
                                              x2Controller!.text.toString()),
                                          x: 100,
                                          b: double.parse(
                                              y2Controller!.text.toString()),
                                          z: double.parse(
                                              z2Controller!.text.toString()))),
                                ],
                                isCurved: true,
                                color: Colors.blue,
                                barWidth: 4,
                                isStrokeCapRound: true,
                                belowBarData: BarAreaData(show: false),
                              ),
                            if (addCont! > 1 &&
                                isNumber(x3Controller!.text) &&
                                isNumber(y3Controller!.text) &&
                                isNumber(z3Controller!.text))
                              LineChartBarData(
                                spots: [
                                  FlSpot(
                                      0,
                                      f(
                                          a: double.parse(
                                              x3Controller!.text.toString()),
                                          x: 0,
                                          b: double.parse(
                                              y3Controller!.text.toString()),
                                          z: double.parse(
                                              z3Controller!.text.toString()))),
                                  FlSpot(
                                      100,
                                      f(
                                          a: double.parse(
                                              x3Controller!.text.toString()),
                                          x: 100,
                                          b: double.parse(
                                              y3Controller!.text.toString()),
                                          z: double.parse(
                                              z3Controller!.text.toString()))),
                                ],
                                isCurved: true,
                                color: Colors.blue,
                                barWidth: 4,
                                isStrokeCapRound: true,
                                belowBarData: BarAreaData(show: false),
                              ),
                            if (addCont! > 2 &&
                                isNumber(x4Controller!.text) &&
                                isNumber(y4Controller!.text) &&
                                isNumber(z4Controller!.text))
                              LineChartBarData(
                                spots: [
                                  FlSpot(
                                      0,
                                      f(
                                          a: double.parse(
                                              x4Controller!.text.toString()),
                                          x: 0,
                                          b: double.parse(
                                              y4Controller!.text.toString()),
                                          z: double.parse(
                                              z4Controller!.text.toString()))),
                                  FlSpot(
                                      100,
                                      f(
                                          a: double.parse(
                                              x4Controller!.text.toString()),
                                          x: 100,
                                          b: double.parse(
                                              y4Controller!.text.toString()),
                                          z: double.parse(
                                              z4Controller!.text.toString()))),
                                ],
                                isCurved: true,
                                color: Colors.blue,
                                barWidth: 4,
                                isStrokeCapRound: true,
                                belowBarData: BarAreaData(show: false),
                              ),
                            if (addCont! > 3 &&
                                isNumber(x5Controller!.text) &&
                                isNumber(y5Controller!.text) &&
                                isNumber(z5Controller!.text))
                              LineChartBarData(
                                spots: [
                                  FlSpot(
                                      0,
                                      f(
                                          a: double.parse(
                                              x5Controller!.text.toString()),
                                          x: 0,
                                          b: double.parse(
                                              y5Controller!.text.toString()),
                                          z: double.parse(
                                              z5Controller!.text.toString()))),
                                  FlSpot(
                                      100,
                                      f(
                                          a: double.parse(
                                              x5Controller!.text.toString()),
                                          x: 100,
                                          b: double.parse(
                                              y5Controller!.text.toString()),
                                          z: double.parse(
                                              z5Controller!.text.toString()))),
                                ],
                                isCurved: true,
                                color: Colors.blue,
                                barWidth: 4,
                                isStrokeCapRound: true,
                                belowBarData: BarAreaData(show: false),
                              ),
                          ],
                          titlesData: FlTitlesData(
                            show: true,
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                                //getTitlesWidget: leftTitleWidgets,
                              ),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                                //getTitlesWidget: leftTitleWidgets,
                              ),
                            ),
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(color: Colors.grey),
                          ),
                          gridData: FlGridData(show: true),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isNumber(String str) {
    if (str == null) {
      return false;
    }
    final number = double.tryParse(str);
    return number != null;
  }

  Widget letter(String text, Color color) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: color),
    );
  }

  Widget formContraint({
    required TextEditingController xController,
    required TextEditingController yController,
    required TextEditingController zController,
    required int id,
    required String keyX,
    required String keyY,
    required String keyZ,
  }) {
    bool bigThan = false;
    if (id == 1) bigThan = bigThan1;
    if (id == 2) bigThan = bigThan2;
    if (id == 3) bigThan = bigThan3;
    if (id == 4) bigThan = bigThan4;
    if (id == 5) bigThan = bigThan5;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 10,
        ),
        myTextFormField(xController, keyX),
        letter('X', HexColor('#2e68b2')),
        Spacer(),
        letter('+', HexColor('#2e68b2')),
        Spacer(),
        myTextFormField(yController, keyY),
        SizedBox(
          width: 2,
        ),
        letter('Y', HexColor('#2e68b2')),
        Spacer(),
        TextButton(
            onPressed: () {
              //bigThan = !bigThan ;
              setState(() {
                if (id == 1) bigThan1 = !bigThan1;
                if (id == 2) bigThan2 = !bigThan2;
                if (id == 3) bigThan3 = !bigThan3;
                if (id == 4) bigThan4 = !bigThan4;
                if (id == 5) bigThan5 = !bigThan5;
              });
            },
            child: letter(bigThan ? '>=' : '<=', HexColor('#2e68b2'))),
        Spacer(),
        myTextFormField(zController, keyZ),
        Spacer(),
      ],
    );
  }

  double f({
    required double a,
    required double x,
    required double z,
    required double b,
  }) {
    return -a / b * x + z / b;
  }

  Widget myTextFormField(TextEditingController controller, String key) {
    return Container(
      width: 60,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: const Color.fromARGB(255, 192, 191, 191)),
      child: TextField(
        maxLength: 6,
        onChanged: (String? value) {
          if (key == 'x')
            cachHelper.saveData(key: 'x', value: xController.text);
          if (key == 'x1')
            cachHelper.saveData(key: 'x1', value: x1Controller!.text);
          if (key == 'x2')
            cachHelper.saveData(key: 'x2', value: x2Controller!.text);
          if (key == 'x3')
            cachHelper.saveData(key: 'x3', value: x3Controller!.text);
          if (key == 'x4')
            cachHelper.saveData(key: 'x4', value: x4Controller!.text);
          if (key == 'x5')
            cachHelper.saveData(key: 'x5', value: x5Controller!.text);
          if (key == 'y')
            cachHelper.saveData(key: 'y', value: yController!.text);
          if (key == 'y1')
            cachHelper.saveData(key: 'y1', value: y1Controller!.text);
          if (key == 'y2')
            cachHelper.saveData(key: 'y2', value: y2Controller!.text);
          if (key == 'y3')
            cachHelper.saveData(key: 'y3', value: y3Controller!.text);
          if (key == 'y4')
            cachHelper.saveData(key: 'y4', value: y4Controller!.text);
          if (key == 'y5')
            cachHelper.saveData(key: 'y5', value: y5Controller!.text);
          if (key == 'z')
            cachHelper.saveData(key: 'z', value: zController!.text);
          if (key == 'z1')
            cachHelper.saveData(key: 'z1', value: z1Controller!.text);
          if (key == 'z2')
            cachHelper.saveData(key: 'z2', value: z2Controller!.text);
          if (key == 'z3')
            cachHelper.saveData(key: 'z3', value: z3Controller!.text);
          if (key == 'z4')
            cachHelper.saveData(key: 'z4', value: z4Controller!.text);
          if (key == 'z5')
            cachHelper.saveData(key: 'z5', value: z5Controller!.text);

          setState(() {});
        },
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Empty",
          counterText: "", // Setting the counterText to empty string
        ),
      ),
    );
  }

  TextStyle letterStyle() {
    return TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  }
}
