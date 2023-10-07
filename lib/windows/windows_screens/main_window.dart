import 'package:alemeno_test/constants/colors.dart';
import 'package:alemeno_test/data/medical_plan_data.dart';
import 'package:alemeno_test/data_model/plan_model.dart';
import 'package:alemeno_test/ui_components/footer.dart';
import 'package:alemeno_test/ui_components/package_card.dart';
import 'package:alemeno_test/ui_components/test_card.dart';
import 'package:alemeno_test/ui_components/test_card_window.dart';
import 'package:alemeno_test/windows/windows_screens/cart_window.dart';
import 'package:flutter/material.dart';

import '../../constants/strings.dart';

class MainWindow extends StatelessWidget {
  const MainWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 35),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const Text(
                        AppString.logoText,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Center(
                        child: Wrap(
                          spacing: 30,
                          runSpacing: 30,
                          children: <Widget>[
                            Text(
                              AppString.home,
                              style: TextStyle(
                                  color: AppColors.selectedColor,
                                  decoration: TextDecoration.underline,
                                  fontSize: 20),
                            ),
                            Text(
                              AppString.viewTests,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              AppString.aboutUs,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              AppString.contact,
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (ctx) => CartWindow()));
                        },
                        child: Chip(
                            avatar: Image.asset(
                              'assets/images/cart.png',
                              scale: 1.5,
                              color: AppColors.selectedColor,
                            ),
                            label: const Text(
                              AppString.cart,
                              style: TextStyle(color: AppColors.selectedColor),
                            )),
                      )
                    ]
                  ),
                    const SizedBox(
                      height: 30,
                    ),
                  const Divider(),
                  const SizedBox(
                      height: 30,
                    ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppString.popularLabTest,
                          style: TextStyle(
                              color: AppColors.selectedColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Wrap(
                          spacing: 30,
                          runSpacing: 30,
                          children: <Widget>[
                            Chip(
                                backgroundColor: AppColors.selectedColor,
                                label: Text(
                                  AppString.popularTests,
                                  style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.bold),
                                )),
                            Chip(
                                label: Text(
                              AppString.fever,
                              style: TextStyle(color: AppColors.selectedColor),
                            )),
                            Chip(
                                label: Text(
                              AppString.covid19,
                              style: TextStyle(color: AppColors.selectedColor),
                            )),
                            Chip(
                                label: Text(
                              AppString.allergyProfiles,
                              style: TextStyle(color: AppColors.selectedColor),
                            )),
                            Chip(
                                label: Text(
                              AppString.fitness,
                              style: TextStyle(color: AppColors.selectedColor),
                            )),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              AppString.viewMoreText,
                              style: TextStyle(
                                  color: AppColors.selectedColor,
                                  decoration: TextDecoration.underline),
                            ),
                            Icon(Icons.arrow_forward, color: AppColors.selectedColor,)
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            TestCardWindow(testModel: MedicalData.listOfTests[index]),
                            const SizedBox(
                              width: 30,
                            ),
                            TestCardWindow(testModel: MedicalData.listOfTests[index]),
                            const SizedBox(
                              width: 30,
                            ),
                            TestCardWindow(testModel: MedicalData.listOfTests[index]),
                          ],
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(
                          height: 40,
                        );
                      },
                      itemCount: 2,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      AppString.popularPackages,
                      style: TextStyle(
                          color: AppColors.selectedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Wrap(
                          spacing: 30,
                          runSpacing: 30,
                          children: <Widget>[
                            Chip(
                                backgroundColor: AppColors.selectedColor,
                                label: Text(
                                  AppString.allPackages,
                                  style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.bold),
                                )),
                            Chip(
                                label: Text(
                                  AppString.elderly,
                                  style: TextStyle(color: AppColors.selectedColor),
                                )),
                            Chip(
                                label: Text(
                                  AppString.heart,
                                  style: TextStyle(color: AppColors.selectedColor),
                                )),
                            Chip(
                                label: Text(
                                  AppString.womenHealth,
                                  style: TextStyle(color: AppColors.selectedColor),
                                )),
                            Chip(
                                label: Text(
                                  AppString.men,
                                  style: TextStyle(color: AppColors.selectedColor),
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              AppString.viewMoreText,
                              style: TextStyle(
                                  color: AppColors.selectedColor,
                                  decoration: TextDecoration.underline),
                            ),
                            Icon(Icons.arrow_forward, color: AppColors.selectedColor,)
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            PackageCard(medicalPlan: MedicalData.listOfPlans[index]),
                            const SizedBox(
                              width: 30,
                            ),
                            PackageCard(medicalPlan: MedicalData.listOfPlans[index]),
                            const SizedBox(
                              width: 30,
                            ),
                            PackageCard(medicalPlan: MedicalData.listOfPlans[index]),
                          ],
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(
                          height: 30,
                        );
                      },
                      itemCount: 2,
                    ),
                    const SizedBox(height: 70,),
                  ],
                ),
            ),
            WebFooter(),
          ],
        ),
      ),
    );
  }
}

// Container(
// color: Colors.black,
// height: MediaQuery.of(context).size.height * 0.5,
// width: MediaQuery.of(context).size.width,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: <Widget>[
// Column(
// children: <Widget>[
// Container(
// height: 100,
// width: 200,
// color: Colors.white,
// child: const Align(
// alignment: Alignment.centerLeft,
// child: Text(AppString.logoText),),
// ),
// const SizedBox(height: 20,),
// const Text(AppString.joinUs, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: <Widget>[
// Image.asset('assets/images/youtube.png', scale: 2,),
// Image.asset('assets/images/youtube.png', scale: 2,),
// Image.asset('assets/images/youtube.png', scale: 2,),
// Image.asset('assets/images/youtube.png', scale: 2,),
// Image.asset('assets/images/youtube.png', scale: 2,),
// ]
// ),
// ]
// ),
// ],
// ),
// )
