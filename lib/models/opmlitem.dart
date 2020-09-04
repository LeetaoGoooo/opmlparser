import 'package:opmlparser/util/xml.dart';
import 'package:xml/xml.dart';

class OpmlItem {
  final String title;
  final String text;
  final String description;
  final String type;
  final String version;
  final String xmlURL;
  final String httpURL;
  final String language;

  OpmlItem(
      {this.title,
      this.text,
      this.description,
      this.type,
      this.version,
      this.xmlURL,
      this.httpURL,
      this.language});

  factory OpmlItem.parse(XmlElement element) {
    return OpmlItem(
        title: findFirstElement(element, 'title')?.text,
        text: findFirstElement(element, 'text')?.text,
        description: findFirstElement(element, 'description')?.text,
        type: findFirstElement(element, 'type')?.text,
        version: findFirstElement(element, 'version')?.text,
        xmlURL: findFirstElement(element, 'xmlURL')?.text,
        httpURL: findFirstElement(element, 'httpURL')?.text,
        language: findFirstElement(element, 'language')?.text);
  }
}
