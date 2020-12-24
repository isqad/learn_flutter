import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'color_swticher_provider.dart';

void main() {
  runApp(RandomColorApp());
}

class RandomColorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ColorSwitcherProvider>(
        create: (_) => ColorSwitcherProvider(),
        child: Consumer<ColorSwitcherProvider>(
          builder: (context, state, child) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                centerTitle: true,
                title: Text(
                  "Homework Provider",
                  style: TextStyle(
                    color: Color(state.headerColor),
                  ),
                ),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedContainer(
                      width: 240,
                      height: 240,
                      color: Color(state.boxColor),
                      duration: Duration(milliseconds: 1300),
                    ),
                    Switch(
                      value: state.switchStatus,
                      onChanged: (_) {
                        state.toggle();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
