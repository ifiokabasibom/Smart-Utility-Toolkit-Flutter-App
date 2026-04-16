import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();

  double result = 0;

  void add() {
    setState(() {
      result =
          (double.tryParse(num1Controller.text) ?? 0) +
          (double.tryParse(num2Controller.text) ?? 0);
    });
  }

  void subtract() {
    setState(() {
      result =
          (double.tryParse(num1Controller.text) ?? 0) -
          (double.tryParse(num2Controller.text) ?? 0);
    });
  }

  void multiply() {
    setState(() {
      result =
          (double.tryParse(num1Controller.text) ?? 0) *
          (double.tryParse(num2Controller.text) ?? 0);
    });
  }

  void divide() {
    setState(() {
      double divisor =
          double.tryParse(num2Controller.text) ?? 1;

      result =
          (double.tryParse(num1Controller.text) ?? 0) /
          divisor;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "First number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Second number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 10,
              children: [

                ElevatedButton(
                  onPressed: add,
                  child: const Text("+"),
                ),

                ElevatedButton(
                  onPressed: subtract,
                  child: const Text("-"),
                ),

                ElevatedButton(
                  onPressed: multiply,
                  child: const Text("×"),
                ),

                ElevatedButton(
                  onPressed: divide,
                  child: const Text("÷"),
                ),

              ],
            ),

            const SizedBox(height: 20),

            Text(
              "Result: $result",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )

          ],
        ),
      ),
    );
  }
}