import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String timeAgo({bool numericDates = true}) {
    final diff = DateTime.now().difference(this);
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    }
    if (diff.inDays > 0) {
      return DateFormat.E().add_jm().format(this);
    }
    if (diff.inHours > 0) {
      return "Today ${DateFormat('jm').format(this)}";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    }
    return "just now";
  }

  String get suffix {
    var suffix = "th";
    final digit = day % 10;
    if ((digit > 0 && digit < 4) && (day < 11 || day > 13)) {
      suffix = ["st", "nd", "rd"][digit - 1];
    }
    return suffix;
  }

  String get week {
    return DateFormat.EEEE().format(this);
  }

  String get yMMMMd {
    return DateFormat.yMMMMd().format(this);
  }

  // for getting order screen datetime format
  String get mmmDhm {
    return DateFormat('MMM d, h:mm a').format(this);
  }

  String get eeeDMMM {
    return DateFormat('E, d MMM').format(this);
  }

  // for 12hr day format (hour am/hour pm)
  String get ha {
    return DateFormat("ha").format(this);
  }

  String get hmma {
    return DateFormat("h:mma").format(this);
  }
}



// extension DateFormatExtension on DateFormat {
//   DateFormat get ddMMy {
//     return DateFormat('dd mm y', 'en_US');
//   }
// }
