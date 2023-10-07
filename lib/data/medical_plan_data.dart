import 'dart:core';

import 'package:alemeno_test/data_model/plan_model.dart';
import 'package:alemeno_test/data_model/test_model.dart';
import 'package:flutter/cupertino.dart';

class MedicalData{
  static final List<MedicalPlan> listOfPlans = [
    MedicalPlan(
        title: 'Full Body Checkup',
        description: [
          'Includes 92 tests',
          'Blood Glucose Fasting',
          'Liver Function Test'
        ],
        price: 2000,
        planImage: 'assets/images/medicine.png', addedToCart: false),
    MedicalPlan(
        title: 'Heart care',
        description: [
          'Troponin',
          'Cholesterol',
        ],
        price: 1500,
        planImage: 'assets/images/heart.png', addedToCart: false),
    MedicalPlan(
        title: 'Diabetes care',
        description: [
          'Includes 20 tests',
          'Blood Glucose Fasting',
          'Lipid profile'
        ],
        price: 999,
        planImage: 'assets/images/diabetes.png', addedToCart: false),
    MedicalPlan(
        title: 'Full Body Checkup',
        description: [
          'Includes 92 tests',
          'Blood Glucose Fasting',
          'Liver Function Test'
        ],
        price: 2000,
        planImage: 'assets/images/medicine.png', addedToCart: false),
    MedicalPlan(
        title: 'Heart care',
        description: [
          'Troponin',
          'Cholesterol',
        ],
        price: 1500,
        planImage: 'assets/images/heart.png', addedToCart: false),
    MedicalPlan(
        title: 'Diabetes care',
        description: [
          'Includes 20 tests',
          'Blood Glucose Fasting',
          'Lipid profile'
        ],
        price: 999,
        planImage: 'assets/images/diabetes.png', addedToCart: false),
  ];

  static final List<TestModel> listOfTests = [
    TestModel(
      title: 'Iron Study Test',
      description: ['Includes 4 tests', 'Iron, Serum', 'TIBC', 'UIBC, serum...'],
      price: 600,
      originalPrice: 1000, addedToCart: false,
    ),
    TestModel(
      title: 'Thyroid Profile',
      description: [
        'Includes 3 tests',
        'T3 Triiodothyronine',
        "T4 Thyroxine",
        'TSH Ultra Sensitive',
      ],
      price: 1000,
      originalPrice: 1400, addedToCart: false,
    ),
    TestModel(
      title: 'Diabetes Profile',
      description: [
        'Includes 14 tests',
        'Blood glucose',
        "Lipid Profile",
        'HbA1c ...'
      ],
      price: 1200,
      originalPrice: 1600, addedToCart: false,
    ),
    TestModel(
      title: 'Iron Study Test',
      description: ['Includes 4 tests', 'Iron, Serum', 'TIBC', 'UIBC, serum...'],
      price: 600,
      originalPrice: 1000, addedToCart: false,
    ),
    TestModel(
      title: 'Thyroid Profile',
      description: [
        'Includes 3 tests',
        'T3 Triiodothyronine',
        "T4 Thyroxine",
        'TSH Ultra Sensitive',
      ],
      price: 1000,
      originalPrice: 1400, addedToCart: false,
    ),
    TestModel(
      title: 'Diabetes Profile',
      description: [
        'Includes 14 tests',
        'Blood glucose',
        "Lipid Profile",
        'HbA1c ...'
      ],
      price: 1200,
      originalPrice: 1600, addedToCart: false,
    ),
  ];
}


