import 'package:alemeno_test/constants/strings.dart';
import 'package:flutter/material.dart';

class WebFooter extends StatelessWidget{
  double? height,width;
  Color? color;
  WebFooter({this.height, this.width, this.color, super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      height: height?? MediaQuery.of(context).size.height * 0.5,
      width: width ?? MediaQuery.of(context).size.width,
      color: color?? Colors.black,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20,),
              Container(
                height: 50,
                width: 150,
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Align(alignment: Alignment.centerLeft, child: Text(AppString.logoText),),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(AppString.joinUs, style: TextStyle(color: Colors.white),),
                  const SizedBox(height: 20,),
                  Image.asset('assets/images/join-us.png', scale: 3,),
                ],
              ),
              const SizedBox(height: 20,),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),
              Text(AppString.companyText, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              Text(AppString.aboutUs, style: TextStyle(color: Colors.white),),
              Text(AppString.contactUs, style: TextStyle(color: Colors.white),),
              Text(AppString.termsAndConditions, style: TextStyle(color: Colors.white),),
              Text(AppString.pricing, style: TextStyle(color: Colors.white),),
              Text(AppString.testimonials, style: TextStyle(color: Colors.white),),
              SizedBox(height: 20,),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),
              Text(AppString.support, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              Text(AppString.helpCenter, style: TextStyle(color: Colors.white),),
              Text(AppString.termsOfService, style: TextStyle(color: Colors.white),),
              Text(AppString.legal, style: TextStyle(color: Colors.white),),
              Text(AppString.privacyPolicy, style: TextStyle(color: Colors.white),),
              Text(AppString.status, style: TextStyle(color: Colors.white),),
              SizedBox(height: 20,),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40,),
              const Text(AppString.stayUpToDate, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              Container(
                height: 50,
                width: 150,
                color: Colors.white,
                child: const Align(alignment: Alignment.centerLeft, child: Text(AppString.enterEmail),),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ],
      ),
    );
  }
}