import 'package:alemeno_test/constants/colors.dart';
import 'package:alemeno_test/constants/strings.dart';
import 'package:alemeno_test/data/medical_plan_data.dart';
import 'package:alemeno_test/mobile/mobile_screens/cart_screen.dart';
import 'package:alemeno_test/ui_components/package_card.dart';
import 'package:alemeno_test/ui_components/test_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: const Text(AppString.logoText),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => CartScreen()));
              },
              icon: Image.asset(
                'assets/images/cart.png',
                scale: 1.5,
              ))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    AppString.popularLabTest,
                    style:
                        TextStyle(color: AppColors.selectedColor, fontSize: 25),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: <Widget>[
                        Text(
                          AppString.viewMoreText,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 15,
                          color: AppColors.selectedColor,
                        )
                      ],
                    ),
                  )
                ],
              ),
              //Test Card
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TestCard(testModel: MedicalData.listOfTests[index]),
                      TestCard(testModel: MedicalData.listOfTests[index+1])
                    ],
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const SizedBox(height: 10,);
                },
                itemCount: 2,
              ),
              const SizedBox(
                height: 30,
              ),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppString.popularPackages,
                    style:
                        TextStyle(fontSize: 25, color: AppColors.selectedColor),
                  )),
              const SizedBox(
                height: 10,
              ),
              //Popular Package Card
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return PackageCard(
                    medicalPlan: MedicalData.listOfPlans[index],
                    height: 330,
                    width: 278,
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}

