import 'package:http/http.dart' as http;
import 'package:mmp/Services/Service1.dart';
import 'package:mmp/Services/service.dart';

class RomoteServices {
  Future<List<DistrictName>?> getDistrictName() async {
    var client1 = http.Client();
    var uri = Uri.parse(
        'https://vegetablemarketprice.com/api/site/goto_data?pagetype=market&state=tamilNadu');
    var response = await client1.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;

      return districtNameFromJson(json);
    }
    return null;
  }
}
