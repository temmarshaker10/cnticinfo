import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class bernouli extends StatefulWidget {
  @override
  State<bernouli> createState() => _bernouliState();
}

class _bernouliState extends State<bernouli> {
  @override
  void initState() {
    super.initState();
  }

  double? result;
  TextEditingController nbrTrialsController = TextEditingController();
  TextEditingController nbrProbabilityController = TextEditingController();
  TextEditingController nbrSuccessController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#2e68b2'),
        centerTitle: true,
        title: Text(
          'Bernouli',
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
                '''P(X = x) = p^x * (1 - p)^(1 - x)
E(X) = p
V(X) = p * (1 - p) ''',
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
                      controller: nbrProbabilityController,
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
                      '[0...1]نسبة النجاح في كل محاولة(p)',
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
                      ' (n)عدد المحاولات',
                      maxLines: 1,
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
                      controller: nbrSuccessController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('example : 2 '),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'عدد النجاحات المطلوب (k)',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
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
                    int success = int.parse(nbrSuccessController.text);
                    int tri = int.parse(nbrTrialsController.text);
                    double pro = double.parse(nbrProbabilityController.text);
                    if (success <= tri &&
                        pro > 0 &&
                        pro < 1 &&
                        tri < 20 &&
                        tri > 0)
                      bernouli(
                          nbrTrial: tri, nbrProba: pro, nbrSuccess: success);
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
                height: 50,
              ),
              if (result != null)
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(10)),
                  width: 200,
                  child: Text(
                    'P = ${result!.toString().substring(0, 6)}',
                    softWrap: true,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              SizedBox(
                height: 15,
              ),
              if (nbrProbabilityController.text.length != 0)
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(10)),
                  width: 200,
                  child: Text(
                    'V(x) = ${variance(double.parse(nbrProbabilityController.text)).toString().substring(0, 3)}',
                    softWrap: true,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              SizedBox(
                height: 15,
              ),
              if (nbrProbabilityController.text.length != 0)
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(10)),
                  width: 200,
                  child: Text(
                    'E(x) = ${nbrProbabilityController.text.toString().substring(0, 3)}',
                    softWrap: true,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              SizedBox(
                height: 50,
              ),
              Text(
                '''
                 توزيع برنولي هو دالة احتمالية تصف نتيجة تجربة برنولي. يأخذ التوزيع قيمة احتمال وحيدة بين 0 و 1 تمثل احتمال النجاح في التجربة.
    على سبيل المثال، إذا كان احتمال خروج وجه عند رمي عملة معدنية 0.6، فإن توزيع برنولي الخاص به سيكون له دالة احتمالية تعطينا احتمال 0.6 للنجاح (وجه) واحتمال 0.4 للفشل (ظهر).
    استخدامات توزيع برنولي (استخدامات توزيع برنولي)
    تستخدم توزيعات برنولي في العديد من المجالات، بما في ذلك:
    التجارب الطبية: دراسة فعالية الأدوية الجديدة، حيث يمثل النجاح شفاء المريض والفشل عدم الشفاء.
    التحكم بالجودة: فحص المنتجات للكشف عن العيوب، حيث يمثل النجاح اجتياز المنتج للفحص والفشل عدم اجتيازه.
    العاب الحظ: تحليل احتمالات الفوز والخسارة في ألعاب مثل الروليت أو اليانصيب.
    ''',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateProbability(int n, double p, int k) {
    // Calculate the binomial coefficient (n choose k)
    print(n);
    print(p);
    print(k);
    //the error
    try {
      int binomialCoefficient =
          factorial(n) ~/ (factorial(k) * factorial(n - k));
    } catch (e) {
      result = 404;
      rethrow; // Allow callers to see the exception.
    }
    int binomialCoefficient = factorial(n) ~/ (factorial(k) * factorial(n - k));

    // Calculate the probability using the binomial distribution formula
    double probability = double.parse(
        (binomialCoefficient * pow(p, k) * pow(1 - p, n - k)).toString());

    return probability;
  }

  int factorial(int n) {
    if (n <= 1) {
      return 1;
    } else {
      return n * factorial(n - 1);
    }
  }

  void bernouli({
    required int nbrTrial,
    required double nbrProba,
    required int nbrSuccess,
  }) {
    try {
      double probability = calculateProbability(nbrTrial, nbrProba, nbrSuccess);
      result = probability;
    } catch (e) {
      result = 404;
      rethrow; // Allow callers to see the exception.
    }

    //print('The probability of getting exactly $nbrSuccess heads in $nbrTrial flips is: $probability');
  }

  double variance(double p) {
    return p * (1 - p);
  }
}
