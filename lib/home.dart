import 'package:calculator/components.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

var userInput = "";
var userAns = "";


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Text(userInput, style: TextStyle(color: Colors.white, fontSize: 35),)),
                  SizedBox(height: 10,),
                  Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Text(userAns, style: TextStyle(color: Colors.white, fontSize: 35),)),
                ],
              ),
            )),
            Expanded(
                flex: 2,
                child: Column(
                children: [
                Row(
                  children: [
                    myButton(title: "AC", onpress: (){
                      userInput = " ";
                      userAns = " ";
                      setState(() {

                      });
                    }),
                    myButton(title: "+/-", onpress: (){
                      userInput += "+/-";
                      setState(() {

                      });
                    }),
                    myButton(title: "%", onpress: (){
                      userInput += "%";
                      setState(() {

                      });
                    }),
                    myButton(title: "/", color: Color(0xffffa00a), onpress: (){
                      userInput += "/";
                      setState(() {

                      });
                    }),
                  ],
                ),
                Row(
                  children: [
                    myButton(title: "7", onpress: (){
                      userInput += "7";
                      setState(() {

                      });
                    }),
                    myButton(title: "8", onpress: (){
                      userInput += "8";
                      setState(() {

                      });
                    }),
                    myButton(title: "0", onpress: (){
                      userInput += "0";
                      setState(() {

                      });
                    }),
                    myButton(title: "x", color: Color(0xffffa00a), onpress: (){
                      userInput += "x";
                      setState(() {

                      });
                    }),
                  ],
                ),
                Row(
                  children: [
                    myButton(title: "4", onpress: (){
                      userInput += "4";
                      setState(() {

                      });
                    }),
                    myButton(title: "5", onpress: (){
                      userInput += "5";
                      setState(() {

                      });
                    }),
                    myButton(title: "6", onpress: (){
                      userInput += "6";
                      setState(() {

                      });
                    }),
                    myButton(title: "-", color: Color(0xffffa00a), onpress: (){
                      userInput += "-";
                      setState(() {

                      });
                    }),
                  ],
                ),
                Row(
                  children: [
                    myButton(title: "1", onpress: (){
                      userInput += "1";
                      setState(() {

                      });
                    }),
                    myButton(title: "2", onpress: (){
                      userInput += "2";
                      setState(() {

                      });
                    }),
                    myButton(title: "3", onpress: (){
                      userInput += "3";
                      setState(() {

                      });
                    }),
                    myButton(title: "+", color: Color(0xffffa00a), onpress: (){
                      userInput += "+";
                      setState(() {

                      });
                    }),
                  ],
                ),
                Row(
                  children: [
                    myButton(title: "0", onpress: (){
                      userInput += "0";
                      setState(() {

                      });
                    }),
                    myButton(title: ".", onpress: (){
                      userInput += ".";
                      setState(() {

                      });
                    }),
                    myButton(title: "DEL", onpress: (){
                      userInput = userInput.substring(0,userInput.length-1);
                      setState(() {

                      });
                    }),
                    myButton(title: "=", color: Color(0xffffa00a), onpress: (){
                      equalPress();
                      setState(() {

                      });
                    }),
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }


  // equal function
  void equalPress(){
    String finialUserInput = userInput.replaceAll("x", "*");
    Parser p = Parser();
    Expression expression = p.parse(finialUserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    userAns = eval.toString();
  }

}
