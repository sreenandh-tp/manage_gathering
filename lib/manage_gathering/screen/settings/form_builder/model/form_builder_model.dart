enum FormType { singleLineForm, b, c, d, e, f, g }

enum FieldType {
  text(1),
  n(2),
  c(3),
  d(4),
  e(5);

  const FieldType(this.value);
  final int value;
}

class SingleLineFormModel {
  FormType type = FormType.singleLineForm;
  String label;
  String? placeholdertext;
  String? helpertext;
  List<bool> isSelectedFieldType = [true, false, false, false, false];
  bool isRequired = false;

  SingleLineFormModel({
    required this.label,
    this.placeholdertext,
    this.helpertext,
    required this.isSelectedFieldType,
    required this.isRequired,
  });
}

Map<String, dynamic> fieldType = {};
