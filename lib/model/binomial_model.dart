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
/*
    while (r <= n) {
      for (i = 1; i <= n; i++) {
        nf = nf * i;
      }
      for (j = 1; j <= r; j++) {
        rf = j * rf;
      }
      p = n - r;
      for (k = 1; k <= p; k++) {
        pf = pf * k;
      }
      s = (nf / (rf * pf)) * Math.pow(a, p) * Math.pow(b, r);
      if (p != 0) {
        if (p == 1)
          xp = x;
        else
          xp = x + "^" + p;
      }
      else {
        xp = "";
      }
      if (r != 0) {
        if (r == 1)
          yp = y;
        else
          yp = y + "^" + r;
      } else {
        yp = "";
      }

      int s1 = (int)s;
      ib = s1 + "" + xp + "" + yp;
      //-----------------------------------------------

      if (r == n)
        d.append(" " + ib);
      else
        d.append(" " + ib + " +");


      r++;
      nf = 1;
      pf = 1;
      rf = 1;
    }*/
  }

  int factorial(int number) {
    int i, factorial = 1;
    for (i = 1; i <= number; i++) {
      factorial = factorial * i;
    }
    return factorial;
  }
}
