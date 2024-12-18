import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tip_calculator/main.dart';
import 'package:tip_calculator/widgets/person_counter.dart';
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Text("Total Per Person",
                    style: style,
                    ),
                    Text("\$23.5",
                    style: style.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontSize: theme.textTheme.displaySmall?.fontSize
                    ),),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: theme.colorScheme.inversePrimary,
                  width: 2,
                )
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.attach_money),
                      labelText: 'Bill Payment'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String value){
                      print("Value $value");
                    }
                  ), //TextField
                  //Split Bill Area
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tip',
                        style: theme.textTheme.titleMedium,),
                      Text("\$20",
                        style: theme.textTheme.titleMedium,)
                    ],
                  ),
                  Text('${(tipPercentage*100).round()}%'),

                  // == Tip Slider ==
                  Slider(
                      value: tipPercentage,
                      onChanged: (value){
                    setState(() {
                      print(value*100);
                      tipPercentage = value;
                    });
                  },
                    min: 0,
                    max: 0.5,
                    divisions: 5,
                    label: '${(tipPercentage*100).round()}%',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
