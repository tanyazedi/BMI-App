import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.deepPurple.shade50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('yourBMI'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 21),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    labelText: 'Enter your weight in kgs',
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 11),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    labelText: 'Enter your Height (in ft)',
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 11),
                TextField(
                  controller: inController,
                  decoration: const InputDecoration(
                    labelText: 'Enter your Height (in in)',
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if (wt.isNotEmpty && ft.isNotEmpty && inch.isNotEmpty) {
                      // BMI Calculation
                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (iFt * 12) + iInch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;
                      var bmi = iWt / (tM * tM);

                      var msg = "";

                      if (bmi > 25) {
                        msg = "You are overweight.";
                        bgColor = Colors.orange.shade200;
                      } else if (bmi < 18) {
                        msg = "You are underweight.";
                        bgColor = Colors.red.shade200;
                      } else {
                        msg = "Yay!You are healthy.";
                        bgColor = Colors.green.shade200;
                      }

                      setState(() {
                        result =
                            "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the blanks!!";
                      });
                    }
                  },
                  child: const Text('Calculate'),
                ),
                const SizedBox(height: 11),
                Text(
                  result,
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
