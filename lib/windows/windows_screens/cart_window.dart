import 'package:alemeno_test/constants/colors.dart';
import 'package:alemeno_test/constants/strings.dart';
import 'package:alemeno_test/data/medical_plan_data.dart';
import 'package:alemeno_test/data_model/test_model.dart';
import 'package:alemeno_test/provider/cart_provider.dart';
import 'package:alemeno_test/ui_components/chip.dart';
import 'package:alemeno_test/ui_components/test_overview.dart';
import 'package:alemeno_test/ui_components/test_overview_window.dart';
import 'package:alemeno_test/windows/windows_screens/success_window.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CartWindow extends StatefulWidget {
  const CartWindow({super.key});

  @override
  State<CartWindow> createState() => _CartWindowState();
}

class _CartWindowState extends State<CartWindow> {
  bool dateSelected = false;
  TextEditingController selectDateController = TextEditingController();
  bool hardCopy = false;

  String selectedDate = '';
  String selectedTime = '';
  DateRangePickerController dateController = DateRangePickerController();
  bool selected = false;

  @override
  void dispose() {
    // TODO: implement dispose
    selectDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (BuildContext context, CartProvider cartProvider,
              Widget? child) =>
          cartProvider.cartTests.isEmpty
              ? const Center(
                  child: Text(
                    AppString.noTestsAddedYet,
                    style: TextStyle(
                        color: AppColors.selectedColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : Scaffold(
                body: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppString.myCartText,
                        style: TextStyle(
                            color: AppColors.selectedColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.7,
                              width: MediaQuery.of(context).size.width * 0.54,
                              child: Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (ctx, index) {
                                  return TestOverViewWindow(testModel: cartProvider.cartTests[index]);
                                }, itemCount: cartProvider.cartTests.length,),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                Text(
                                  AppString.addMoreTests,
                                  style: TextStyle(
                                      color: AppColors.selectedColor,
                                      decoration: TextDecoration.underline,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.selectedColor,
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.4,
                              height: 70,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.appGrey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0))),
                              child: Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: <Widget>[
                                  GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return StatefulBuilder(
                                                  builder:
                                                      (BuildContext context,
                                                          StateSetter
                                                              setState) {
                                                return Dialog(
                                                  backgroundColor:
                                                      Colors.white,
                                                  surfaceTintColor:
                                                      Colors.white,
                                                  child: SizedBox(
                                                    height: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height *
                                                        0.8,
                                                    width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width *
                                                        0.3,
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: <Widget>[
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                          const Text(
                                                            AppString
                                                                .selectDate,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    18),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                vertical:
                                                                    10.0,
                                                                horizontal:
                                                                    10),
                                                            child:
                                                                SfDateRangePicker(
                                                              controller:
                                                                  dateController,
                                                              todayHighlightColor:
                                                                  null,
                                                              headerStyle: const DateRangePickerHeaderStyle(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center),
                                                              selectionColor:
                                                                  AppColors
                                                                      .selectedColor,
                                                              showNavigationArrow:
                                                                  true,
                                                              showTodayButton:
                                                                  false,
                                                            ),
                                                          ),
                                                          const Text(
                                                            AppString
                                                                .selectTimeText,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    18),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          GridView.builder(
                                                            shrinkWrap:
                                                                true,
                                                            gridDelegate:
                                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        3,
                                                                    childAspectRatio:
                                                                        2.5),
                                                            itemBuilder:
                                                                (ctx,
                                                                    index) {
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  setState(
                                                                      () {
                                                                    cartProvider
                                                                        .setSelectedTime(AppString.timeSlots[index]);
                                                                    cartProvider
                                                                        .setSelectedDate(DateFormat('dd/MM').format(dateController.selectedDate!));
                                                                    selected =
                                                                        !selected;
                                                                  });
                                                                },
                                                                child: Chip(
                                                                  backgroundColor: selected && cartProvider.selectedTime == AppString.timeSlots[index]
                                                                      ? AppColors
                                                                          .selectedColor
                                                                      : Colors
                                                                          .white,
                                                                  label:
                                                                      Text(
                                                                    AppString
                                                                        .timeSlots[index],
                                                                    style: TextStyle(
                                                                        color: selected && cartProvider.selectedTime == AppString.timeSlots[index]
                                                                            ? Colors.white
                                                                            : Colors.black),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            itemCount:
                                                                AppString
                                                                    .timeSlots
                                                                    .length,
                                                          ),
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              if (cartProvider
                                                                      .selectedTime
                                                                      .isNotEmpty &&
                                                                  cartProvider
                                                                      .selectedDate
                                                                      .isNotEmpty) {
                                                                Navigator.pop(
                                                                    context);
                                                              }
                                                            },
                                                            child:
                                                                Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                        Radius.circular(10)),
                                                                color: cartProvider.selectedDate.isNotEmpty &&
                                                                        cartProvider
                                                                            .selectedTime.isNotEmpty
                                                                    ? AppColors
                                                                        .selectedColor
                                                                    : AppColors
                                                                        .appGrey,
                                                              ),
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.25,
                                                              height: 52,
                                                              child:
                                                                  const Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <Widget>[
                                                                  Text(
                                                                    AppString
                                                                        .confirmText,
                                                                    style: TextStyle(
                                                                        color:
                                                                            Colors.white,
                                                                        fontWeight: FontWeight.bold),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                            });
                                      },
                                      child: Image.asset(
                                        'assets/images/calendar.png',
                                        scale: 2,
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      constraints: const BoxConstraints(
                                          maxHeight: 50),
                                      child: TextField(
                                        controller: selectDateController,
                                        decoration: InputDecoration(
                                          hintText: cartProvider
                                                      .selectedDate
                                                      .isEmpty ||
                                                  cartProvider
                                                      .selectedTime.isEmpty
                                              ? 'Select Date'
                                              : '${cartProvider.selectedDate} ${cartProvider.selectedTime}',
                                          hintStyle: const TextStyle(
                                              color:
                                                  AppColors.selectedColor),
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: AppColors
                                                    .appGrey), //<-- SEE HERE
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.4,
                              height: 200,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.appGrey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0))),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      const Text(
                                        AppString.mrp,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        cartProvider.totalMRP.toString(),
                                        style:
                                            const TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      const Text(
                                        AppString.discount,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        cartProvider.totalDiscount
                                            .toString(),
                                        style:
                                            const TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      const Text(
                                        AppString.amountToBePaid,
                                        style: TextStyle(
                                            color: AppColors.selectedColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                          cartProvider.totalAmountToBePaid
                                              .toString(),
                                          style: const TextStyle(
                                              color:
                                                  AppColors.selectedColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      const Text(
                                        AppString.totalSavings,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                          cartProvider.totalDiscount
                                              .toString(),
                                          style: const TextStyle(
                                              color:
                                                  AppColors.selectedColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.4,
                              height: 140,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.appGrey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0))),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              hardCopy = !hardCopy;
                                            });
                                          },
                                          icon: hardCopy
                                              ? const Icon(
                                                  Icons.check_circle,
                                                  color: AppColors
                                                      .selectedColor,
                                                )
                                              : const Icon(
                                                  Icons.circle_outlined)),
                                      const Text(AppString.hardCopy)
                                    ],
                                  ),
                                  const Text(
                                    AppString.hardCopyText,
                                    style:
                                        TextStyle(color: AppColors.appGrey),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(AppString.perPerson,
                                      style: TextStyle(
                                          color: AppColors.appGrey))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (cartProvider.selectedDate.isNotEmpty &&
                                    cartProvider.selectedTime.isNotEmpty) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) =>
                                              const SuccessWindow()));
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: cartProvider
                                              .selectedDate.isNotEmpty &&
                                          cartProvider
                                              .selectedTime.isNotEmpty
                                      ? AppColors.selectedColor
                                      : AppColors.appGrey,
                                ),
                                width:
                                    MediaQuery.of(context).size.width * 0.4,
                                height: 52,
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      AppString.scheduleText,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

    );
  }
}

