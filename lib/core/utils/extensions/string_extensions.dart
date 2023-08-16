import 'package:intl/intl.dart';

import 'date_time_extension.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  double toDouble() {
    return double.tryParse(this) ?? 0;
  }

  DateTime? get toUtc {
    return DateTime.utc(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      int.tryParse(substring(0, 2)) ?? 0,
      int.tryParse(substring(3, 5)) ?? 0,
    );
  }

  DateTime yyyyMMDD() {
    try {
      return DateFormat("yyyy-MM-dd").parse(this);
    } catch (ex) {
      return DateTime(DateTime.now().year);
    }
  }

  String mmmDEeee() {
    final dateTime = yyyyMMDD();
    return "${DateFormat.MMM().format(dateTime)} ${DateFormat.d().format(dateTime)}, ${DateFormat.EEEE().format(dateTime)}";
  }

  String mmmDY() {
    final dateTime = yyyyMMDD();
    return "${DateFormat.MMM().format(dateTime)} ${DateFormat.d().format(dateTime)}, ${DateFormat.y().format(dateTime)}";
  }

  String to12HrFormat() {
    try {
      final firstStr = substring(0, 5);
      final secondStr = substring(6, 11);
      final val1 = DateFormat("h:mm a").format(DateFormat.H().parse(firstStr));
      final val2 = DateFormat("h:mm a").format(DateFormat.H().parse(secondStr));
      return "$val1 - $val2";
    } catch (ex) {
      return "";
    }
  }

  String formatDateTimeAndGetTimeAgo() {
    try {
      return DateFormat("yyyy-MM-ddTHH:mm:ss")
          .parse(
            this,
            true,
          )
          .timeAgo();
    } catch (ex) {
      return "";
    }
  }

  int secondIndexOf(String stringToFind) {
    if (indexOf(stringToFind) == -1) return -1;
    return indexOf(stringToFind, indexOf(stringToFind) + 1);
  }
}
