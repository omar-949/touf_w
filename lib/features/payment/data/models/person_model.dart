import 'package:flutter/foundation.dart';

class Person {
  final String label;
  final String price;
  final ValueNotifier<int> countNotifier;

  Person({
    required this.label,
    required this.price,
    required this.countNotifier,
  });
}

final List<Person> people = [
  Person(
    label: "Baby",
    price: "20 EGP from 8 to 13 (year)",
    countNotifier: ValueNotifier<int>(0),
  ),
  Person(
    label: "Child",
    price: "30 EGP from 14 to 19 (year)",
    countNotifier: ValueNotifier<int>(0),
  ),
  Person(
    label: "Adult",
    price: "50 EGP from 20 to 50 (year)",
    countNotifier: ValueNotifier<int>(0),
  ),
];
final List<Person> additionalService = [
  Person(
    label: "Dinner",
    price: "A Dinner meal in 5 starts\n resturant",
    countNotifier: ValueNotifier<int>(0),
  ),
  Person(
    label: "Bus",
    price: "A Bus to drive you to your\n destination ",
    countNotifier: ValueNotifier<int>(0),
  ),
  Person(
    label: "Adult",
    price: "50 EGP From 20 to 50 (year)",
    countNotifier: ValueNotifier<int>(0),
  ),
];
