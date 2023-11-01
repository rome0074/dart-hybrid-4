import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void getData() async {
  Uri uri = Uri.parse('https://random-data-api.com/api/v2/users?size=10');
  try {
    final resp = await http.get(uri);

    if (resp.statusCode == 200) {
      List<dynamic> jsonData = convert.jsonDecode(resp.body) as List<dynamic>;

      for (dynamic person in jsonData) {
        String uid = person['uid'];
        String fistName = person['first_name'];
        String lastName = person['last_name'];
        print('Uid: $uid \tFirst Name: $fistName \tLast Name: $lastName');
      }
    } else {
      print('[ERROR] Request failed with status: ${resp.statusCode}.');
    }
  } catch (err, st) {
    print('[ERROR] $err\nStack trace: \n$st');
  }
}
