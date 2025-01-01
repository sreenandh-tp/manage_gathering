enum FormType { a, b, c, d, e, f, g }

class FormBuilderModel {
  List<SingleLineFormModel> singleLineForm;

  FormBuilderModel({required this.singleLineForm});
}

class SingleLineFormModel {
  FormType type = FormType.a;
  String label;
  String? placeholdertext;
  String? helpertext;
  
  bool isRequired = false;

  SingleLineFormModel({
    required this.label,
    this.placeholdertext,
    this.helpertext,
    required this.isRequired,
  });
}
