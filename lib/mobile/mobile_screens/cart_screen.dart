import 'package:alemeno_test/constants/strings.dart';
import 'package:alemeno_test/data_model/test_model.dart';
import 'package:alemeno_test/mobile/mobile_screens/date_schedule_screen.dart';
import 'package:alemeno_test/mobile/mobile_screens/success_screen.dart';
import 'package:alemeno_test/provider/cart_provider.dart';
import 'package:alemeno_test/ui_components/chip.dart';
import 'package:alemeno_test/ui_components/test_overview.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../data/medical_plan_data.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart-screen';

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  bool dateSelected = false;
  bool hardCopy = false;
  TextEditingController selectDateController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    selectDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text(AppString.myCartText),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Image.asset(
              'assets/images/menu_icon.png',
              scale: 1.5,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<CartProvider>(
          builder: (BuildContext context, CartProvider cartProvider, Widget? child) => cartProvider.cartTests.isNotEmpty ?  Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppString.orderReview,
                    style:
                        TextStyle(color: AppColors.selectedColor, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                      child: TestOverviewTile(testModel: cartProvider.cartTests[index]),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const SizedBox(height: 10,);
                  },
                  itemCount: cartProvider.cartTests.length
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.appGrey),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) => const DateScreen()));
                      },
                        child: Image.asset('assets/images/calendar.png', scale: 2,)),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        constraints: const BoxConstraints(
                          maxHeight: 50
                        ),
                        child: TextField(
                          controller: selectDateController,
                          decoration: InputDecoration(
                            hintText: cartProvider.selectedDate.isEmpty || cartProvider.selectedTime.isEmpty ? 'Select Date'
                            : '${cartProvider.selectedDate} ${cartProvider.selectedTime}',
                            hintStyle: const TextStyle(color: AppColors.selectedColor),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.appGrey), //<-- SEE HERE
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.appGrey),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(AppString.mrp, style: TextStyle(fontSize: 16),),
                        Text(cartProvider.totalMRP.toString(), style: const TextStyle(fontSize: 16),)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(AppString.discount, style: TextStyle(fontSize: 16),),
                        Text(cartProvider.totalDiscount.toString(), style: const TextStyle(fontSize: 16),)
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(AppString.amountToBePaid, style: TextStyle(color: AppColors.selectedColor, fontWeight: FontWeight.bold, fontSize: 18),),
                        Text(cartProvider.totalAmountToBePaid.toString(), style: const TextStyle(color: AppColors.selectedColor, fontWeight: FontWeight.bold, fontSize: 18))
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(AppString.totalSavings, style: TextStyle(fontSize: 16),),
                        Text(cartProvider.totalDiscount.toString(), style: const TextStyle(color: AppColors.selectedColor, fontWeight: FontWeight.bold, fontSize: 18))
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 140,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.appGrey),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        IconButton(onPressed: () {
                          setState((){
                            hardCopy = !hardCopy;
                          });
                        }, icon: hardCopy? const Icon(Icons.check_circle, color: AppColors.selectedColor,) : const Icon(Icons.circle_outlined)),
                        const Text(AppString.hardCopy)
                      ],
                    ),
                    const Text(AppString.hardCopyText, style: TextStyle(color: AppColors.appGrey),),
                    const SizedBox(height: 10,),
                    const Text(AppString.perPerson, style: TextStyle(color: AppColors.appGrey))
                  ],
                ),
              ),
            ],
          ) : const Center(child: Text(AppString.noTestsAddedYet, style: TextStyle(color: AppColors.selectedColor, fontSize: 20),),),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          if(Provider.of<CartProvider>(context, listen: false).selectedDate.isNotEmpty && Provider.of<CartProvider>(context, listen: false).selectedTime.isNotEmpty){
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => const SuccessScreen()));
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Provider.of<CartProvider>(context, listen: false).selectedDate.isNotEmpty && Provider.of<CartProvider>(context, listen: false).selectedTime.isNotEmpty ? AppColors.selectedColor : AppColors.appGrey,
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          height: 52,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppString.scheduleText,
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

