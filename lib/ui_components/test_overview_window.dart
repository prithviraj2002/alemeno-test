import 'package:alemeno_test/constants/colors.dart';
import 'package:alemeno_test/constants/strings.dart';
import 'package:alemeno_test/data_model/test_model.dart';
import 'package:alemeno_test/provider/cart_provider.dart';
import 'package:alemeno_test/ui_components/chip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestOverViewWindow extends StatelessWidget{
  final TestModel testModel;
  double? height, width;
  TestOverViewWindow({required this.testModel, this.height, this.width, super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      height: height ?? 250,
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          borderRadius:
          const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: AppColors.appGrey)),
      width: width ?? MediaQuery.of(context).size.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.selectedColor,
            width: double.infinity,
            height: 40,
            child: const Center(
              child: Text(
                AppString.pathologyTest,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                width: 30,
              ),
              Text(
                testModel.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
              ),
              Text(
                testModel.price.toString(),
                style: const TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                testModel.originalPrice.toString(),
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: AppColors.appGrey,
                    fontSize: 18),
              ),
              const SizedBox(
                width: 40,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<CartProvider>(context, listen: false).removeTest(testModel);
                },
                child: ChipButton(
                    leading: Image.asset(
                      'assets/images/delete.png',
                      color: AppColors.selectedColor,
                    ),
                    label: AppString.remove),
              ),
              const SizedBox(
                width: 30,
              ),
              ChipButton(
                leading: Image.asset(
                    'assets/images/upload_icon.png',
                    color: AppColors.selectedColor),
                label: AppString.uploadPrescription,
                width: MediaQuery.of(context).size.width * 0.3,
              )
            ],
          ),
        ],
      ),
    );
  }
}