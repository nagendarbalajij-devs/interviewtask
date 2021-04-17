import 'package:randomgenerator/randomgenerator.dart';

class Generator {
  static Future<String> getRandom() async {
    var s = await Randomgenerator.getRandom();
    return s.toString();
  }
}
