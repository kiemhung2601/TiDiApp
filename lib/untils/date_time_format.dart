import 'package:intl/intl.dart';

class DateTimeFormatter {
  static final dateTimeFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
  static final showDateTimeFormat = DateFormat("dd/MM/yyyy,HH:mm");
  static final showDateFormat = DateFormat("dd/MM/yyyy");
  static final dateFormat = DateFormat("yyyy-MM-dd");
  static final dateFormatExportFile = DateFormat("ddMMyyyy");
}