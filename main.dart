import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BmiCalculator(),
  ),
  );
}
class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String result = '-';
  calculateBmi(){
    double height = double.tryParse(heightController.text) ?? 0;
    double weight = double.tryParse(weightController.text) ?? 0 ;
    double bmi =(weight / height);
    setState(() {
      result = bmi.toStringAsFixed(2);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Stack(
        fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/bmi_image.png',
          fit: BoxFit.cover,
        ),
      Center(
        child: Padding(
          padding:const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
            const   Center(
                child:  Text(
                    'Your BMI is',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                ),
                ),
              ),
               Center(
                 child: Text(
                    result,
                  style: const TextStyle(
                    color:Colors.white,
                    fontSize: 30.0,
                  ),
                 ),
               ),
              const  Center(
                child: Text(
                  'please enter your height and weight to calculate your BMI',
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 16.0,
                  ),),
              ),
              const SizedBox(height: 150.0),
              TextField(
               controller:weightController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration:const InputDecoration(
                  labelText: 'Weight(Kg)',
                ),
              ),
             const SizedBox(height:12.0),
              TextField(
                controller:heightController ,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration:const InputDecoration(
                  labelText: 'Height(m)',
                ),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () => calculateBmi(),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: const Text('CALCULATE',
                style: TextStyle(
                  color:Colors.white,
                ),),
              ),
              const SizedBox(height: 40.0),
             const  Text('Body mass index, or BMI, is used to determine'
                  'weather your in the healthy weight range for your height.'
             ),
            ],
          ),
        ),
      ),
      ],
      ),
    );
  }
}

