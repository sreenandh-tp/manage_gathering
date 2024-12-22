import 'package:flutter/material.dart';

class VerifiedButton extends StatelessWidget {
  const VerifiedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: IntrinsicWidth(
        stepWidth: 60,
        stepHeight: 25,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Text(
              "Verified",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
