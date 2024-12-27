import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/screens/manage_bank_account.dart';

final List<Widget> icons = [
  const Icon(Icons.account_balance_outlined),
  const Icon(Icons.rule),
  const Icon(Icons.edit_document),
  const Icon(Icons.assistant_photo_rounded),
  const Icon(Icons.call),
  const Icon(Icons.location_on_outlined),
  const Icon(Icons.person),
  const Icon(Icons.cancel_outlined),
];

final List<String> settingsItems = [
  "Manage Bank Account",
  "Settlement and Refund",
  "Form Builder",
  "Terms & Conditions",
  "Contact Business",
  "Location Information",
  "Export Guest Details",
  "Cancel Gathering",
];

final List<String> guestFiltters = [
  "All",
  "Requested",
  "Verify",
  "Verified",
  "Rejected",
  "Cancelled",
];

List pagesRoute = [const ManageBankAccountPage()];