// Container(
// height: 250,
// margin: const EdgeInsets.only(left: 20),
// decoration: BoxDecoration(
// borderRadius: const BorderRadius.all(
// Radius.circular(10)),
// border:
// Border.all(color: AppColors.appGrey)),
// width:
// MediaQuery.of(context).size.width * 0.5,
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Container(
// color: AppColors.selectedColor,
// width: double.infinity,
// height: 40,
// child: const Center(
// child: Text(
// AppString.pathologyTest,
// style: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.bold),
// ),
// ),
// ),
// const SizedBox(
// height: 30,
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.start,
// mainAxisSize: MainAxisSize.min,
// children: <Widget>[
// const SizedBox(
// width: 30,
// ),
// Text(
// cartProvider.cartTests[0].title,
// style: const TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 22),
// ),
// SizedBox(
// width: MediaQuery.of(context)
//     .size
//     .width *
// 0.28,
// ),
// Text(
// cartProvider.cartTests[0].price
//     .toString(),
// style: const TextStyle(
// color: AppColors.secondaryColor,
// fontSize: 25,
// fontWeight: FontWeight.bold),
// ),
// const SizedBox(
// width: 30,
// ),
// ],
// ),
// const SizedBox(
// height: 10,
// ),
// Row(
// mainAxisSize: MainAxisSize.max,
// mainAxisAlignment:
// MainAxisAlignment.end,
// children: <Widget>[
// Text(
// cartProvider
//     .cartTests[0].originalPrice
//     .toString(),
// style: const TextStyle(
// decoration:
// TextDecoration.lineThrough,
// color: AppColors.appGrey,
// fontSize: 18),
// ),
// const SizedBox(
// width: 40,
// ),
// ],
// ),
// const SizedBox(
// height: 30,
// ),
// Row(
// children: [
// const SizedBox(
// width: 30,
// ),
// ChipButton(
// leading: Image.asset(
// 'assets/images/delete.png',
// color: AppColors.selectedColor,
// ),
// label: AppString.remove),
// const SizedBox(
// width: 30,
// ),
// ChipButton(
// leading: Image.asset(
// 'assets/images/upload_icon.png',
// color: AppColors.selectedColor),
// label: AppString.uploadPrescription,
// width: MediaQuery.of(context)
//     .size
//     .width *
// 0.3,
// )
// ],
// ),
// ],
// ),
// ),
