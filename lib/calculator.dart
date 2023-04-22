import 'dart:math';

class ClaculatorBrain {
  ClaculatorBrain({required this.height, required this.weight});
  final int height;
  final int weight;
  double? _bmi;
  String calculateBMI() {
    //Fomrmula of BMI
    _bmi = weight / (pow(height / 100, 2));
    // return bmi.round(1).toString();

    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getInterpretation() {
    if (_bmi! >= 25) {
      return 'You have a higer BMI value than the normal body wegith; Try to exercise more.';
    } else if (_bmi! > 18.5) {
      return 'You have a normal body weight. GREAT JOB!';
    } else {
      return 'You have a lower than normal body weight, You should eat a bit more';
    }
  }
}
