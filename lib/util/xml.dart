import 'dart:core';

import 'package:xml/xml.dart';

// returns first element with [name] in [XmlNode]
XmlElement findFirstElement(
  XmlNode node,
  String name, {
  bool recursive = false,
  String namespace,
}) {
  try {
    return findElements(node, name, recursive: recursive, namespace: namespace)
        ?.first;
  } on StateError {
    return null;
  }
}

// returns all elements with [name] in [XmlNode]
Iterable<XmlElement> findElements(
  XmlNode node,
  String name, {
  bool recursive = false,
  String namespace,
}) {
  try {
    if (recursive) {
      return node.findAllElements(name, namespace: namespace);
    } else {
      return node.findElements(name, namespace: namespace);
    }
  } on StateError {
    return null;
  }
}
