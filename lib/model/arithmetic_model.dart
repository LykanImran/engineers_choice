import 'dart:core';

class ArithmeticModel {
  int num1;
  int num2;

  ArithmeticModel({this.num1, this.num2});

  List<int> binary1 = [];
  List<int> binary2 = [];
  List<int> sum = [];
  List<int> decToBinary(int num) {
    int r;
   // print("for num> >${num}");
    int i = 0;
    List<int> binary = [];
    while (num > 0) {
      r = num % 2;
      binary.add(r);
   //   print("for  >> r: ${binary[i]}");
      num = (num ~/ 2);
      i++;
    }
    int len=4-binary.length;
   // print("binary lenght  >> r: ${len}");

    if(len%4!=0){
      for(i=1; i<= len; i++){
       // print("Added  >> r:$i} }");
        binary.add(0);
      }
    }
    return binary;
  }

  List<int> compliment(List<int> binary) {
    int i;
    List<int> compliment = [];
    for (i = 0; i < binary.length; i++) {
      if (binary[i] == 1) {
        compliment.add(0);
      } else {
        compliment.add(1);
      }
    }
    return compliment;
  }

  List<int> add(
    List<int> num1,
    List<int> num2,
  ) {
    List<int> sum = [];
    int i;
    int carry = 0;
    for (i = 0; i < (num1.length); i++) {

      if (num1[i] == 1 && num2[i] == 1) {
        if (carry == 1) {
          print("1 1 >  1  1");
          sum.add(1);
          carry = 1;
        } else {
          print("1 1 >  1  0");
          sum.add(0);
          carry = 1;
        }
      } else if ((num1[i] == 1 && num2[i] == 0) ||
          (num1[i] == 0 && num2[i] == 1)) {
        if (carry == 1) {
          print("1 0 >  0  1");
          sum.add(0);
          carry = 1;
        } else {
          print("1 0 >  1  0");
          sum.add(1);
          carry = 0;
        }
      } else {
        if (carry == 1) {
          print("0  0>  1 0");
          sum.add(1);
          carry = 0;
        } else {
          print("0  0 >  0  0");
          sum.add(0);
          carry =0;
        }
      }
     // print('summ indisde.... ${sum[i]}');
    }
    return sum;
  }

  String solveSubstract(int num1, num2){

    binary1 = decToBinary(num1.abs());
    binary2 = decToBinary(num2.abs());
    String result;
    if(num1<0){
      binary1 = compliment(binary1);
      binary1 = add(binary1, [1, 0 , 0 , 0]);
      print("minus>>>>");
      _displayBinary(binary1);
    }
    if(num2<0){
      binary2 = compliment(binary2);
      print("Compliment");
      _displayBinary(binary2);
      binary2 = add(binary2, [1, 0 , 0 , 0]);
      print("minus>>>>");
      _displayBinary(binary2);
    }
    binary2 = compliment(binary2);
    binary2 = add(binary2, [1, 0, 0, 0]);
    List<int> minus=[];

    minus = add(binary1, binary2);

    return displayString(minus);

  }
  String solveAdd(int num1, int num2) {
    binary1 = decToBinary(num1.abs());
    binary2 = decToBinary(num2.abs());
    String result;

    print("Num 1 >> ${num1}  Num2 >> ${num2}");
    print("Num 1 >> ${num1.abs()}  Num2 >> ${num2.abs()}");

    print("Num 1 >> ${binary1}  Num2 >> ${binary2}");

    List<int> sum =[];

    if(num1<0){
      binary1 = compliment(binary1);
      binary1 = add(binary1, [1, 0 , 0 , 0]);
      print("minus>>>>");
      _displayBinary(binary1);
    }
    if(num2<0){
      binary2 = compliment(binary2);
      print("Compliment");
      _displayBinary(binary2);
      binary2 = add(binary2, [1, 0 , 0 , 0]);
      print("minus>>>>");
     _displayBinary(binary2);
    }
    sum = add(binary1, binary2);

    int i;
    for(i=0; i<sum.length; i++){
      //print ("SUM digits>>>>>>>> ${sum[i]}");

    }
    _displayBinary(binary1);
    displayString(binary1);
    _displayBinary(sum);
    //displayString(binary2);
    print ("SUM>>>>>>>>");

    //_displayBinary(sum);
    // displayString(sum);

     return displayString(sum);
  }

String displayString(List<int> num){
    String numString= "";
    int i;
  for(i=num.length-1; i>=0; i--){
    numString = numString+"${num[i]}";
  }
  print("String >>>>> ${numString}");
  return  numString;
}
  void _displayBinary(List<int> binary){

    print("Binary LIst>>>  ${binary}");
  }

}
