import 'package:counter_app_with_bloc/bloc/couter_bloc.dart';
import 'package:counter_app_with_bloc/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CounterBloc>();
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return Text(
              "$state",
              style: TextStyle(
                fontSize: 28,
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              bloc.add(CounterEvent.increment);
            },
            child: Icon(Icons.add),
          ),
          ElevatedButton(
            onPressed: () {
              bloc.add(CounterEvent.decrement);
            },
            child: Icon(Icons.remove),
          ),
          ElevatedButton(
            onPressed: () {
              bloc.add(CounterEvent.restart);
            },
            child: Icon(Icons.restart_alt),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContainerPage()));
              },
              child: Icon(Icons.navigate_next))
        ],
      ),
    );
  }
}
