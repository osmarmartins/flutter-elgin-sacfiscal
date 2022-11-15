abstract class DateTimeRegex {
  static final brazilianDateRegex = RegExp(r'^(\d{1,2}\/\d{1,2}\/\d{4})');
  static final brazilianDateTimeRegex = RegExp(r'^(\d{1,2}\/\d{1,2}\/\d{4}\ \d{2}\:\d{2}\:\d{2})');
  static final databaseDateRegex = RegExp(r'^(\d{4}\-\d{1,2}\-\d{1,2})');
  static final databaseDateTimeRegex = RegExp(r'^(\d{4}\-\d{1,2}\-\d{1,2}\ \d{2}\:\d{2}\:\d{2})');
}
