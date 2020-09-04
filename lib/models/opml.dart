import 'package:opmlparser/opmlparser.dart';
import 'package:opmlparser/util/xml.dart';
import 'package:xml/xml.dart';

class Opml {
  final String title;
  final String dateCreated;
  final String dateModified;
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

  factory Opml.parse(String opml) {
    XmlDocument element = XmlDocument.parse(opml);
    return Opml(
      title: findFirstElement(element, 'title')?.text,
      dateCreated: findFirstElement(element, 'dateCreated')?.text,
      dateModified: findFirstElement(element, 'dateModified')?.text,
      ownerName: findFirstElement(element, 'ownerName')?.text,
      ownerEmail: findFirstElement(element, 'ownerEmail')?.text,
      ownerId: findFirstElement(element, 'ownerId')?.text,
      docs: findFirstElement(element, 'docs')?.text,
      expansionState: findFirstElement(element, 'expansionState')?.text,
      vertScrollState: findFirstElement(element, 'vertScrollState')?.text,
      windowTop: findFirstElement(element, 'vertScrollState')?.text,
      windowLeft: findFirstElement(element, 'vertScrollState')?.text,
      windowBottom: findFirstElement(element, 'vertScrollState')?.text,
      windowRight: findFirstElement(element, 'vertScrollState')?.text,
      items: findFirstElement(element, 'body')
          .findElements('item')
          .map((e) => OpmlItem.parse(e))
          .toList(),
    );
  }
}
