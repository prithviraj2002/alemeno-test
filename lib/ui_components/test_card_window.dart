import 'package:alemeno_test/constants/colors.dart';
import 'package:alemeno_test/constants/strings.dart';
import 'package:alemeno_test/data/medical_plan_data.dart';
import 'package:alemeno_test/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../data_model/test_model.dart';

class TestCardWindow extends StatefulWidget {
  final TestModel testModel;
  double? height;
  double? width;
  TestCardWindow({required this.testModel, this.height, this.width, super.key});

  @override
  State<TestCardWindow> createState() => _TestCardWindowState();
}

class _TestCardWindowState extends State<TestCardWindow> {

  bool inCart = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 340,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: AppColors.appGrey)),
      width: widget.width?? 260,
      child: Column(
        children: <Widget>[
          Container(
            height: 42,
            width: double.infinity,
            color: AppColors.selectedColor,
            child: Center(
              child: Text(
                widget.testModel.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.testModel.description[0],
                  style: const TextStyle(fontSize: 15),
                ),
                Image.asset(
                  'assets/images/badge.png',
                  scale: 2,
                )
              ],
            ),
          ),
          const SizedBox(height: 10,),
          ListView.separated(
            shrinkWrap: true,
              itemBuilder: (ctx, index){
            return Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(':${widget.testModel.description[index + 1]}', style: const TextStyle(fontWeight: FontWeight.bold),),
                )
              ],
            );
          }, separatorBuilder: (ctx, index){
            return const SizedBox(height: 10,);
          }, itemCount: widget.testModel.description.length - 1),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 3.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(AppString.getReportsText, style: TextStyle(fontSize: 12),)),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(width: 5,),
              Text('${widget.testModel.price}', style: const TextStyle(color: AppColors.selectedColor, fontSize: 18, fontWeight: FontWeight.bold),),
              const SizedBox(width: 10,),
              Text('${widget.testModel.originalPrice}', style: const TextStyle(decoration: TextDecoration.lineThrough, fontSize: 15),)
            ],
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              Provider.of<CartProvider>(context, listen: false).addTest(widget.testModel);
              setState(() {
                inCart = true;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 46,
              decoration: BoxDecoration(
                  color: inCart ? AppColors.secondaryColor : AppColors.selectedColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  inCart ? AppString.addedToCartText : AppString.addToCartText,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 46,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                  Border.all(color: AppColors.selectedColor)),
              child: const Center(
                child: Text(
                  AppString.viewDetailsText,
                  style: TextStyle(
                      color: AppColors.selectedColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
