import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shahed/constant.dart';
import 'package:shahed/view/widgets/Login/buildNextButton.dart';
import 'package:shahed/view/widgets/Login/bulidPinCode.dart';

class OPTScreen extends StatelessWidget {
  const OPTScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(7.0),
          child: Column(
            children: [
              Center(child: Image.asset('assets/11.png',width: double.infinity,fit: BoxFit.cover,)),
              SizedBox(height: 25,),
              Text('Phone Number Verification',
              style: TextStyle(
                color: TextColor2,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Enter the code send to',style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.grey.shade600
                  ),),
                  SizedBox(width: 5,),
                  Text('+02 01068984178',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),),
                ],
              ),
              SizedBox(height: 15,),
              BuildBinCode(),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: BuildNextButton(
                  onClick: (){
                  Navigator.pushNamed(context, homeScreen);
                },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
