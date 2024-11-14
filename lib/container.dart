import 'package:counter_app_with_bloc/bloc/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<Color> colors = [Colors.red, Colors.blue, Colors.black, Colors.white];

class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorBloc = context.read<ColorBloc>();
    return Scaffold(
      appBar: null,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<ColorBloc, Color>(builder: (context, color) {
              return Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      boxShadow: kElevationToShadow[12], color: color));
            }),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                itemCount: colors.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        colorBloc.add(ColorEvent(colors[i]));
                      },
                      child: Container(
                        width: 80,
                        decoration: BoxDecoration(
                            boxShadow: kElevationToShadow[12],
                            color: colors[i]),
                      ),
                    ),
                  );
                },
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                prefixIconColor:
                    MaterialStateColor.resolveWith((Set<MaterialState> states) {
                  if (states.contains(MaterialState.focused)) {
                    return Colors.green;
                  }
                  if (states.contains(MaterialState.error)) {
                    return Colors.red;
                  }
                  return Colors.grey;
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
