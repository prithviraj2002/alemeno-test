import 'package:alemeno_test/constants/colors.dart';
import 'package:alemeno_test/constants/strings.dart';
import 'package:alemeno_test/windows/windows_screens/main_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/cart_provider.dart';

class SuccessWindow extends StatelessWidget{
  const SuccessWindow({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20),
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.bottomLeft,
                  child: Text(AppString.success, style: TextStyle(color: AppColors.selectedColor, fontWeight: FontWeight.bold, fontSize: 25),)),
              const SizedBox(height: 30,),
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: AppColors.appGrey)),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/confirm.png', scale: 2,),
                    const SizedBox(height: 25,),
                    const Text(AppString.halfConfirmText, style: TextStyle(fontSize: 20),),
                    const SizedBox(height: 10,),
                    const Text(AppString.otherHalfConfirmText, style: TextStyle(fontSize: 20),),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(Provider.of<CartProvider>(context, listen: false).selectedDate, style: const TextStyle(fontSize: 20),),
                        const SizedBox(width: 10,),
                        const Text('|'),
                        const SizedBox(width: 10,),
                        Text(Provider.of<CartProvider>(context, listen: false).selectedTime, style: const TextStyle(fontSize: 20),),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) => const MainWindow()), (route) => false);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(AppString.backToHomeText, style: TextStyle(color: AppColors.selectedColor, fontSize: 18, decoration: TextDecoration.underline),),
                    Icon(Icons.arrow_forward, color: AppColors.selectedColor,),
                    SizedBox(width: 30,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}