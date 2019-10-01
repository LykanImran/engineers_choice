import 'dart:math';

class BinomialModel {
  int a;
  int b;
  int n;

  BinomialModel({this.a = 1, this.b = 1, this.n = 2});
  List<int> xPower=[];
  List<int> yPower=[];
  List<double> term = List<double>();


  expansion() {
    xPower=[];
    yPower=[];
    term=[];
    int r = 0;
    double s = 0;

    while (r <= n) {
      s = factorial(n) /
          (factorial(r) * factorial(n - r)) *
          pow(a, n - r) *
          pow(b, r);
      //print("n: ${factorial(n)} \n r: ${factorial(r)} \n n-r: ${factorial(n-r)} \n");

      // print(" >>n-r : ${ n-r} \n >> r : $r \n");

      print(" pow a : ${pow(a, n - r)} \n pow b : ${pow(b, r)} \n");
      print("${s}x^${n - r}y^${r}");
      term.add(s);
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

  int factorial(int number) {
    int i, factorial = 1;
    for (i = 1; i <= number; i++) {
      factorial = factorial * i;
    }
    return factorial;
  }
}
