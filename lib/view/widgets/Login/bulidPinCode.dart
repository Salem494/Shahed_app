import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shahed/constant.dart';

// ignore: must_be_immutable
class BuildBinCode extends StatelessWidget {
  late String otpCode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: PinCodeTextField(
          appContext: context,
          autoFocus: true,
          cursorColor: TextColor,
          keyboardType: TextInputType.number,
          length: 6,
          obscureText: false,
          animationType: AnimationType.scale,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 40,
            fieldWidth: 40,
            borderWidth: 1,
            activeColor: TextColor2,
            inactiveColor: TextColor2,
            inactiveFillColor: Colors.white,
            activeFillColor: TextColor2,
            selectedColor: TextColor2,
            selectedFillColor: TextColor2,
          ),
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.white,
          enableActiveFill: true,
          onCompleted: (submitedCode) {
            otpCode = submitedCode;
            print("Completed");
          },
          onChanged: (value) {
            print(value);
          },
        ),
      ),
    );
  }
}
