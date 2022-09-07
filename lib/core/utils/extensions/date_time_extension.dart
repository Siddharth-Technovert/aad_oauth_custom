// ignore_for_file: unused_local_variable

import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get timeAgo {
    const time = "";
    final now = DateTime.now();
    final diff = DateTime.now().difference(this).inMinutes;
    if (diff == 0) {
      return "Just Now";
    } else if (diff < 60) {
      return "$diff ${diff == 1 ? 'minute ago' : 'minutes ago'}";
    } else if (diff < 60 * 24) {
      final hours = (diff / 60).round();
      return "${hours.toString()} ${hours == 1 ? 'hour ago' : 'hours ago'}";
    } else if (diff < 60 * 24 * 2) {
      return "Yesterday";
    }
    return "${DateTime.now().difference(this).inDays} days ago";
  }

  String get suffix {
    var suffix = "th";
    final digit = day % 10;
    if ((digit > 0 && digit < 4) && (day < 11 || day > 13)) {
      suffix = ["st", "nd", "rd"][digit - 1];
    }
    return suffix;
  }

  String get yMMMMd {
    return DateFormat.yMMMMd().format(this);
  }
}

// extension DateFormatExtension on DateFormat {
//   DateFormat get ddMMy {
//     return DateFormat('dd mm y', 'en_US');
//   }
// }
