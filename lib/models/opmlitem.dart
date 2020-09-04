import 'package:xml/xml.dart';

// item class for Opml i.e. the feed details
class OpmlItem {
  final String title;
  final String text;
  final String description;
  final String type;
  final String version;
  final String xmlUrl;
  final String htmlUrl;
  final String language;

  OpmlItem(
      {this.title,
      this.text,
      this.description,
      this.type,
      this.version,
      this.xmlUrl,
      this.htmlUrl,
      this.language});

  // parses [element] into a OpmlItem from its attributes
  factory OpmlItem.parse(XmlNode element) {
    return OpmlItem(
        title: element.getAttribute('title'),
        text: element.getAttribute('text'),
        description: element.getAttribute('description'),
        type: element.getAttribute('type'),
        version: element.getAttribute('version'),
        xmlUrl: element.getAttribute('xmlUrl'),
        htmlUrl: element.getAttribute('htmlUrl'),
        language: element.getAttribute('language'));
  }
}
