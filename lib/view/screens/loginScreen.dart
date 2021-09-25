import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shahed/constant.dart';
import 'package:shahed/view/screens/optscreen.dart';
import 'package:shahed/view/widgets/Login/buildNextButton.dart';
import 'package:shahed/view/widgets/Login/introTextLogin.dart';
import 'package:shahed/view/widgets/Login/phoneFormField.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {

  static const routeName = '/loginScreen';
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();

  // Widget _buildPhoneNumberSubmitedBloc() {
  //   return BlocListener<PhoneAuthCubit, PhoneAuthState>(
  //     listenWhen: (previous, current) {
  //       return previous != current;
  //     },
  //     listener: (context, state) {
  //       if (state is Loading) {
  //         showProgressIndicator(context);
  //       }
  //
  //       if (state is PhoneNumberSubmited) {
  //         Navigator.pop(context);
  //         Navigator.of(context).pushNamed(otpScreen, arguments: phoneNumber);
  //       }
  //
  //       if (state is ErrorOccurred) {
  //         Navigator.pop(context);
  //         String errorMsg = (state).errorMsg;
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text(errorMsg),
  //             backgroundColor: Colors.black,
  //             duration: Duration(seconds: 3),
  //           ),
  //         );
  //       }
  //     },
  //     child: Container(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _phoneFormKey,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 32, vertical: 88),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntroText(),
                  SizedBox(
                    height: 110,
                  ),
                  BuildPhoneFormFiled(),
                  SizedBox(
                    height: 60,
                  ),
                  BuildNextButton(
                    onClick: ()=>  Navigator.push(context, MaterialPageRoute(builder: (context)=>OPTScreen()))
                  ),
                  // _buildPhoneNumberSubmitedBloc(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}