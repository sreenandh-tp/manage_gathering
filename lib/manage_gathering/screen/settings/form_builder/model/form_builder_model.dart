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
  List<String>? dropDownOption;
  String? checkBox;
  bool isMadatory;

  FormBuilderModel({
    required this.formType,
    required this.label,
    this.placeHolderText,
    this.helperText,
    this.fieldType,
    this.radioOption,
    this.checkBoxOption,
    this.dropDownOption,
    this.checkBox,
    required this.isMadatory,
  });

  Map<String, dynamic> toJson() => {
        "formType": formType,
        "label": label,
        "placeHolderText": placeHolderText,
        "helperText": helperText,
        "fieldType": fieldType,
        "radioOption": radioOption,
        "checkBoxOption": checkBoxOption,
        "dropDownOption": dropDownOption,
        "checkBox": checkBox,
        "isMadatory": isMadatory,
      };
}
