import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async {
  final jsonFile = File("en.json").readAsStringSync();
  final Map<String, dynamic> jsonData = await jsonDecode(jsonFile);

  final dartFile = File("values.dart");
  dartFile.writeAsStringSync("final class ValuesManager {", mode: FileMode.append);
  dartFile.writeAsStringSync("  const ValuesManager._();", mode: FileMode.append);
  jsonData.forEach((key, value) {
    dartFile.writeAsStringSync('  static const String $key = "$key";', mode: FileMode.append);
  });
  dartFile.writeAsStringSync("}", mode: FileMode.append);

}
