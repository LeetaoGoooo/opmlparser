import 'package:intl/intl.dart';

const rfc822DatePattern = 'EEE, dd MMM yyyy HH:mm:ss Z';

// parses [dateString] as date with rfc822DatePattern or Iso8601DateTime
DateTime parseDateTime(dateString) {
  if (dateString == null) return null;
  return _parseRfc822DateTime(dateString) ?? _parseIso8601DateTime(dateString);
}

// parses [dateString] as date with rfc822DatePattern
DateTime _parseRfc822DateTime(String dateString) {
  try {
    final length = dateString?.length?.clamp(0, rfc822DatePattern.length);
    final trimmedPattern = rfc822DatePattern.substring(0,
        length); //Some feeds use a shortened RFC 822 date, e.g. 'Tue, 04 Aug 2020'
    final format = DateFormat(trimmedPattern, 'en_US');
    return format.parse(dateString);
  } on FormatException {
    return null;
  }
}

// parses [dateString] as date with Iso8601DateTime
DateTime _parseIso8601DateTime(dateString) {
  try {
    return DateTime.parse(dateString);
  } on FormatException {
    return null;
  }
}
