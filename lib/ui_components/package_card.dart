import 'package:alemeno_test/constants/colors.dart';
import 'package:alemeno_test/constants/strings.dart';
import 'package:alemeno_test/data/medical_plan_data.dart';
import 'package:alemeno_test/data_model/plan_model.dart';
import 'package:alemeno_test/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PackageCard extends StatelessWidget {
  final MedicalPlan medicalPlan;
  double? height;
  double? width;

  PackageCard({required this.medicalPlan, this.height, this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 330,
      width: width ?? 294,
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: AppColors.appGrey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Image.asset('assets/images/safe_badge.png', scale: 1.5)
            ],
          ),
          Image.asset(
            medicalPlan.planImage,
            scale: 1.5,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            medicalPlan.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            medicalPlan.description[0],
            style: const TextStyle(color: AppColors.secondaryTextColor),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
              margin: const EdgeInsets.only(left: 15),
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return Row(
                    children: <Widget>[
                      Text(
                        medicalPlan.description[index],
                        style: const TextStyle(
                            color: AppColors.secondaryTextColor),
                      )
                    ],
                  );
                },
                itemCount: medicalPlan.description.length - 1,
              )),
          const SizedBox(
            height: 10,
          ),
          const Text(
            AppString.viewMoreText,
            style: TextStyle(
                color: AppColors.secondaryTextColor,
                decoration: TextDecoration.underline),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                medicalPlan.price.toString(),
                style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .addPlan(medicalPlan);
                },
                child: Container(
                  width: 130,
                  height: 33,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.selectedColor)),
                  child: const Center(
                    child: Text(
                      AppString.addToCartText,
                      style: TextStyle(
                          color: AppColors.selectedColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
