import 'package:flutter/material.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  String category = "Length";

  final inputController = TextEditingController();

  String fromUnit = "Meters";
  String toUnit = "Kilometers";

  double result = 0;

  final Map<String, List<String>> unitCategories = {
    "Length": ["Meters", "Kilometers", "Miles"],
    "Weight": ["Grams", "Kilograms", "Pounds"],
    "Temperature": ["Celsius", "Fahrenheit", "Kelvin"],
  };

  void convert() {
  double input = double.tryParse(inputController.text) ?? 0;

  setState(() {

    // LENGTH
    if (category == "Length") {

      if (fromUnit == "Meters" && toUnit == "Kilometers") {
        result = input / 1000;
      }

      else if (fromUnit == "Kilometers" && toUnit == "Meters") {
        result = input * 1000;
      }

      else if (fromUnit == "Kilometers" && toUnit == "Miles") {
        result = input * 0.621371;
      }

      else if (fromUnit == "Miles" && toUnit == "Kilometers") {
        result = input / 0.621371;
      }

      else if (fromUnit == toUnit) {
        result = input;
      }
    }

    // WEIGHT
    if (category == "Weight") {

      if (fromUnit == "Grams" && toUnit == "Kilograms") {
        result = input / 1000;
      }

      else if (fromUnit == "Kilograms" && toUnit == "Grams") {
        result = input * 1000;
      }

      else if (fromUnit == "Kilograms" && toUnit == "Pounds") {
        result = input * 2.20462;
      }

      else if (fromUnit == "Pounds" && toUnit == "Kilograms") {
        result = input / 2.20462;
      }

      else if (fromUnit == "Grams" && toUnit == "Pounds") {
        result = input / 453.592;
      }

      else if (fromUnit == "Pounds" && toUnit == "Grams") {
        result = input * 453.592;
      }

      else if (fromUnit == toUnit) {
        result = input;
      }
    }

    // TEMPERATURE
    if (category == "Temperature") {

      if (fromUnit == "Celsius" && toUnit == "Fahrenheit") {
        result = (input * 9 / 5) + 32;
      }

      else if (fromUnit == "Fahrenheit" && toUnit == "Celsius") {
        result = (input - 32) * 5 / 9;
      }

      else if (fromUnit == toUnit) {
        result = input;
      }
    }

  });
}

  @override
  Widget build(BuildContext context) {
    List<String> units = unitCategories[category]!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit Converter"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<String>(
              value: category,
              isExpanded: true,
              items: unitCategories.keys.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  category = value!;
                  fromUnit = unitCategories[value]![0];
                  toUnit = unitCategories[value]![1];
                });
              },
            ),

            const SizedBox(height: 20),

            TextField(
              controller: inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter value",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            DropdownButton<String>(
              value: fromUnit,
              isExpanded: true,
              items: units.map((unit) {
                return DropdownMenuItem(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  fromUnit = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            DropdownButton<String>(
              value: toUnit,
              isExpanded: true,
              items: units.map((unit) {
                return DropdownMenuItem(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  toUnit = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: convert,
              child: const Text("Convert"),
            ),

            const SizedBox(height: 20),

            Text(
              "Result: ${result.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}