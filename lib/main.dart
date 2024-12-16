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
        ],
      ),
    );
  }
}

