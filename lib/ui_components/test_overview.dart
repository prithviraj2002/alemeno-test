import 'package:alemeno_test/constants/colors.dart';
import 'package:alemeno_test/constants/strings.dart';
import 'package:alemeno_test/data_model/test_model.dart';
import 'package:alemeno_test/provider/cart_provider.dart';
import 'package:alemeno_test/ui_components/chip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestOverviewTile extends StatelessWidget{
  final TestModel testModel;
  double? height; double? width;
  TestOverviewTile({required this.testModel ,this.height, this.width, super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      height: height ?? 210,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: AppColors.appGrey)),
      width: width ?? MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          Container(
            color: AppColors.selectedColor,
            width: double.infinity,
            height: 40,
            child: const Center(
              child: Text(
                AppString.pathologyTest,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                testModel.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Text(
                testModel.price.toString(),
                style: const TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 200,
              ),
              Text(
                testModel.originalPrice.toString(),
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: AppColors.appGrey,
                    fontSize: 18),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                height: 10,
              ),
              ChipButton(
                leading: Image.asset('assets/images/upload_icon.png',
                    color: AppColors.selectedColor),
                label: AppString.uploadPrescription,
                width: MediaQuery.of(context).size.width * 0.7,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}