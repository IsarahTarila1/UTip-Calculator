import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tip_calculator/main.dart';
import 'package:tip_calculator/widgets/bill_amount_field.dart';
import 'package:tip_calculator/widgets/person_counter.dart';
import 'package:tip_calculator/widgets/tip_row.dart';
import 'package:tip_calculator/widgets/tip_slider.dart';
import 'package:tip_calculator/widgets/total_per_person.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UTip(),
    );
  }
}
class UTip extends StatefulWidget {

  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {

  double tipPercentage = 0.0;
  int _personCount = 1;
  double _billTotal = 0.0;

  double totalPerPerson(){
    return ((_billTotal*tipPercentage) + (_billTotal))/_personCount;
  }
  double totalTip(){
    return (_billTotal*tipPercentage);
  }

  //Methods
  void increment (){
    setState(() {
      _personCount = _personCount + 1;
    });
  }
  void decrement (){
    setState(() {
      if(_personCount>1){
        _personCount--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double total = totalPerPerson();
    double totalT = totalTip();
    //Add Style
    final style = theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.bold
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('UTip'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerPerson(style: style, total: total, theme: theme),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: theme.colorScheme.inversePrimary,
                  width: 2,
                )
              ),
              child: Column(
                children: [
                  BillAmountField(
                    billAmount: _billTotal.toString(),
                    onChanged: (value){
                      setState(() {
                        _billTotal = double.parse(value);
                      });
                    }
                  ), //TextField
                  //Split Bill Area
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Split",
                      style: theme.textTheme.titleMedium,
                      ),
                      PersonCounter(
                        personCount: _personCount,
                        theme: theme,
                        onDecrement: decrement,
                        onIncrement: increment,
                      )
                    ],
                  ),
                  // ==== Tip Section ====
                  TipRow(theme: theme, totalT: totalT),
                  Text('${(tipPercentage*100).round()}%'),

                  // == Tip Slider ==
                  TipSlider(
                    tipPercentage:
                    tipPercentage,
                    onChanged: (double value) {
                    setState(() {
                      tipPercentage = value;
                    });
                  },),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}





