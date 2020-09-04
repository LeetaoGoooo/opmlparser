import 'package:opmlparser/opmlparser.dart';
import 'package:opmlparser/util/datetime.dart';
import 'package:opmlparser/util/xml.dart';
import 'package:xml/xml.dart';

class Opml {
  final String title;
  final DateTime dateCreated;
  final DateTime dateModified;
  final String ownerName;
  final String ownerEmail;
  final String ownerId;
  final String docs;
  final String expansionState;
  final String vertScrollState;
  final String windowTop;
  final String windowLeft;
  final String windowBottom;
  final String windowRight;

  final List<OpmlItem> items;

  Opml(
      {this.title,
      this.dateCreated,
      this.dateModified,
      this.ownerName,
      this.ownerEmail,
      this.ownerId,
      this.docs,
      this.expansionState,
      this.vertScrollState,
      this.windowTop,
      this.windowLeft,
      this.windowBottom,
      this.windowRight,
      this.items});

  factory Opml.parse(String opmlString) {
    XmlDocument element = XmlDocument.parse(opmlString);
    XmlNode opml = findFirstElement(element, 'opml');
    XmlNode head = findFirstElement(opml, 'head');
    XmlNode body = findFirstElement(opml, 'body');
    return Opml(
      title: findFirstElement(head, 'title')?.text,
      dateCreated: parseDateTime(findFirstElement(head, 'dateCreated')?.text),
      dateModified: parseDateTime(findFirstElement(head, 'dateModified')?.text),
      ownerName: findFirstElement(head, 'ownerName')?.text,
      ownerEmail: findFirstElement(head, 'ownerEmail')?.text,
      ownerId: findFirstElement(head, 'ownerId')?.text,
      docs: findFirstElement(head, 'docs')?.text,
      expansionState: findFirstElement(head, 'expansionState')?.text,
      vertScrollState: findFirstElement(head, 'vertScrollState')?.text,
      windowTop: findFirstElement(head, 'windowTop')?.text,
      windowLeft: findFirstElement(head, 'windowLeft')?.text,
      windowBottom: findFirstElement(head, 'windowBottom')?.text,
      windowRight: findFirstElement(head, 'windowRight')?.text,
      items:
          body.findElements('outline').map((e) => OpmlItem.parse(e)).toList(),
    );
  }
}
