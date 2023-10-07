import 'package:alemeno_test/constants/colors.dart';
import 'package:alemeno_test/constants/strings.dart';
import 'package:alemeno_test/mobile/mobile_screens/home_screen.dart';
import 'package:alemeno_test/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (ctx) => const HomeScreen()),
                    (route) => false);
              },
              icon: const Icon(Icons.arrow_back)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/menu_icon.png', scale: 2.0,)),
            )
          ],
          title: const Text(AppString.success),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: AppColors.appGrey)),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/confirm.png'),
                const SizedBox(height: 10,),
                const Text(AppString.scheduleConfirmText, style: TextStyle(fontSize: 20),),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(Provider.of<CartProvider>(context, listen: false).selectedDate),
                    const SizedBox(width: 10,),
                    const Text('|'),
                    const SizedBox(width: 10,),
                    Text(Provider.of<CartProvider>(context, listen: false).selectedTime),
                  ],
                ),
              ],
            ),
          ),
        ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (ctx) => const HomeScreen()),
                  (route) => false);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: AppColors.selectedColor
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          height: 52,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppString.backToHomeText,
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
