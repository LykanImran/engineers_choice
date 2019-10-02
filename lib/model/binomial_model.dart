import 'dart:math';

class BinomialModel {
  int a;
  int b;
  int n;

  BinomialModel({this.a = 1, this.b = 1, this.n = 2});
  List<int> xPower=[];
  List<int> yPower=[];
  List<BigInt> term = [];


  expansion() {
    xPower=[];
    yPower=[];
    term=[];
    int r = 0;
    int s ;

    BigInt termInt;
    BigInt xp, yp;
    while (r <= n) {
      xp = BigInt.from(pow(a, n - r).toInt());
      yp = BigInt.from(pow(b, r).toInt());
      print("term brefore int>>>>> > >> }");

     termInt =BigInt.from((factorial(n) /
          (factorial(r)* factorial(n - r))).toInt()) *xp *yp;
     // termInt= BigInt.from(s);
      print("term>>>>> > >> ${termInt}");
      //print("n: ${factorial(n)} \n r: ${factorial(r)} \n n-r: ${factorial(n-r)} \n");

      // print(" >>n-r : ${ n-r} \n >> r : $r \n");

      print(" pow a : ${pow(a, n - r)} \n pow b : ${pow(b, r)} \n");
      print("${s}x^${n - r}y^${r}");
      term.add(termInt);
      xPower.add(n - r);
      yPower.add(r);

      r++;
    }
    print("term >>>>> ${term}");
    print("X power >>>>> ${xPower}");
    print("y power >>>>> ${yPower}");
  }

  void test() {
    String xp = "";
    String yp = "", ib = "";
  }

  BigInt factorial(int number) {
    int i;
    BigInt factorial = BigInt.from(1);
    for (i = 1; i <= number; i++) {
      factorial = factorial * BigInt.from(i);
    }
    return factorial;
  }
}
