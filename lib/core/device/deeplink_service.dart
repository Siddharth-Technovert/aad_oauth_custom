import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeepLinkService {
  static Future<void> launchApp(
    String appName,
    BuildContext context,
    String launcherUrl, {
    String? androidId,
    String? iosId,
  }) async {
    final String? packageId = Platform.isAndroid ? androidId : iosId;

    if (await canLaunchUrl(Uri.parse(launcherUrl))) {
      await launchUrl(
        Uri.parse(launcherUrl),
      ).catchError((_) {
        displayError(context, appName);
      });
    } else {
      await launchUrl(
        Platform.isAndroid
            ? Uri.parse(
                "https://play.google.com/store/apps/details?id=$packageId",
              )
            : Uri.parse("https://apps.apple.com/us/app/$packageId"),
      ).catchError((_) {
        displayError(context, appName);
      });
    }
  }

  static void displayError(BuildContext context, String appName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Cannot launch $appName",
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  } // Returns: true

  static Future<void> sendMail(
    BuildContext context,
    String mail, {
    String subject = "",
    String body = "",
  }) async {
    final url = "ms-outlook://emails/new?to=$mail&subject=$subject&body=$body";
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        await launchUrl(
          Platform.isAndroid
              ? Uri.parse(
                  "https://play.google.com/store/apps/details?id=com.microsoft.office.outlook",
                )
              : Uri.parse(
                  "https://apps.apple.com/us/app/microsoft-outlook/id951937596",
                ),
        ).catchError(
          (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Cannot launch mail",
                  style: TextStyle(
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
            );
          },
        );
      }
    } catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    }
  }
}
