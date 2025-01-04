enum FormType {
  singleLineForm,
  multiLineText,
  radioOptions,
  multipleCheckBox,
  checkBox,
  dropDownOptions,
  imageUpload,
}

enum FieldType {
  text(1),
  number(2),
  email(3),
  phone(4),
  date(5);

  const FieldType(this.value);
  final int value;
}

class FormBuilderModel {
  FormType formType;
  String label;
  String? placeHolderText;
  String? helperText;
  FieldType? fieldType = FieldType.text;
  List<String>? radioOption;
  List<String>? checkBoxOption;
  bool isMadatory;

  FormBuilderModel({
    required this.formType,
    required this.label,
    this.placeHolderText,
    this.helperText,
    this.fieldType,
    this.radioOption,
    this.checkBoxOption,
    required this.isMadatory,
  });
}
