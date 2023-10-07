import 'package:alemeno_test/data_model/plan_model.dart';
import 'package:alemeno_test/data_model/test_model.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier{
  List<TestModel> cartTests = [];

  List<MedicalPlan> cartPlans = [];

  int totalMRP = 0;
  int totalDiscount = 0;
  int totalAmountToBePaid = 0;

  String selectedDate = '';
  String selectedTime = '';

  void setSelectedDate(String setDate){
    selectedDate = setDate;
    notifyListeners();
  }

  void setSelectedTime(String setTime){
    selectedTime = setTime;
    notifyListeners();
  }

  void addTest(TestModel t){
    cartTests.add(t);
    totalMRP += t.originalPrice;
    totalDiscount += t.originalPrice - t.price;
    totalAmountToBePaid += t.price;
    notifyListeners();
  }

  void removeTest(TestModel t){
    cartTests.remove(t);
    totalMRP -= t.originalPrice;
    totalDiscount -= t.originalPrice - t.price;
    totalAmountToBePaid -= t.price;
    notifyListeners();
  }

  int getTestsCount(){
    return cartTests.length;
  }

  void addPlan(MedicalPlan m){
    cartPlans.add(m);
    notifyListeners();
  }

  void removePlan(MedicalPlan m){
    cartPlans.remove(m);
    notifyListeners();
  }

  int getPlansCount(){
    return cartPlans.length;
  }

  int getTotalCount(){
    return cartPlans.length + cartTests.length;
  }

}