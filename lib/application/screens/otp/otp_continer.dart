import 'package:flutter/material.dart';

class OtpContiner1 extends StatelessWidget {
  const OtpContiner1({
    super.key,
    required this.otpController4,
  });

  final TextEditingController otpController4;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      width: 50,
      height: 50,
      child: TextFormField(
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          controller: otpController4,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: const InputDecoration(
              hintText: '-',
              counterText: '',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter otp";
            }
            return null;
          }),
    );
  }
}
