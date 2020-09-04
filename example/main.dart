import 'package:http/http.dart' as http;
import 'package:opmlparser/opmlparser.dart';

void main() async {
  var client = http.Client();

  var response = await client
      .get('http://hosting.opml.org/dave/spec/subscriptionList.opml');
  var channel = Opml.parse(response.body);
  print(channel);

  client.close();
}
