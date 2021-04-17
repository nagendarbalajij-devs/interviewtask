import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:randomgenerator/randomgenerator.dart';

void main() {
  const MethodChannel channel = MethodChannel('randomgenerator');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Randomgenerator.platformVersion, '42');
  });
}
