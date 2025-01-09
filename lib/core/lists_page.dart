import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/forms_builder.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/multiline_text_form.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/radio_option_form.dart/screen/radio_button_form.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/singleline_text_form.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/screens/gathering_visibility.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/screens/manage_bank_account.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/push_notification/screen/send_notification_page.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/screens/settlement_and_refund.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/screens/terms_and_condition.dart';

import '../manage_gathering/screen/settings/form_builder/screen/check_box_form.dart';
import '../manage_gathering/screen/settings/form_builder/screen/drop_down_option/screen/drop_down_form.dart';
import '../manage_gathering/screen/settings/form_builder/screen/image_upload_form.dart';
import '../manage_gathering/screen/settings/form_builder/screen/muliti_checkbox_option/screen/multiple_checkbox_form.dart';

final List<Widget> icons = [
  const Icon(Icons.account_balance_outlined),
  const Icon(Icons.rule),
  const Icon(Icons.edit_document),
  const Icon(Icons.assistant_photo_rounded),
  const Icon(Icons.notifications_on_sharp),
  const Icon(Icons.call),
  const Icon(Icons.location_on_outlined),
  const Icon(Icons.person),
  const Icon(Icons.visibility_rounded),
];

final List<String> settingsItems = [
  "Manage Bank Account",
  "Settlement and Refund",
  "Registration Form",
  "Terms & Conditions",
  "Push Notifications",
  "Contact Business",
  "Location Information",
  "Export Guest Details",
  "Gathering Visibility",
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
  GatheringVisibilityPage(),
];

const String dummyTermsAndConditions = """Key Takeaways

Here’s a quick summary of everything you need to know about website’s terms and conditions agreements:

Terms and conditions agreements inform users about the rules and expectations for using a website or app.
These agreements are also where you can establish and communicate your governing laws and dispute resolutions.
It may hold up in court so long as long as your rules fall within applicable laws and users read and agreed to it.""";

final List formIcons = [
  Icons.abc_sharp,
  Icons.reorder_outlined,
  Icons.check_circle_outline,
  Icons.check_box_outlined,
  Icons.check_box_outlined,
  Icons.expand_circle_down_outlined,
  Icons.photo_camera_back_outlined,
];

final List formItems = [
  "Singleline Text",
  "Multiline Text",
  "Radio Options",
  "Multiple Check Box",
  "Check Box",
  "Dropdown Options",
  "Image Upload",
];

final List formPages = [
  const SinglelineTextFormPage(),
  const MultilineTextFormPage(),
  RadioButtonFormPage(),
  MultipleCheckboxFormPage(),
  const CheckBoxFormPage(),
  DropDownFormPage(),
  const ImageUploadFormPage()
];

final List singleLineFormType = ["Text", "Number", "E-mail", "Phone", "Date"];

final List<String> organisers = ["Host", "Organiser", "Co-Host"];
var dropDownItems = ["10%", "20%", "30%", "40%", "50%"];
final List<String> tickectEditFundOption = [
  "Non-Refundable",
  "100% Refundable"
];
