import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/screens/forms_builder.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/screens/manage_bank_account.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/screens/send_notification_page.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/screens/settlement_and_refund.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/screens/terms_and_condition.dart';

final List<Widget> icons = [
  const Icon(Icons.account_balance_outlined),
  const Icon(Icons.rule),
  const Icon(Icons.edit_document),
  const Icon(Icons.assistant_photo_rounded),
  const Icon(Icons.notifications_on_sharp),
  const Icon(Icons.call),
  const Icon(Icons.location_on_outlined),
  const Icon(Icons.person),
];

final List<String> settingsItems = [
  "Manage Bank Account",
  "Settlement and Refund",
  "Form Builder",
  "Terms & Conditions",
  "Push Notifications",
  "Contact Business",
  "Location Information",
  "Export Guest Details",
];

final List<String> guestFiltters = [
  "All",
  "Requested",
  "Verify",
  "Verified",
  "Rejected",
  "Cancelled",
];

List pagesRoute = [
  const ManageBankAccountPage(),
  SettlementAndRefundPage(),
  const FormsBuilderPage(),
  const TermsAndConditionPage(),
  const SendNotificationPage(),
];

const String dummyTermsAndConditions = """Key Takeaways

Here’s a quick summary of everything you need to know about website’s terms and conditions agreements:

Terms and conditions agreements inform users about the rules and expectations for using a website or app.
These agreements are also where you can establish and communicate your governing laws and dispute resolutions.
It may hold up in court so long as long as your rules fall within applicable laws and users read and agreed to it.""";
