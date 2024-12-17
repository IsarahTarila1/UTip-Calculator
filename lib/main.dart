import 'package:flutter/material.dart';

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

class UTip extends StatelessWidget {
  const UTip({super.key});

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
                         Row(
                        children: [
                          IconButton(
                              onPressed: () =>{}, icon: const Icon(Icons.remove)),
                          Text("3",
                          style: theme.textTheme.titleMedium,),
                          IconButton(
                              onPressed: () => {}, icon: const Icon(Icons.add))
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

