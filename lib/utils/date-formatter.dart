import 'package:intl/intl.dart';

String formatDate({required String format, required DateTime date}) {
  return DateFormat(format).format(date);
}
