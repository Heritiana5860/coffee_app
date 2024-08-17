import 'package:app1/components/buttons.dart';
import 'package:app1/components/text.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Coffee id"),
        centerTitle: true,
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.white,
      ),
      body: const Content(),
    );
  }
}

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {

  int strength = 1;
  int sugars = 1;

  void increaseStrength() {
    setState(() {
      strength = strength < 5 ? strength + 1 : 1;
    });
  }

  void increaseSugars() {
    setState(() {
      sugars = sugars < 5 ? sugars + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
          margin: const EdgeInsets.all(1.0),
          color: Colors.brown[200],
          child: const MyText("How i like coffee?"),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
          margin: const EdgeInsets.all(1.0),
          color: Colors.brown[100],
          child: Column(
            children: [
              Row(
                children: [
                  const MyText("Grain Coffee: "),
                  for(int i=0; i<strength; i++)
                    Image.asset('assets/img/coffee_bean.png',
                      width: 20,
                      color: Colors.brown[100],
                      colorBlendMode: BlendMode.multiply,
                    ),
                  const Expanded(child: SizedBox()),
                  MyButton(
                      onPressed: increaseStrength,
                      child: const Text("+"),),
                ],
              ),
              Row(
                children: [
                  const MyText("Sugar: "),
                  if(sugars==0)
                    const Text("No sugar"),
                  for(int i=0; i<sugars; i++)
                    Image.asset('assets/img/sugar_cube.png',
                      width: 20,
                      color: Colors.brown[100],
                      colorBlendMode: BlendMode.multiply,
                    ),
                  const Expanded(child: SizedBox()),
                  MyButton(
                      onPressed: increaseSugars,
                      child: const Text("+"),),
                ],
              ),
            ],
          ),
        ),
        Expanded(
            child: Image.asset("assets/img/coffee_bg.jpg",
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,),
        ),
      ],
    );
  }
}

