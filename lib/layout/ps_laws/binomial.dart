import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class binomial extends StatefulWidget {
  @override
  State<binomial> createState() => _binomialState();
}

class _binomialState extends State<binomial> {
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
          'Binomial',
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
                '''P(X = k) = (n choose k) * p^k * (1 - p)^(n-k)
E(X) = np
V(X) = np(1 - p) ''',
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
                    int tri = int.parse(nbrTrialsController.text);
                    double pro = double.parse(nbrProbabilityController.text);
                    int success = int.parse(nbrSuccessController.text);
                    if (tri <= 25 && pro < 1 && pro > 0 && success <= tri)
                      result = binomialProbability(tri, success, pro);

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
              if (nbrTrialsController.text.length != 0 &&
                  nbrProbabilityController.text.length != 0)
                if (int.parse(nbrTrialsController.text) <= 25 &&
                    double.parse(nbrProbabilityController.text) < 1 &&
                    double.parse(nbrProbabilityController.text) > 0)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.green[400],
                          borderRadius: BorderRadius.circular(10)),
                      width: 200,
                      child: Text(
                        'V(X) = ${variance(int.parse(nbrTrialsController.text), double.parse(nbrProbabilityController.text)).toString().substring(0, 3)}',
                        softWrap: true,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              if (nbrTrialsController.text.length != 0 &&
                  nbrProbabilityController.text.length != 0)
                if (int.parse(nbrTrialsController.text) < 31 &&
                    double.parse(nbrProbabilityController.text) < 1 &&
                    double.parse(nbrProbabilityController.text) > 0)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.green[400],
                          borderRadius: BorderRadius.circular(10)),
                      width: 200,
                      child: Text(
                        'E(X) = ${expectedValue(int.parse(nbrTrialsController.text), double.parse(nbrProbabilityController.text)).toString()}',
                        softWrap: true,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              if (result != null)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.green[400],
                        borderRadius: BorderRadius.circular(10)),
                    width: 250,
                    child: Text(
                      'P(X = ${int.parse(nbrTrialsController.text)}) = ${result.toString()}',
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
                ''' قانون التوزيع الثنائي هو قانون احتمالي يصف نتائج التجارب التي لها نتيجتين ممكنتين فقط، تسمى نجاح وفشل. على سبيل المثال، رمي عملة معدنية أو نجاح اختبار صحفي معين.
خصائص قانون التوزيع الثنائي:
    عدد التجارب الثابتة (n): يفترض القانون إجراء نفس التجربة (رمي العملة، إجراء الاختبار) لعدد ثابت من المرات (n).
    احتمال ثابت للنجاح (p): يفترض القانون أن احتمال النجاح (p) ثابت عبر كل تجربة.
    احتمال ثابت للفشل (q): احتمال الفشل (q) يساوي 1 - p.
    استقلالية التجارب: لا تؤثر نتائج التجارب السابقة على نتائج التجارب اللاحقة.
دالة الاحتمال في التوزيع الثنائي (Dalat al-ihtimal fi at-tawzi' ath-thunaئي):
تُحسب دالة الاحتمال (P(X = k)) لحدوث k حالة نجاح في n تجربة باستخدام الصيغة:
P(X = k) = (n اختر k) * p^k * (1 - p)^(n-k)
حيث:
    k: عدد حالات النجاح المطلوبة.
    n اختر k: معامل التجميع (اختيار k عنصر من أصل n).
    p: احتمال النجاح.
    (1 - p): احتمال الفشل.
استخدامات قانون التوزيع الثنائي:
يستخدم قانون التوزيع الثنائي في العديد من المجالات، بما في ذلك:
    التجارب العلمية: دراسة نتائج التجارب التي لها نتيجتين محتملتين، مثل نجاح أو فشل عقار جديد.
    التحكم بالجودة: حساب احتمالية اجتياز منتج لفحص معين.
    الألعاب الاحتمالية: تحليل احتمالات الفوز والخسارة في ألعاب مثل الروليت أو اليانصيب.
    ''',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to calculate the binomial coefficient (n choose k)
  int binomialCoefficient(int n, int k) {
    if (k == 0 || k == n) {
      return 1;
    }
    return binomialCoefficient(n - 1, k - 1) + binomialCoefficient(n - 1, k);
  }

// Function to calculate the probability mass function (PMF) of the binomial distribution
  double binomialProbability(int n, int k, double p) {
    int coefficient = binomialCoefficient(n, k);
    double q = 1 - p;
    double probability =
        double.parse((coefficient * pow(p, k) * pow(q, n - k)).toString());
    return probability;
  }

  double expectedValue(int n, double p) {
    return n * p;
  }

  double variance(int n, double p) {
    return n * p * (1 - p);
  }
}
