import 'package:http/http.dart' as http;
import 'package:mmp/Services/service.dart';

class RomoteService {
  late Post objPost;

  Future<Post> getPost() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://vegetablemarketprice.com/api/data/market/tamilNadu/daywise?date=2022-05-31');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      objPost = postFromJson(json);
      return objPost;
    } else {
      return objPost;
    }
  }
}
