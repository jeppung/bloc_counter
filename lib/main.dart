import 'package:bloc_counter/bloc/counter_bloc.dart';
import 'package:bloc_counter/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocCounter(),
      child: const MaterialApp(
        title: "Bloc Counter Demo",
        debugShowCheckedModeBanner: false,
        home: MyHomePage(
          title: "Bloc Demo Home Page",
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<BlocCounter, CounterState>(
              builder: (context, state) {
                return Text(state.counterValue.toString());
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                  BlocProvider.of<BlocCounter>(context).add(Decrement());
                }, child: const Text("-"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () {
                  BlocProvider.of<BlocCounter>(context).add(Increment());
                }, child: const Text("+")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
