import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class poisson extends StatefulWidget {
  @override
  State<poisson> createState() => _poissonState();
}

class _poissonState extends State<poisson> {
  @override
  void initState() {
    super.initState();
  }

  double? result;
  TextEditingController nbrTrialsController = TextEditingController();
  TextEditingController nbrAVGController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#2e68b2'),
        centerTitle: true,
        title: Text(
          'Poisson',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                '''P(X = k) = (λ^k * e^(-λ)) / k!

E(X) = λ

V(X) = λ ''',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 150,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: nbrAVGController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('example : 0.6'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'متوسط معدل الحدوث(lambda)',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 150,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: nbrTrialsController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('example :10'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      ' (k)عدد الأحداث',
                      maxLines: 1,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: HexColor('#2e68b2'),
                    borderRadius: BorderRadius.circular(10)),
                width: 200,
                child: TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text(
                    "Calculate",
                    softWrap: true,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              if (nbrAVGController.text.length != 0)
                if (double.tryParse(nbrAVGController.text) is num)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.green[400],
                          borderRadius: BorderRadius.circular(10)),
                      width: 200,
                      child: Text(
                        'V(X) = ${nbrAVGController.text.toString()}',
                        softWrap: true,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              if (nbrAVGController.text.length != 0)
                if (double.tryParse(nbrAVGController.text) is num)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.green[400],
                          borderRadius: BorderRadius.circular(10)),
                      width: 200,
                      child: Text(
                        'E(X) = ${nbrAVGController.text.toString()}',
                        softWrap: true,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              if (nbrAVGController.text.length != 0 &&
                  nbrTrialsController.text.length != 0)
                if (double.tryParse(nbrAVGController.text) is num &&
                    double.tryParse(nbrTrialsController.text) is num)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.green[400],
                          borderRadius: BorderRadius.circular(10)),
                      width: 250,
                      child: Text(
                        'P(X=${int.parse(nbrTrialsController.text)}) = ${poissonProbability(int.parse(nbrTrialsController.text), double.parse(nbrAVGController.text)).toString()}',
                        softWrap: true,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              SizedBox(
                height: 50,
              ),
              Text(
                '''توزيع بواسون واحتمالاته بالعربية
توزيع بواسون (Poisson Distribution) هو توزيع احتمالي يستخدم لوصف عدد الأحداث التي تقع خلال فترة زمنية معينة أو على مساحة معينة، وذلك بشرط أن تكون هذه الأحداث مستقلة عن بعضها البعض ومتفرقة الحدوث.
بمعنى آخر، إن توزيع بواسون مفيد لحساب احتمالية وقوع عدد معين من الأحداث خلال فترة زمنية محددة، مع العلم أن هذه الأحداث نادرة الحدوث ومستقلة تماما.
على سبيل المثال، يمكن استخدام توزيع بواسون لحساب احتمالية ورود مكالمات هاتفية معينة إلى مركز اتصال خلال ساعة، أو احتمالية ظهور عيوب معينة في كل متر مربع من القماش المصنع.
صيغة توزيع بواسون
الاحتمال (P(x)) لوقوع (x) حدث خلال فترة زمنية معينة باستخدام توزيع بواسون يعطى بالصيغة التالية:
P(x) = (e^-λ * λ^x) / x!
حيث
    λ (lambda) هي قيمة متوسط عدد الأحداث المتوقع حدوثها خلال الفترة الزمنية.
    e هو ثابت إEuler يساوي تقريبا 2.71828.
    x هو عدد الأحداث التي نريد حساب احتمالية وقوعها (x = 0, 1, 2, 3, ...).
    x! (x factorial) هو مضروب الأعداد الصحيحة الموجبة من 1 حتى x (مثلا: 3! = 3 * 2 * 1).
أمثلة على توزيع بواسون
لنفترض أن متوسط عدد المكالمات الواردة إلى مركز اتصال في دقيقة واحدة هو 2. نريد حساب احتمال ورود مكالمتين خلال دقيقة.
باستخدام صيغة توزيع بواسون:
    λ = 2 (متوسط المكالمات بالدقيقة)
    x = 2 (عدد المكالمات التي نحسب احتمالها)
P(2) = (e^-2 * 2^2) / 2! = (e^-2 * 4) / 2 = 0.1353 (احتمال تقريبي)
إذن، هناك احتمال تقريبي بنسبة 13.53% لورود مكالمتين خلال دقيقة واحدة في مركز الاتصال.
    ''',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double poissonProbability(int k, double lambda) {
    return (exp(-lambda) * pow(lambda, k)) / factorial(k);
  }

  int factorial(int n) {
    if (n <= 0) return 1;
    int result = 1;
    for (int i = 1; i <= n; i++) {
      result *= i;
    }
    return result;
  }
}
