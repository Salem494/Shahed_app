import 'package:flutter/material.dart';

import '../../../constant.dart';

class BuildNextButton extends StatelessWidget {
  final Function onClick;

  final GlobalKey<FormState> _phoneFormKey = GlobalKey();

   BuildNextButton({Key? key, required this.onClick}) : super(key: key);


  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );

    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  Future<void> _register(BuildContext context) async {
    if (!_phoneFormKey.currentState!.validate()) {
      Navigator.pop(context);
      return;
    } else {
      Navigator.pop(context);
      _phoneFormKey.currentState!.save();
      // BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phoneNumber);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
        onPressed:()=> onClick
      // showProgressIndicator(context);
      // _register(context);
   ,
    child: Text(
    'Next',
    style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    style: ElevatedButton.styleFrom(
    minimumSize: Size(110, 50),
    primary: TextColor2,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(6),
    ),
    ),
    ),
    );
  }
}
