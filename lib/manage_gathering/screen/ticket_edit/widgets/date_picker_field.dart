import 'package:flutter/material.dart';

class DatePickerField extends StatelessWidget {
  final String startLabelText;
  final String endLabelText;
  final VoidCallback startDatePicker;
  final VoidCallback endDatePicker;

  const DatePickerField({
    super.key,
    required this.startLabelText,
    required this.endLabelText,
    required this.startDatePicker,
    required this.endDatePicker,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          validator: (value) {
            if (value!.isNotEmpty) {
              return null;
            }
            return "Enter valid time";
          },
          showCursor: false,
          keyboardType: TextInputType.none,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: startDatePicker,
              icon: const Icon(
                Icons.calendar_today_outlined,
                size: 18,
              ),
            ),
            hintText: "DD/MM/YYYY",
            labelText: startLabelText,
            isDense: true,
          ),
        )),
        const SizedBox(width: 20),
        Expanded(
            child: TextFormField(
          showCursor: false,
          keyboardType: TextInputType.none,
          decoration: InputDecoration(
            hintText: "DD/MM/YYYY",
            labelText: endLabelText,
            isDense: true,
            suffixIcon: IconButton(
              onPressed: endDatePicker,
              icon: const Icon(
                Icons.calendar_today_outlined,
                size: 18,
              ),
            ),
          ),
        )),
      ],
    );
  }
}
