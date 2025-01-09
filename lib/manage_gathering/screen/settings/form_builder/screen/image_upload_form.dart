import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/bloc/form_builder_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/function/show_dialoge.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/model/form_builder_model.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/widget/form_textfield_widget.dart';

class ImageUploadFormPage extends StatefulWidget {
  const ImageUploadFormPage({super.key});

  @override
  State<ImageUploadFormPage> createState() => _ImageUploadFormPageState();
}

class _ImageUploadFormPageState extends State<ImageUploadFormPage> {
  final TextEditingController imageLabelController = TextEditingController();

  bool isSelected = false;

  void isSelect() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          title: const Text("Image Upload"),
          actions: [
            IconButton(
              onPressed: () {
                ShowDialoge().showDialoge(
                  "Delete",
                  "Are you sure? you want to delete this field",
                  context,
                  TextButton(onPressed: () {}, child: const Text("Delete")),
                );
              },
              icon: const Icon(Icons.delete_outline),
            )
          ],
        ),
        body: ListView(
          children: [
            FormTextFieldWidget(
                controller: imageLabelController,
                labelText: "Label",
                hintText: "Enter label"),
            ListTile(
              onTap: () => isSelect(),
              horizontalTitleGap: 5,
              contentPadding: const EdgeInsets.only(left: 0),
              leading: Checkbox(
                value: isSelected,
                onChanged: (value) {
                  isSelect();
                },
              ),
              title: Text(
                "This field is mandatory",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  final imageForm = FormBuilderModel(
                      formType: FormType.imageUpload,
                      label: imageLabelController.text,
                      isMadatory: isSelected);

                  context
                      .read<FormBuilderBloc>()
                      .add(AddFormsEvent(formBuilderModel: imageForm));
                  Navigator.pop(context);
                },
                child: const Text("Add"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
