import 'package:alemeno_test/constants/colors.dart';
import 'package:alemeno_test/constants/strings.dart';
import 'package:alemeno_test/mobile/mobile_screens/cart_screen.dart';
import 'package:alemeno_test/mobile/mobile_screens/success_screen.dart';
import 'package:alemeno_test/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateScreen extends StatefulWidget {
  const DateScreen({super.key});

  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {

  String selectedDate = '';
  String selectedTime = '';
  DateRangePickerController dateController = DateRangePickerController();
  bool selected = false;

  @override
  void initState() {
    // TODO: implement initState
    dateController.selectedDate = DateTime.now();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.bookAppointment),
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
          builder: (BuildContext context, CartProvider cartProvider, Widget? child) => Column(
            children: <Widget>[
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: Text(
                    AppString.selectDate,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10),
                child: SfDateRangePicker(
                  controller: dateController,
                  todayHighlightColor: null,
                  headerStyle: const DateRangePickerHeaderStyle(
                      textAlign: TextAlign.center),
                  selectionColor: AppColors.selectedColor,
                  showNavigationArrow: true,
                  showTodayButton: false,
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                  child: Text(
                    AppString.selectTimeText,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 2.5
                ),
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        cartProvider.setSelectedTime(AppString.timeSlots[index]);
                        cartProvider.setSelectedDate(DateFormat('dd/MM').format(dateController.selectedDate!));
                        selected = !selected;
                      });
                    },
                    child: Chip(
                      backgroundColor: selected && cartProvider.selectedTime == AppString.timeSlots[index]? AppColors.selectedColor : Colors.white,
                      label: Text(AppString.timeSlots[index], style: TextStyle(color: selected && cartProvider.selectedTime == AppString.timeSlots[index]? Colors.white : Colors.black),),
                    ),
                  );
                },
                itemCount: AppString.timeSlots.length,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (ctx) => const CartScreen()));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Provider.of<CartProvider>(context, listen: false).selectedTime.isNotEmpty && Provider.of<CartProvider>(context, listen: false).selectedDate.isNotEmpty
                ? AppColors.selectedColor
                : AppColors.appGrey,
          ),
          width: MediaQuery
              .of(context)
              .size
              .width * 0.8,
          height: 52,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                Provider.of<CartProvider>(context, listen: false).selectedTime.isNotEmpty && Provider.of<CartProvider>(context, listen: false).selectedDate.isNotEmpty
                    ? AppString.confirmText
                    : AppString.next,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


