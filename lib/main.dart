import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Calculate Energy';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: UserInput(),
      ),
    );
  }
}

class UserInput extends StatefulWidget {
  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  TextEditingController weightController = new TextEditingController();
  TextEditingController speedPreController = new TextEditingController();
  TextEditingController speedPostController = new TextEditingController();
  TextEditingController heightPreController = new TextEditingController();
  TextEditingController heightPostController = new TextEditingController();
  String joule = "0";
  String water = "0";
  String iron = "0";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            controller: weightController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'weight',
              hintText: 'enter Weight in kg',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: speedPreController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'initial speed',
              hintText: 'enter initial speed in m/s',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: speedPostController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'end speed',
              hintText: 'enter end speed in m/s',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: heightPreController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'initial height',
              hintText: 'enter initial height in meters',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: heightPostController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'end height',
              hintText: 'enter end height in meters',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            child: Text("Calculate Energy"),
            onPressed: () {
              setState(() {
                double weight = double.parse(weightController.text);

                double energyStart = weight * (9.81 * double.parse(heightPreController.text) +
                    double.parse(speedPreController.text) * double.parse(speedPreController.text) / 2);

                double energyEnd = weight * (9.81 * double.parse(heightPostController.text) +
                    double.parse(speedPostController.text) * double.parse(speedPostController.text) / 2);

                double energy = (energyStart - energyEnd).abs();
                joule = energy.toString();

                double waterHeated = energy / (4186 * 80);
                water = waterHeated.toString();

                double ironAnealed = energy / (500 * 680);
                iron = ironAnealed.toString();
              });
            },
          ),
          SizedBox(
            height: 50,
          ),
          Text('Joule : $joule'),
          SizedBox(
            height: 20,
          ),
          Text('Water heated : $water'),
          SizedBox(
            height: 20,
          ),
          Text('Iron annealed : $iron'),
        ],
      ),
    );
  }
}