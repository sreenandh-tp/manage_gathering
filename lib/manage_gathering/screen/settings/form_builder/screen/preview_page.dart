import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/bloc/form_builder_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/model/form_builder_model.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: const CloseButton(),
          title: BlocBuilder<FormBuilderBloc, FormBuilderState>(
            builder: (context, state) {
              return Text(state.formTitle ?? "Preview");
            },
          ),
        ),
        body: BlocBuilder<FormBuilderBloc, FormBuilderState>(
          builder: (context, state) {
            return ListView.builder(
              padding: const EdgeInsets.only(bottom: 15),
              shrinkWrap: true,
              itemCount: state.formList.length,
              itemBuilder: (context, index) {
                final formList = state.formList[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 5, top: 10),
                      child: Text(
                        "${formList.label} ${formList.isMadatory ? "" : "(Optional)"}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    formList.formType == FormType.singleLineForm
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: formList.placeHolderText,
                                helperText: formList.helperText,
                              ),
                            ),
                          )
                        : formList.formType == FormType.multiLineText
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: TextFormField(
                                  minLines: 1,
                                  maxLines: 50,
                                  decoration: InputDecoration(
                                    hintText: formList.placeHolderText,
                                    helperText: formList.helperText,
                                  ),
                                ),
                              )
                            : formList.formType == FormType.radioOptions
                                ? ListView.builder(
                                    itemCount: formList.radioOption!.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return RadioListTile(
                                        contentPadding:
                                            const EdgeInsets.only(left: 5),
                                        value: true,
                                        groupValue: 1,
                                        onChanged: (value) {},
                                        title:
                                            Text(formList.radioOption![index]),
                                      );
                                    },
                                  )
                                : formList.formType == FormType.multipleCheckBox
                                    ? ListView.builder(
                                        itemCount:
                                            formList.checkBoxOption!.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            contentPadding:
                                                const EdgeInsets.only(left: 5),
                                            horizontalTitleGap: 10,
                                            leading: Checkbox(
                                              value: true,
                                              onChanged: (value) {},
                                            ),
                                            title: Text(formList
                                                .checkBoxOption![index]),
                                          );
                                        },
                                      )
                                    : formList.formType ==
                                            FormType.dropDownOptions
                                        ? DropdownButtonFormField(
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 15),
                                            hint: Text(
                                                formList.dropDownOption![0]),
                                            items: formList.dropDownOption!.map(
                                              (dropDownItems) {
                                                return DropdownMenuItem(
                                                  value: dropDownItems,
                                                  child: Text(
                                                    dropDownItems,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                );
                                              },
                                            ).toList(),
                                            onChanged: (value) {},
                                          )
                                        : formList.formType ==
                                                FormType.imageUpload
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  top: 10,
                                                ),
                                                child: FilledButton.icon(
                                                  onPressed: () {},
                                                  label: const Text(
                                                      "Upload Image"),
                                                  icon: const Icon(
                                                      Icons.upload_outlined),
                                                ),
                                              )
                                            : formList.formType ==
                                                    FormType.checkBox
                                                ? ListTile(
                                                    horizontalTitleGap: 5,
                                                    contentPadding:
                                                        const EdgeInsets.only(
                                                            left: 2),
                                                    leading: Checkbox(
                                                      value: false,
                                                      onChanged: (value) {},
                                                    ),
                                                    title: Text(
                                                      formList.placeHolderText!,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  )
                                                : Center(
                                                    child: Text(
                                                      "No Foem Added",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  )
                  ],
                );
              },
            );
          },
        ));
  }
}
