import 'package:intl/intl.dart';

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
}
