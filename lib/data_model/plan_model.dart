import 'package:flutter/material.dart';

class MedicalPlan {
  final String title;
  final List<String> description;
  final int price;
  final String planImage;
  final bool addedToCart;

  MedicalPlan({
    required this.title,
    required this.description,
    required this.price,
    required this.planImage,
    required this.addedToCart,
  });

  factory MedicalPlan.fromJson(Map<String, dynamic> json) {
    return MedicalPlan(
        title: json['title'],
        description: json['description'],
        price: json['price'],
        planImage: json['planImage'],
      addedToCart: json['addedToCart']
    );
  }

  Map<String, dynamic> toMap(MedicalPlan medicalPlan) {
    return {
      'title': medicalPlan.title,
      'description': medicalPlan.description,
      'price': medicalPlan.price,
      'planImage': medicalPlan.planImage?? '',
      'addedToCart': medicalPlan.addedToCart
    };
  }
}
